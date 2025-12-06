<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class myinfo extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//个人资料
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
		$sql_info = "select u.id, u.fullname, o.depart_name, u.mobile, u.tel, u.lejumail, u.mailname, u.pic_path from oa_user as u left join oa_org as o on u.dept=o.old_exits_id where u.lejumail='$mail' and u.mailname='$mailname'";
		$info_ob = $this -> db -> query($sql_info);
		$info = $info_ob -> fetch();
		if(empty($info['id'])){
			Response::getInstance() -> show('400', '个人信息请求失败');exit;
		}else{
			@$data['id'] = $info['id'];
			@$data['fullname'] = $info['fullname'];
			@$data['depart_name'] = $info['depart_name'];
			@$data['tel'] = $info['tel'];
			@$data['mobile'] = $info['mobile'];
			@$data['email'] = $info['lejumail'].$info['mailname'];
			if(!empty($info['pic_path'])){
				@$data['pic_path'] = 'http://lejutong.leju.com/'.$info['pic_path'];
			}else{
				@$data['pic_path'] = $info['pic_path'];
			}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new myinfo();
$obj -> $action();