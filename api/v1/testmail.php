<?php
define("xinlangAPI", true);
ini_set("display_errors","on");
error_reporting(E_ALL);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class testmail extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看网址推荐
	function index(){
		$to = '1396909386@qq.com';
		$subject = "乐居薪资密码安全验证";
		$content = "欢迎使用乐居帐号服务！<br /><br />";
		$content .= "你的登录账号是： {$to}<br /><br />";
		// $content .= "你的验证码是： {$getnum}<br /><br />";
		$content .= "本邮件是由系统自动发送，请勿直接回复！<br /><br />";
		$content .= "感谢您的支持！我们会努力做到最好！<br /><br />";
		if (mail_send($to, $subject, $content)) {
			Response::getInstance() -> show('200', 'success', '邮件发送成功，请查收！', 'json');
		} else {
			Response::getInstance() -> show('400', '邮件发送失败，请确认邮箱是否存在！');exit;
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new testmail();
$obj -> $action();