<?php
define("xinlangAPI", true);
// ini_set("display_errors","On");
// error_reporting(E_ALL);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class loginpayment extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//验证薪酬跳转页面
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
		$sql_email = "select password from oa_payment where email='{$email}'";
		$ob_email = $this -> db -> query($sql_email);
		$emails = $ob_email -> fetch();
		if(empty($emails['password'])){
			$set = 2;
			Response::getInstance() -> show('200', 'success', $set, 'json');
		}else{
			$set = 1;
			Response::getInstance() -> show('200', 'success', $set, 'json');
		}
	}
	
	//设置薪酬密码
	function set(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$pass = trim($_REQUEST['password']) ? trim($_REQUEST['password']) : '';
		if ($pass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$pass = $aes -> decode($pass);
			$pass = md5($pass);
		}
		$sql_check = "select password from oa_payment where email='{$email}'";
		$ob_check = $this -> db -> query($sql_check);
		$check = $ob_check -> fetch();
		if(!empty($check['password'])){
			Response::getInstance() -> show('400', '请勿重复设置');exit;
		}else{
			$sql_payment = "insert into oa_payment(email, password) values('$email','$pass')";
			$payment_ob = $this -> db -> query($sql_payment);
			if($payment_ob){
				Response::getInstance() -> show('200', 'success', '薪酬密码设置成功', 'json');
			}else{
				Response::getInstance() -> show('400', '薪酬密码设置失败');exit;
			}
		}
	}
	
	//登录查看薪酬
	function check(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$pass = trim($_REQUEST['password']) ? trim($_REQUEST['password']) : '';
		if ($pass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$pass = $aes -> decode($pass);
			$pass = md5($pass);
		}
		$sql_email = "select email, password from oa_payment where email='$email'";
		$ob_email = $this -> db -> query($sql_email);
		$emails = $ob_email -> fetch();
		if(empty($emails['email'])){
			Response::getInstance() -> show('400', '帐号不存在');exit;
		}else{
			if($pass != $emails['password']){
				Response::getInstance() -> show('400', '密码错误');exit;
			}else{
				Response::getInstance() -> show('200', 'success', '登录成功', 'json');
			}
		}
	}
	
	//修改薪酬密码
	function edit(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$oldpass = trim($_REQUEST['oldpass']) ? trim($_REQUEST['oldpass']) : '';
		if ($oldpass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$oldpass = $aes -> decode($oldpass);
			$oldpass = md5($oldpass);
		}
		$newpass = trim($_REQUEST['newpass']) ? trim($_REQUEST['newpass']) : '';
		if ($newpass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$newpass = $aes -> decode($newpass);
			$newpass = md5($newpass);
		}
		$sql_email = "select password from oa_payment where email='$email'";
		$ob_email = $this -> db -> query($sql_email);
		$emails = $ob_email -> fetch();
		if(empty($emails['password'])){
			Response::getInstance() -> show('400', '尚未设置薪酬密码');exit;
		}else{
			if($oldpass != $emails['password']){
				Response::getInstance() -> show('400', '原密码填写错误');exit;
			}else{
				$sql_pass = "update oa_payment set password='$newpass' where email='$email'";
				$ob_pass = $this -> db ->query($sql_pass);
				if($ob_pass){
					Response::getInstance() -> show('200', 'success', '密码修改成功', 'json');
				}else{
					Response::getInstance() -> show('400', '密码修改失败');exit;
				}
			}
		}
	}
	
	//忘记薪酬密码验证
// 	function forgetpass(){
// 		//验证token加密 START
// 		$withoutkey = array('action','token');
// 		if (!check_token($withoutkey, $_POST)){
// 			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
// 			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
// 		}
// 		//验证token加密 END
// 		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
// 		$sql_email = "select password from oa_user where email='$email'";
// 		$ob_email = $this -> db -> query($sql_email);
// 		$emails = $ob_email -> fetch();
// 		if(empty($emails['password'])){
// 			Response::getInstance() -> show('400', '尚未设置薪酬密码');exit;
// 		}else{
// 			Response::getInstance() -> show('200', 'success', '请继续邮件验证', 'json');
// 		}
// 	}
	
	//重置薪酬密码
	function resetpass(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$pass = trim($_REQUEST['password']) ? trim($_REQUEST['password']) : '';
		if ($pass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$pass = $aes -> decode($pass);
			$pass = md5($pass);
		}
		$sql_payment = "insert into oa_payment(email, password) values('{$email}', '{$pass}')";
		$payment_ob = $this -> db -> query($sql_payment);
		if($payment_ob){
			Response::getInstance() -> show('200', 'success', '薪酬密码设置成功', 'json');
		}else{
			Response::getInstance() -> show('400', '薪酬密码设置失败');exit;
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new loginpayment();
$obj -> $action();