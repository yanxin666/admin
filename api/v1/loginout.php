<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class loginout extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//退出APP登录
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$userid = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_out = "update oa_user set is_login='0' where id='{$userid}'";
		$ob_out = $this -> db -> query($sql_out);
		if($ob_out){
			Response::getInstance() -> show('200', 'success', '退出成功', 'json');
		}else{
			Response::getInstance() -> show('400', '退出失败');exit;
		}	
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new loginout();
$obj -> $action();