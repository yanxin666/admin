<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class savenote extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//发送已读通知id
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
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_notify = "select list from oa_savenote where userid='$userid'";
			$ob_notify = $this -> db -> query($sql_notify);
			$notify = $ob_notify -> fetch();
			if(empty($notify['list'])){
				$data = null;
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				$array = explode(',',$notify['list']);
				if(in_array('null',$array)){
					$unset = array_search('null',$array);
					unset($array[$unset]);
					$data = implode(',',$array);
				}else{
					$data = $notify['list'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//记录已读通知id
	function getid(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = trim($_REQUEST['id']) ? trim($_REQUEST['id']) : '';
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_notify = "select list from oa_savenote where userid='$userid'";
			$ob_notify = $this -> db -> query($sql_notify);
			$notify = $ob_notify -> fetch();
			if(empty($notify['list'])){
				$sql_add = "update oa_savenote set list='$id' where userid='$userid'";
				$ob_add = $this -> db -> query($sql_add);
				if($ob_add>0){
					Response::getInstance() -> show('200', 'success', '录入成功', 'json');
				}else{
					Response::getInstance() -> show('400', '录入失败');exit;
				}
			}else{
				$string = $notify['list'].','.$id;
				$idarray = explode(',',$string);
				$resarray = array_unique($idarray);
				$list = implode(',',$resarray);
				$sql_add = "update oa_savenote set list='$list' where userid='$userid'";
				$ob_add = $this -> db -> query($sql_add);
				if($ob_add>0){
					Response::getInstance() -> show('200', 'success', '录入成功', 'json');
				}else{
					Response::getInstance() -> show('400', '录入失败');exit;
				}
			}
		}
	}
	
	//发送所有大通知id
	function allid(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_notifyid = "select id from oa_notify where whose='1'";
		$ob_notifyid = $this -> db -> query($sql_notifyid);
		$notifyid = $ob_notifyid -> fetchAll();
		if(empty($notifyid)){
			$data = null;
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}else{
			$idlist = '';
			foreach($notifyid as $v){
				$idlist .= $v['id'].',';
			}
			$idlist = rtrim($idlist,',');
			Response::getInstance() -> show('200', 'success', $idlist, 'json');
		}
	}
	
	//发送人事已读通知id
	function rsid(){
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
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_rsnotify = "select rslist from oa_savenote where userid='$userid'";
			$ob_rsnotify = $this -> db -> query($sql_rsnotify);
			$rsnotify = $ob_rsnotify -> fetch();
			if(empty($rsnotify['rslist'])){
				$data = null;
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				$array = explode(',',$rsnotify['rslist']);
				if(in_array('null',$array)){
					$unset = array_search('null',$array);
					unset($array[$unset]);
					$data = implode(',',$array);
				}else{
					$data = $rsnotify['rslist'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//记录人事已读通知id
	function getrsid(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = trim($_REQUEST['id']) ? trim($_REQUEST['id']) : '';
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_notify = "select rslist from oa_savenote where userid='$userid'";
			$ob_notify = $this -> db -> query($sql_notify);
			$notify = $ob_notify -> fetch();
			if(empty($notify['rslist'])){
				$sql_add = "update oa_savenote set rslist='$id' where userid='$userid'";
				$ob_add = $this -> db -> query($sql_add);
				if($ob_add>0){
					Response::getInstance() -> show('200', 'success', '录入成功', 'json');
				}else{
					Response::getInstance() -> show('400', '录入失败');exit;
				}
			}else{
				$string = $notify['rslist'].','.$id;
				$idarray = explode(',',$string);
				$resarray = array_unique($idarray);
				$list = implode(',',$resarray);
				$sql_add = "update oa_savenote set rslist='$list' where userid='$userid'";
				$ob_add = $this -> db -> query($sql_add);
				if($ob_add>0){
					Response::getInstance() -> show('200', 'success', '录入成功', 'json');
				}else{
					Response::getInstance() -> show('400', '录入失败');exit;
				}
			}
		}
	}
	
	//发送所有人事通知id
	function allrsid(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_rsnotifyid = "select id from oa_notify where whose='3'";
		$ob_rsnotifyid = $this -> db -> query($sql_rsnotifyid);
		$rsnotifyid = $ob_rsnotifyid -> fetchAll();
		if(empty($rsnotifyid)){
			$data = null;
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}else{
			$idlist = '';
			foreach($rsnotifyid as $v){
				$idlist .= $v['id'].',';
			}
			$idlist = trim($idlist,',');
			Response::getInstance() -> show('200', 'success', $idlist, 'json');
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new savenote();
$obj -> $action();