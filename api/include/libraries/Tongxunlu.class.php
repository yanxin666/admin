<?php
class Tongxunlu{
	
	private $db;
	private $memcache;
	
	function __construct(){
		$this -> db = dataMamagerFactory::getInstance() -> getObjects('mysqlPdoFactory');
		$this -> memcache = dataMamagerFactory::getInstance() -> getObjects('memcacheFactory');
	}
	
	/**
	 * 通讯了接口查询数据
	 * @param string $keywords
	 * @param string $type
	 * @return Array $result
	 */
	public function auto_tongxunlu($keywords, $type=""){
		$http = "http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords={$keywords}";
		$users = json_decode(file_get_contents($http),true);
		if(!isset($users['status']) && !isset($users['info'])){
			$count = count($users);
			
			$sql_add_user = "REPLACE into oa_user (id, username, lejumail, sno, fullname, city, dept, depart_name, lft, rgt, wtype, tel, mobile, ctype, position, status, birthday, work_position, city_true, mailname, role_id, weibo, is_exists, wmh, pic_path) values";
			$sql_linkman = "REPLACE into oa_linkman (userid) values";
			
			$sql_add_user_pin = "";
			$sql_linkman_pin = "";
			$alluser = $this -> getAlluser_mem();
			for($i=0;$i<$count;$i++){
				@$data[$i]['id'] = trim($users[$i]['id']);
				@$data[$i]['username'] = trim($users[$i]['username']);
				@$data[$i]['lejumail'] = trim($users[$i]['lejumail']) ? trim($users[$i]['lejumail']) : trim($users[$i]['username']);
				@$data[$i]['sno'] = trim($users[$i]['sno']);
				@$data[$i]['fullname'] = trim($users[$i]['fullname']);
				@$data[$i]['city'] = trim($users[$i]['city']);
				@$data[$i]['dept'] = trim($users[$i]['dept']);
				@$data[$i]['lft'] = trim($users[$i]['lft']);
				@$data[$i]['rgt'] = trim($users[$i]['rgt']);
				@$data[$i]['wtype'] = trim($users[$i]['wtype']);
				@$data[$i]['tel'] = trim($users[$i]['tel']);
				@$data[$i]['mobile'] = trim($users[$i]['mobile']);
				@$data[$i]['ctype'] = trim($users[$i]['ctype']);
				@$data[$i]['position'] = trim($users[$i]['position']);
				@$data[$i]['status'] = trim($users[$i]['status']);
				@$data[$i]['birthday'] = trim($users[$i]['birthday']);
				@$data[$i]['work_position'] = trim($users[$i]['work_position']);
				@$data[$i]['city_true'] = trim($users[$i]['city_true']);
				@$data[$i]['mailname'] = trim($users[$i]['mailname']);
				@$data[$i]['role_id'] = trim($users[$i]['role_id']);
				@$data[$i]['weibo'] = trim($users[$i]['weibo']);
				@$data[$i]['is_exists'] = trim($users[$i]['is_exists']);
				@$data[$i]['wmh'] = trim($users[$i]['wmh']);
				@$data[$i]['depart_name'] = $users[$i]['depart_name'];
				//头像处理 Start
				
				if ($akey = array_search($data[$i]['sno'], $alluser['snos'])){
					$data[$i]['pic_path'] = $alluser['pics'][$akey];
				}else {
					if(!empty($users[$i]['pic_path'])){
						$file = $this -> get_curl('http://new.intra.leju.com'.trim($users[$i]['pic_path']));
						$string = time().rand(1000,9999).'.jpg';
						$mdir = 'thumb_img';
						if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$mdir)){
							mkdir($_SERVER['SINASRV_DATA_DIR'].$mdir);
						}
						$newfiles = $_SERVER['SINASRV_DATA_DIR'].$mdir.'/'.$string;
						$newfile = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $newfiles));
						file_put_contents($newfiles,$file);
						@$data[$i]['pic_path'] = $newfile;
						usleep(150000);
					}else{
						@$data[$i]['pic_path'] = trim($users[$i]['pic_path']);
					}
					//插入
					$sql_add_user_pin .="('{$data[$i]['id']}','{$data[$i]['username']}','{$data[$i]['lejumail']}','{$data[$i]['sno']}','{$data[$i]['fullname']}','{$data[$i]['city']}','{$data[$i]['dept']}','{$data[$i]['depart_name']}','{$data[$i]['lft']}','{$data[$i]['rgt']}','{$data[$i]['wtype']}','{$data[$i]['tel']}','{$data[$i]['mobile']}','{$data[$i]['ctype']}','{$data[$i]['position']}','{$data[$i]['status']}','{$data[$i]['birthday']}','{$data[$i]['work_position']}','{$data[$i]['city_true']}','{$data[$i]['mailname']}','{$data[$i]['role_id']}','{$data[$i]['weibo']}','{$data[$i]['is_exists']}','{$data[$i]['wmh']}','{$data[$i]['pic_path']}'),";
					$sql_linkman_pin .= "('{$data[$i]['id']}'),";
				}
				//头像处理 End
				
			}
			if (trim($sql_add_user_pin) && trim($sql_linkman_pin)){
				$this -> db -> beginTransaction();
				$sql_add_user = rtrim($sql_add_user . $sql_add_user_pin, ',');
				$ob_add = $this -> db -> exec($sql_add_user);
				$sql_linkman = rtrim($sql_linkman . $sql_linkman_pin, ',');
				$ob_linkman = $this -> db -> exec($sql_linkman);			
				if($ob_add && $ob_linkman){
					$this -> db -> commit();
				}else{
					$this -> db -> rollBack();
				}
			}
			$result = array('status' => true, 'data' => $data);
		}else{
			$result = array('status' => false, 'mesg' => '用户不存在');
		}
		return $result;
	}
	
	function getAlluser_mem(){
		$memeche_key = $_SERVER['SINASRV_MEMCACHED_KEY_PREFIX'] . "allusers";
		$alluser_mem = $this -> memcache -> get($memeche_key);
		if (empty($alluser_mem)){
			$sql_user = "select sno, pic_path from oa_user;";
			$allusers_ob = $this -> db -> query($sql_user);
			$allusers = $allusers_ob -> fetchAll();
			$tar_arr = array();
			foreach ($allusers as $user){
				$tar_arr['snos'][] = $user['sno'];
				$tar_arr['pics'][] = $user['pic_path'];
			}
			$this -> memcache -> add( $memeche_key, $tar_arr, 0, 3600 );
			$alluser_mem = $this -> memcache -> get($memeche_key);
		}

		return $alluser_mem;
	}
	
	function get_curl($url){
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_TIMEOUT, '3');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$redata = curl_exec($ch);
		curl_close($ch);
		return $redata;
	}
	
	/**
	 * 通过邮箱获取用户信息(id)
	 * @param string $email 用户邮箱
	 * @return id integer
	 */
	function get_user_data($email){
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id, sno, lejumail, mailname from oa_user where lejumail='{$mail}' and mailname='{$mailname}'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		return $user;
	}
	
	
	/**
	 * 通过邮箱获取用户信息(id, 工号, 邮箱, 名称, 图片)
	 * @param string $email
	 * @return Array $result
	 */
	function login_txl($email){
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$target = $this -> auto_tongxunlu($mail);
		if ($target['status']){
			$tar_user = array();
			foreach ($target['data'] as $users){
				if( $users['mailname'] == $mailname && ($users['username'] == $mail || $users['lejumail'] == $mail) ){
					$tar_user['id'] = $users['id'];
					$tar_user['sno'] = $users['sno'];
					$tar_user['lejumail'] = $users['lejumail'];
					$tar_user['mailname'] = $users['mailname'];
					$tar_user['email'] = $users['lejumail'].$users['mailname'];
					$tar_user['fullname'] = $users['fullname'];
					if(!empty($users['pic_path'])){
						$tar_user['pic_path'] = 'http://lejutong.leju.com/'.$users['pic_path'];
					}else{
						$tar_user['pic_path'] = $users['pic_path'];
					}
				}
			}
			$result = empty($tar_user) ? array('status' => false, 'mesg' => '用户不存在2') : array('status' => true, 'data' => $tar_user);
		}else {
			$result = array('status' => false, 'mesg' => $target['mesg']);
		}
		return $result;
	}
	
	/**
	 * 获取通讯录memcache结果集
	 * @param unknown $keywords
	 * @return unknown
	 */
	function get_search_txl($keywords){
		$memeche_key = $_SERVER['SINASRV_MEMCACHED_KEY_PREFIX'] . "txlu_" . md5($keywords);
		$target_mem = @$this -> memcache -> get($memeche_key);
		if (empty($target_mem)){
			$target = $this -> auto_tongxunlu($keywords);
			if ($target['status']){
				$datas = array();
				foreach ($target['data'] as $ukey => $users_mem){
					$datas[$ukey]['id'] = trim($users_mem['id']);
					$datas[$ukey]['username'] = trim($users_mem['username']);
					$datas[$ukey]['fullname'] = trim($users_mem['fullname']);
					$datas[$ukey]['tel'] = trim($users_mem['tel']);
					$datas[$ukey]['mobile'] = trim($users_mem['mobile']);
					$datas[$ukey]['depart_name'] = trim($users_mem['depart_name']);
					$datas[$ukey]['lejumail'] = trim($users_mem['lejumail']) ? trim($users_mem['lejumail']) : trim($users_mem['username']);
					$datas[$ukey]['email'] = $datas[$ukey]['lejumail'] . trim($users_mem['mailname']);
					if(!empty($users_mem['pic_path'])){
						$datas[$ukey]['pic_path'] = 'http://lejutong.leju.com/'.trim($users_mem['pic_path']);
					}else{
						$datas[$ukey]['pic_path'] = trim($users_mem['pic_path']);
					}
				}
				$this -> memcache -> add( $memeche_key, $datas, 0, 604800 );
				$target_mem = $this -> memcache -> get($memeche_key);
			}elseif ($target['mesg'] == '用户不存在'){
				$this -> memcache -> add( $memeche_key, $target['mesg'], 0, 10 );
				$target_mem = $this -> memcache -> get($memeche_key);
			}
		}
		return $target_mem;
	}
}
