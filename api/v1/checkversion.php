<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class checkversion extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//版本验证
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$plat_form = trim($_REQUEST['plat_form']) ? trim($_REQUEST['plat_form']) : '';
		$version = trim($_REQUEST['version']) ? trim($_REQUEST['version']) : '';
		$sql_check = "select version, downloadurl from oa_version where plat_form='{$plat_form}' and status='1'";
		$ob_check = $this -> db -> query($sql_check);
		$ckeck = $ob_check -> fetch();
		if(!empty($ckeck['version'])){
			if($version != $ckeck['version']){
				$data['downloadurl'] = $ckeck['downloadurl'];
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				$data['nonewversion'] = $ckeck['version'];
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new checkversion();
$obj -> $action();