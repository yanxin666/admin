<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class linkman extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//常用联系人列表
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 1;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='{$mail}' and mailname='{$mailname}'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取个人信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_linkman = "select userlist from oa_linkman where userid='{$userid}'";
			$ob_linkman = $this -> db -> query($sql_linkman);
			$linkman = $ob_linkman -> fetch();
			if(empty($linkman['userlist'])){
				Response::getInstance() -> show('400', '暂无常用联系人');exit;
			}else{
				$linkmans = $linkman['userlist'];
				$nums = explode(',',$linkmans);
				$num = count($nums);
				$sql_show = "u.id, u.fullname, o.depart_name, u.mobile, u.tel, u.lejumail, u.mailname, u.pic_path";
				$sql_mans = "select {$sql_show} from oa_user as u left join oa_org as o on u.dept=o.old_exits_id ";
				$sql_mans .= "where u.id in($linkmans) and u.userid != '1' order by u.id asc limit ".($curr_page-1)*$length.','.$length;
				$mans_ob = $this -> db -> query($sql_mans);
				$mans = $mans_ob -> fetchAll();
				if(!empty($mans)){
					$mans_num = count($mans);
					for($i=0;$i<$mans_num;$i++){
						if(in_array($mans[$i]['id'],$nums)){
							@$data[$i]['num'] = $num;
							@$data[$i]['id'] = $mans[$i]['id'];
							@$data[$i]['fullname'] = $mans[$i]['fullname'];
							@$data[$i]['depart_name'] = $mans[$i]['depart_name'];
							@$data[$i]['tel'] = $mans[$i]['tel'];
							@$data[$i]['mobile'] = $mans[$i]['mobile'];
							@$data[$i]['email'] = $mans[$i]['lejumail'].$mans[$i]['mailname'];
							if(!empty($mans[$i]['pic_path'])){
								@$data[$i]['pic_path'] = 'http://lejutong.leju.com/'.$mans[$i]['pic_path'];
							}else{
								@$data[$i]['pic_path'] = $mans[$i]['pic_path'];
							}
						}
					}
					$data = array_merge($data);
					Response::getInstance() -> show('200', 'success', $data, 'json');
				}else{
					Response::getInstance() -> show('400', '常用联系人请求失败');exit;
				}
			}
		}	
	}
	
	//常用联系人搜索
	function cysearch(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 1;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$search = trim($_REQUEST['search']) ? trim($_REQUEST['search']) : '';
		$search = strtolower($search);
		//验证搜索参数 START
		$checkwords = keywords($search);
		if($checkwords == 1){
			Response::getInstance() -> show('400', '数字搜索不少于四位');exit;
		}else if($checkwords == 2){
			Response::getInstance() -> show('400', '字母搜索不少于两位');exit;
		}
		//验证搜索参数END
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取个人信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_linkman = "select userlist from oa_linkman where userid='$userid'";
			$ob_linkman = $this -> db -> query($sql_linkman);
			$linkman = $ob_linkman -> fetch();
			if(empty($linkman['userlist'])){
				Response::getInstance() -> show('400', '暂无常用联系人');exit;
			}else{
				$linkmans = $linkman['userlist'];
				$sql_show = "u.id, u.fullname, o.depart_name, u.mobile, u.tel, u.lejumail, u.mailname, u.pic_path";
				$sql_mans = "select {$sql_show} from oa_user as u left join oa_org as o on u.dept=o.old_exits_id ";
				$sql_mans .= "where u.id in($linkmans) and u.userid != '1' and "; 
				$sql_mans .= "(u.fullname like '%{$search}%' or u.lejumail like '%{$search}%' or u.mobile like '%{$search}%' or u.tel like '%{$search}%') order by u.id asc limit ".($curr_page-1)*$length.','.$length;
				$mans_ob = $this -> db -> query($sql_mans);
				$mans = $mans_ob -> fetchAll();
				if(!empty($mans)){
					$mans_num = count($mans);
					$limitid = explode(',',$linkmans);
					for($i=0;$i<$mans_num;$i++){
						if(in_array($mans[$i]['id'],$limitid)){
							@$data[$i]['id'] = $mans[$i]['id'];
							@$data[$i]['fullname'] = $mans[$i]['fullname'];
							@$data[$i]['depart_name'] = $mans[$i]['depart_name'];
							@$data[$i]['tel'] = $mans[$i]['tel'];
							@$data[$i]['mobile'] = $mans[$i]['mobile'];
							@$data[$i]['email'] = $mans[$i]['lejumail'].$mans[$i]['mailname'];
							if(!empty($mans[$i]['pic_path'])){
								@$data[$i]['pic_path'] = 'http://lejutong.leju.com/'.$mans[$i]['pic_path'];
							}else{
								@$data[$i]['pic_path'] = $mans[$i]['pic_path'];
							}
						}
					}
					$data = array_merge($data);
					if(empty($data)){
						$data = array();
					}
					Response::getInstance() -> show('200', 'success', $data, 'json');
				}else{
					Response::getInstance() -> show('400', '暂无此常用联系人');exit;
				}
			}
		}
		
	}
	
	//常用联系人详情
	function cydetail(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_mans = "select u.id, u.fullname, o.depart_name, u.mobile, u.tel, u.lejumail, u.mailname, u.city_true, u.pic_path from oa_user as u left join oa_org as o on u.dept=o.old_exits_id where u.id='$id'";
		$mans_ob = $this -> db -> query($sql_mans);
		$mans = $mans_ob -> fetch();
		if(!empty($mans['id'])){
				@$data['id'] = $mans['id'];
				@$data['fullname'] = $mans['fullname'];
				@$data['depart_name'] = $mans['depart_name'];
				@$data['tel'] = $mans['tel'];
				@$data['mobile'] = $mans['mobile'];
				@$data['email'] = $mans['lejumail'].$mans['mailname'];
				@$data['city_true'] = $mans['city_true'];
				if(!empty($mans['pic_path'])){
					@$data['pic_path'] = 'http://lejutong.leju.com/'.$mans['pic_path'];
				}else{
					@$data['pic_path'] = $mans['pic_path'];
				}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}else{
			Response::getInstance() -> show('400', '联系人详情请求失败');exit;
		}
	}
	
	//删除常用联系人
	function cydel(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='{$mail}' and mailname='{$mailname}'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取个人信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_linkman = "select userlist from oa_linkman where userid='{$userid}'";
			$ob_linkman = $this -> db -> query($sql_linkman);
			$linkman = $ob_linkman -> fetch();
			if(empty($linkman['userlist'])){
				Response::getInstance() -> show('400', '未知错误1');exit;
			}else{
				$string = $linkman['userlist'];
				if(strpos($string,',') == false){
					$sql_del = "update oa_linkman set userlist='' where userid='{$userid}'";
					$ob_del = $this -> db -> query($sql_del);
					if($ob_del){
						Response::getInstance() -> show('200', 'success', '删除成功', 'json');
					}else{
						Response::getInstance() -> show('400', '删除失败');exit;
					}
				}else{
					$array = explode(",",$string);
					if(in_array($id, $array)){
						unset($array[array_search($id,$array)]);
						$res = implode(",",$array);
						$sql_del = "update oa_linkman set userlist='{$res}' where userid='{$userid}'";
						$ob_del = $this -> db -> query($sql_del);
						if($ob_del){
							Response::getInstance() -> show('200', 'success', '删除成功', 'json');
						}else{
							Response::getInstance() -> show('400', '删除失败');exit;
						}
					}else{
						Response::getInstance() -> show('400', '未知错误2');exit;
					}
				}
			}
		}
		
	}
	
	//联系人搜索页搜索
	function search(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 1;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$keywords = trim($_REQUEST['keywords']) ? trim($_REQUEST['keywords']) : '';
		$keywords = strtolower($keywords);
		//验证搜索参数 START
		$checkwords = keywords($keywords);
		if($checkwords == 1){
			Response::getInstance() -> show('400', '数字搜索不少于四位');exit;
		}else if($checkwords == 2){
			Response::getInstance() -> show('400', '字母搜索不少于两位');exit;
		}
		//验证搜索参数END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$tongxulu_obj = new Tongxunlu();
		$user = $tongxulu_obj -> get_user_data($email);
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取个人信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_linkman = "select userlist from oa_linkman where userid='{$userid}'";
			$ob_linkman = $this -> db -> query($sql_linkman);
			$linkman = $ob_linkman -> fetch();
			if(empty($linkman['userlist'])){
				$userlist = array($userid);
			}else{
				$userlist = explode(',', $linkman['userlist'] . ",{$userid}");
			}
			$txldata = $tongxulu_obj -> get_search_txl($keywords);
			if ($txldata){
				if(is_array($txldata)){
					$tar_arr = array();
					foreach ($txldata as $txl){
						if (!in_array($txl['id'], $userlist)){
							$tar_arr[] = $txl;
						}
					}
					$offset = ($curr_page - 1) * $length;
					$tar = array_slice($tar_arr, $offset, $length);
					if(!empty($tar)){
						Response::getInstance() -> show('200', 'success', $tar, 'json');
					}else{
						Response::getInstance() -> show('400', '未搜索到联系人');exit;
					}
				}else{
					Response::getInstance() -> show('400', '用户不存在');exit;
				}
			}else {
				Response::getInstance() -> show('400', 'database_error');exit;
			}
		}
	}
	
	//发邮件用户搜索
	function mailsearch(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 1;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$keywords = trim($_REQUEST['keywords']) ? trim($_REQUEST['keywords']) : '';
		$keywords = strtolower($keywords);
		//验证搜索参数 START
		$checkwords = keywords($keywords);
		if($checkwords == 1){
			Response::getInstance() -> show('400', '数字搜索不少于四位');exit;
		}else if($checkwords == 2){
			Response::getInstance() -> show('400', '字母搜索不少于两位');exit;
		}
		//验证搜索参数END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$tongxulu_obj = new Tongxunlu();
		$txldata = $tongxulu_obj -> get_search_txl($keywords);
		if ($txldata){
			if(is_array($txldata)){
				$offset = ($curr_page - 1) * $length;
				$tar = array_slice($txldata, $offset, $length);
				if(!empty($tar)){
					Response::getInstance() -> show('200', 'success', $tar, 'json');
				}else{
					Response::getInstance() -> show('400', '未搜索到联系人');exit;
				}
			}else{
				Response::getInstance() -> show('400', '用户不存在');exit;
			}
		}else {
			Response::getInstance() -> show('400', 'database_error');exit;
		}
	}
	
	//添加常用联系人
	function addfriend(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		
		$userid = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$tongxulu_obj = new Tongxunlu();
		$user = $tongxulu_obj -> get_user_data($email);
		if(!empty($user['id'])){
			$id = $user['id'];
			$sql_linkman = "select userlist from oa_linkman where userid='{$id}'";
			$ob_linkman = $this -> db -> query($sql_linkman);
			$linkman = $ob_linkman -> fetch();
			if(empty($linkman['userlist'])){
				$sql_add = "update oa_linkman set userlist='{$userid}' where userid='{$id}'";
				$ob_add = $this -> db -> query($sql_add);
				if($ob_add){
					Response::getInstance() -> show('200', 'success', '联系人添加成功', 'json');
				}else{
					Response::getInstance() -> show('400', '联系人添加失败');exit;
				}
			}else{
				if(strpos($linkman['userlist'],',') == true){
					$list = explode(",",$linkman['userlist']);
					if(in_array($userid,$list)){
						Response::getInstance() -> show('400', '联系人已存在');exit;
					}else{
						$link = $linkman['userlist'].",".$userid;
						$sql_add = "update oa_linkman set userlist='{$link}' where userid='{$id}'";
						$ob_add = $this -> db -> query($sql_add);
						if($ob_add){
							Response::getInstance() -> show('200', 'success', '联系人添加成功', 'json');
						}else{
							Response::getInstance() -> show('400', '联系人添加失败');exit;
						}
					}
				}else{
					$list = explode(",",$linkman['userlist']);
					if(in_array($userid,$list)){
						Response::getInstance() -> show('400', '联系人已存在');exit;
					}else{
						$link = $linkman['userlist'].",".$userid;
						$sql_add = "update oa_linkman set userlist='{$link}' where userid='{$id}'";
						$ob_add = $this -> db -> query($sql_add);
						if($ob_add){
							Response::getInstance() -> show('200', 'success', '联系人添加成功', 'json');
						}else{
							Response::getInstance() -> show('400', '联系人添加失败');exit;
						}
					}
				}
			}
		}else{
			Response::getInstance() -> show('400', '个人信息获取失败');exit;
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new linkman();
$obj -> $action();