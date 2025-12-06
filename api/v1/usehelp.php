<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class usehelp extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看使用帮助
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_usehelp = "select id, title from oa_usehelp order by createtime desc"; 
		$usehelp_ob = $this -> db -> query($sql_usehelp);
		$usehelp = $usehelp_ob -> fetchAll();
		if(empty($usehelp)){
			Response::getInstance() -> show('400', '暂无信息');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $usehelp, 'json');
		}		
	}
	
	//查看使用帮助详情
	function details(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_usehelp = "select content from oa_usehelp where id='$id'";
		$ob_usehelp = $this -> db -> query($sql_usehelp);
		$usehelp = $ob_usehelp -> fetch();
		if(empty($usehelp['content'])){
			Response::getInstance() -> show('400', '暂无详情');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $usehelp, 'json');
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new usehelp();
$obj -> $action();