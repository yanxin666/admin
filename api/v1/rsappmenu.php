<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class rsappmenu extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看人事菜单
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_rsappmenu = "select id, title, createtime from oa_rsappmenu where status=1"; 
		$rsappmenu_ob = $this -> db -> query($sql_rsappmenu);
		$rsappmenu = $rsappmenu_ob -> fetchAll();
		if(empty($rsappmenu)){
			Response::getInstance() -> show('400', '暂无人事菜单');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $rsappmenu, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new rsappmenu();
$obj -> $action();