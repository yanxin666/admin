<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class entrytime extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看入职天数
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
		$sql_entrytime = "select entrytime from oa_user where lejumail='$mail'"; 
		$entrytime_ob = $this -> db -> query($sql_entrytime);
		$entrytime = $entrytime_ob -> fetch();
		if(empty($entrytime)){
			Response::getInstance() -> show('400', '暂无入职时间');exit;
		}else{
			$now = strtotime(date("Y-m-d",time()));
			$before = strtotime($entrytime['entrytime']);
			$mistiming = $now-$before;
			if($mistiming == 0){
				$time = 1;
			}else{
				$time = ($now-$before)/86400;
			}
			Response::getInstance() -> show('200', 'success', $time, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new entrytime();
$obj -> $action();