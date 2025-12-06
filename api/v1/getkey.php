<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class getkey extends baseclass implements baseInterface{
	
	function __construct(){
		// $open_system_os['need_db_connect'] = true;
		// $open_system_os['datamanagers'] = array('mysql');
		// parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//获取key
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$key = Aes_encrypt::getInstance() -> encode('lejuchoujianghdy');
		if(empty($key)){
			Response::getInstance() -> show('400', '获取失败');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $key, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new getkey();
$obj -> $action();