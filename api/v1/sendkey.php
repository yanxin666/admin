<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class sendkey extends baseclass implements baseInterface{
	
	function __construct(){
		// $open_system_os['need_db_connect'] = true;
		// $open_system_os['datamanagers'] = array('mysql');
		// parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	function index(){
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		if(empty($email)){
			Response::getInstance() -> show('400', '邮箱获取失败');exit;
		}else{
			$obj = Aes_encrypt::getInstance();
			$obj -> setKey('lejuchoujiang');
			$key = $obj -> encode($email);
			//$key = 'lejuchoujiang';
			if(empty($key)){
				Response::getInstance() -> show('400', '获取失败');exit;
			}else{
				Response::getInstance() -> show('200', 'success', $key, 'json');
			}
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new sendkey();
$obj -> $action();