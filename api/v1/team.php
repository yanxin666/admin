<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class team extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看收藏组
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '用户不存在，无法查看');exit;
		}else{
			$id = $user['id'];
			$sql_team = "select id,team_name,team_man,linkid from oa_team where type='1' and whose='2' and createrid='$id'";
			$ob_team = $this -> db -> query($sql_team);
			$team = $ob_team -> fetchAll();
			if(empty($team)){
				Response::getInstance() -> show('400', '暂无收藏组');exit;
			}else{
				$length = count($team);
				for($i=0;$i<$length;$i++){
					@$data[$i]['id'] = $team[$i]['id'];
					@$data[$i]['team_name'] = $team[$i]['team_name'];
					@$data[$i]['team_man'] = $team[$i]['team_man'];
					@$data[$i]['linkid'] = $team[$i]['linkid'];
					if(strpos($team[$i]['team_man'],',') === true){
						@$data[$i]['num'] = count(explode(",",$team[$i]['team_man']));
					}else{
						@$data[$i]['num'] = 1;
					}
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}	
	}
	
	//添加收藏组
	function addshoucang(){
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
		$team_name = trim($_REQUEST['teamname']) ? trim($_REQUEST['teamname']) : '';
		$mobile = trim($_REQUEST['mobile']) ? trim($_REQUEST['mobile']) : '';
		$is_shoucang = is_numeric($_REQUEST['is_shoucang']) ? intval($_REQUEST['is_shoucang']) : 0;
		$creatertime = date("Y-m-d H:i:s",time());
		if(empty($id) || empty($email) || empty($team_name) || empty($mobile) || empty($is_shoucang)){
			Response::getInstance() -> show('400', '非法分组无法添加');exit;
		}else{
			$mail = substr($email,0,strpos($email,'@'));
			$mailname = substr($email,strpos($email,'@'),strlen($email));
			$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
			$ob_user = $this -> db -> query($sql_user);
			$user = $ob_user -> fetch();
			if(empty($user['id'])){
				Response::getInstance() -> show('400', '用户不存在，无法添加');exit;
			}else{
				$userid = $user['id'];
				$sql_create = "insert into oa_team(team_name, createrid, team_man, type, whose, linkid, creatertime) values('$team_name', '$userid', '$mobile', '1', '2', '$id', '$creatertime')";
				$ob_create = $this -> db -> query($sql_create);
				$sql_linkid = "update oa_team set is_shoucang='1' where id='$id'";
				$ob_linkid = $this -> db -> query($sql_linkid);
				if($ob_create && $ob_linkid){
					Response::getInstance() -> show('200', 'success', '创建成功', 'json');
				}else{
					Response::getInstance() -> show('400', '创建失败');exit;
				}
			}
		}
	}
	
	//收藏组页删除收藏组
	function scdel(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$linkid = is_numeric($_REQUEST['linkid']) ? intval($_REQUEST['linkid']) : 0;
		$sql_shoucang = "delete from oa_team where id='$id'";
		$ob_shoucang = $this -> db -> query($sql_shoucang);
		$sql_link = "update oa_team set is_shoucang='2' where id='$linkid'";
		$ob_link = $this -> db -> query($sql_link);
		if($ob_shoucang && $ob_link){
			Response::getInstance() -> show('200', 'success', '删除成功', 'json');
		}else{
			Response::getInstance() -> show('400', '删除失败');exit;
		}
	}
	
	//查看邮件组
	function youjian(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '用户不存在，无法查看');exit;
		}else{
			$sql_team = "select id,team_name,team_man from oa_team where type='2' and whose='1'";
			$ob_team = $this -> db -> query($sql_team);
			$team = $ob_team -> fetchAll();
			if(empty($team)){
				Response::getInstance() -> show('400', '暂无邮件组');exit;
			}else{
				$userid = $user['id'];
				$sql_idlist = "select linkid from oa_team where type='1' and whose='2' and createrid='$userid'";
				$ob_idlist = $this -> db -> query($sql_idlist);
				$idlist = $ob_idlist -> fetchAll();
				$list = array();
				foreach($idlist as $val){
					@$list[] = $val['linkid'];
				}
				$length = count($team);
				for($i=0;$i<$length;$i++){
					@$data[$i]['id'] = $team[$i]['id'];
					@$data[$i]['team_name'] = $team[$i]['team_name'];
					@$data[$i]['team_man'] = $team[$i]['team_man'];
					if(strpos($team[$i]['team_man'],',') === true){
						@$data[$i]['num'] = count(explode(",",$team[$i]['team_man']));
					}else{
						@$data[$i]['num'] = 1;
					}
					if(!empty($list) && in_array($team[$i]['id'],$list)){
						$data[$i]['shoucang'] = 1;
					}else{
						$data[$i]['shoucang'] = 2;
					}
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//邮件组页删除收藏组
	function yjdel(){
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
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '用户不存在');exit;
		}else{
			$userid = $user['id'];
			$sql_choucang = "select id from oa_team where type='1' and whose='2' and linkid='$id' and createrid='$userid'";
			$ob_shoucang = $this -> db -> query($sql_choucang);
			$shoucang = $ob_shoucang -> fetch();
			if(empty($shoucang['id'])){
				Response::getInstance() -> show('400', '该组尚未被收藏');exit;
			}else{
				$shoucangid = $shoucang['id'];
				$sql_del = "delete from oa_team where id='$shoucangid'";
				$ob_del = $this -> db -> query($sql_del);
				if($ob_del){
					Response::getInstance() -> show('200', 'success', '删除成功', 'json');
				}else{
					Response::getInstance() -> show('400', '删除失败');exit;
				}
			}
		}
	}
	
	//新建自定义组
	function createteam(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$team_name = trim($_REQUEST['teamname']) ? trim($_REQUEST['teamname']) : '';
		$mobile = trim($_REQUEST['mobile']) ? trim($_REQUEST['mobile']) : '';
		$creatertime = date("Y-m-d H:i:s",time());
		if(empty($email) || empty($team_name) || empty($mobile)){
			Response::getInstance() -> show('400', '创建失败');exit;
		}else{
			$mail = substr($email,0,strpos($email,'@'));
			$mailname = substr($email,strpos($email,'@'),strlen($email));
			$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
			$ob_user = $this -> db -> query($sql_user);
			$user = $ob_user -> fetch();
			if(empty($user['id'])){
				Response::getInstance() -> show('400', '用户不存在');exit;
			}else{
				$id = $user['id'];
				$sql_name = "select * from oa_team where type='3' and whose='2' and team_name='$team_name' and createrid='$id'";
				$ob_name = $this -> db -> query($sql_name);
				$name = $ob_name -> fetch();
				if(!empty($name['team_name'])){
					Response::getInstance() -> show('400', '组名已存在');exit;
				}else{
					$sql_create = "insert into oa_team(team_name, createrid, team_man, type, whose, is_shoucang, creatertime) values('$team_name', '$id', '$mobile', '3', '2', '2', '$creatertime')";
					$ob_create = $this -> db -> query($sql_create);
					if($ob_create){
						Response::getInstance() -> show('200', 'success', '创建成功', 'json');
					}else{
						Response::getInstance() -> show('400', '创建失败');exit;
					}
				}
			}
		}
	}
	
	//查看自定义组
	function zidingyi(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '用户不存在，无法查看');exit;
		}else{
			$userid = $user['id'];
			$sql_team = "select id,team_name,team_man,is_shoucang from oa_team where type='3' and whose='2' and createrid='$userid'";
			$ob_team = $this -> db -> query($sql_team);
			$team = $ob_team -> fetchAll();
			if(empty($team)){
				Response::getInstance() -> show('400', '暂无自定义组');exit;
			}else{
				$length = count($team);
				for($i=0;$i<$length;$i++){
					@$data[$i]['id'] = $team[$i]['id'];
					@$data[$i]['team_name'] = $team[$i]['team_name'];
					@$data[$i]['team_man'] = $team[$i]['team_man'];
					@$data[$i]['shoucang'] = $team[$i]['is_shoucang'];
					if(strpos($team[$i]['team_man'],',') === true){
						@$data[$i]['num'] = count(explode(",",$team[$i]['team_man']));
					}else{
						@$data[$i]['num'] = 1;
					}
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//自定义组页删除收藏组
	function zdydel(){
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
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '用户不存在');exit;
		}else{
			$userid = $user['id'];
			$sql_choucang = "select id from oa_team where type='1' and whose='2' and linkid='$id' and createrid='$userid'";
			$ob_shoucang = $this -> db -> query($sql_choucang);
			$shoucang = $ob_shoucang -> fetch();
			if(empty($shoucang['id'])){
				Response::getInstance() -> show('400', '该组尚未被收藏');exit;
			}else{
				$shoucangid = $shoucang['id'];
				$sql_del = "delete from oa_team where id='$shoucangid'";
				$ob_del = $this -> db -> query($sql_del);
				$sql_link = "update oa_team set is_shoucang='2' where id='$id'";
				$ob_link = $this -> db -> query($sql_link);
				if($ob_del && $ob_link){
					Response::getInstance() -> show('200', 'success', '删除成功', 'json');
				}else{
					Response::getInstance() -> show('400', '删除失败');exit;
				}
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new team();
$obj -> $action();