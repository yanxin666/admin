<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class view extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//添加意见反馈
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
		$content = trim($_REQUEST['content']) ? trim($_REQUEST['content']) : '';
		$createtime = date("Y-m-d H:i:s",time());
		$sql_view = "insert into oa_view(email, content, createtime) values('$email', '$content', '$createtime')"; 
		$view_ob = $this -> db -> query($sql_view);
		if($view_ob){
			Response::getInstance() -> show('200', 'success', '意见反馈成功', 'json');
		}else{
			Response::getInstance() -> show('400', '意见反馈失败');exit;
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new view();
$obj -> $action();