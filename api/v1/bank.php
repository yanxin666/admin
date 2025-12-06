<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class bank extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//银行卡信息
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_bank = "select id, name from oa_bank";
		$bank_ob = $this -> db -> query($sql_bank);
		$bank = $bank_ob -> fetchAll();
		if(empty($bank)){
			Response::getInstance() -> show('400', '银行卡信息请求失败');exit;
		}else{
			$count = count($bank);
			for($i=0;$i<$count;$i++){
				@$data[$i]['id'] = $bank[$i]['id'];
				@$data[$i]['name'] = $bank[$i]['name'];
			}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new bank();
$obj -> $action();