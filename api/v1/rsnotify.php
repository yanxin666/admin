<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class rsnotify extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看通知列表
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
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 5;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname' limit 1";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_all_notify = "select count(ns.notifysendid) from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='3' and (ns.notify_status = 1 or ns.notify_status = 2)";	
			$sql_show = "ns.read_status, n.id, n.title, n.time, n.send_dept";
			$sql_notify = "select {$sql_show}, ({$sql_all_notify}) as unread from oa_notify_senduser ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_notify .= "where ns.user_id='{$userid}' and (ns.notify_status = 1 or ns.notify_status = 2) ";
			$sql_notify .= "and n.whose='3' order by ns.sendtime desc limit ".($curr_page-1)*$length.','.$length;
			$notify_ob = $this -> db -> query($sql_notify);
			$notify = $notify_ob -> fetchAll();
			if(empty($notify)){
				Response::getInstance() -> show('400', '获取通知列表失败');exit;
			}else {
				Response::getInstance() -> show('200', 'success', $notify, 'json');
			}
		}
	}
	
	//通知搜索
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
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 5;
		$data = trim($_REQUEST['data']) ? trim($_REQUEST['data']) : '';
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_all_notify = "select count(ns.notifysendid) from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='3' and (ns.notify_status = 1 or ns.notify_status = 2)";
			$sql_show = "ns.read_status, n.id, n.title, n.time, n.send_dept";
			$sql_notify = "select {$sql_show}, ({$sql_all_notify}) as unread from oa_notify_senduser ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_notify .= "where ns.user_id='{$userid}' and (ns.notify_status = 1 or ns.notify_status = 2) ";
			$sql_notify .= "and n.whose='3' and (n.send_dept like '%{$data}%' or n.title like '%{$data}%') order by ns.sendtime desc limit ".($curr_page-1)*$length.','.$length;
			$notify_ob = $this -> db -> query($sql_notify);
			$notify = $notify_ob -> fetchAll();
			if(empty($notify)){
				Response::getInstance() -> show('400', '获取通知列表失败');exit;
			}else {
				Response::getInstance() -> show('200', 'success', $notify, 'json');
			}
		}
	}
	
	//查看通知详情
	function details(){
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
			$notifyid = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
			$sql_details = "select title, content, time, send_dept, viewcount from oa_notify where id='{$notifyid}'";
			$ob_details = $this -> db -> query($sql_details);
			$details = $ob_details -> fetch();
			if(empty($details['title'])){
				Response::getInstance() -> show('400', '暂无通知信息详情');exit;
			}else{
				$viewcount = $details['viewcount'] + 1;
				$sql_viewcount = "update oa_notify set viewcount='$viewcount' where id='{$notifyid}'";
				$ob_viewcount = $this -> db -> query($sql_viewcount);
				$sql_read = "update oa_notify_senduser set read_status='1', notify_status='2' where notify_id='{$notifyid}' and user_id='{$userid}'";
				$ob_read = $this -> db -> query($sql_read);
				if($ob_viewcount && $ob_read){
					Response::getInstance() -> show('200', 'success', $details, 'json');
				}else{
					Response::getInstance() -> show('400', '通知详情查看失败');exit;
				}
			}
		}
	}
	
	//获取通知总条数
	function num(){
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
			$sql_all_notify = "select count(ns.notifysendid) as num from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='3' and (ns.notify_status = 1 or ns.notify_status = 2)";
			$all_notify_ob = $this -> db -> query($sql_all_notify);
			$all_notify = $all_notify_ob -> fetch();
			if(empty($all_notify['num'])){
				$data = 0;
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				$data = $all_notify['num'];
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new rsnotify();
$obj -> $action();