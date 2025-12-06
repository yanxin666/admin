<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class getkey_erp extends baseclass implements baseInterface{
	
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
		$key = Aes_encrypt::getInstance() -> encode('lejuchoujiangerp');
		if(empty($key)){
			Response::getInstance() -> show('400', '获取失败');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $key, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new getkey_erp();
$obj -> $action();