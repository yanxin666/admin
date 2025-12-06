<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class checkemail extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	function test(){
		$host = "smtp.leju.com";
		$port = 25;
		$user = 'xinlei6@leju.com';
		$pass = 'xinlei57804';
	
		$res = $this -> check_email_password2($host, $port, $user, $pass);
		echo $res,PHP_EOL;
	}
	
	//验证方法
	function check_email_password2($host, $port, $user, $pass){
		//创建sock链接
		if (! $sock = fsockopen($host, $port, $errno, $errstr, 100) ){
			return 'fsockopen_error';
		}
	
		if ( strstr($err_msg = fgets($sock), '220') ){
			//开启握手
			fwrite($sock, "HELO $host\r\n");
			if ( !strstr($err_msg = fgets($sock), '250') ){
				return 'helo_error';
			}
			//开始登陆验证命令
			fwrite($sock, "AUTH LOGIN\r\n");
			if ( !strstr($err_msg = fgets($sock), '334') ){
				return 'auth_error';
			}
			//输入用户名命令
			fwrite($sock, base64_encode($user)."\r\n");
			if ( !strstr($err_msg = fgets($sock), '334') ){
				// 				echo $err_msg;
				return 'username_error';
			}
			//输入密码命令
			fwrite($sock, base64_encode($pass)."\r\n");
			if ( !strstr($err_msg = fgets($sock), '235') ){
				return 'password_error';
			}
			echo $user.','.$pass.','.trim($err_msg);
			return 'success';
		}
	}
	
	//登录邮箱验证
	function index(){
// 		验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
// 		验证token加密 END
		$host = "smtp.leju.com";
		$port = 25;
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$pass = trim($_REQUEST['password']) ? trim($_REQUEST['password']) : '';
		if ($pass){
			$aes =  Aes_encrypt::getInstance();
			$aes -> setKey('lejuchoujianghdy');
			$pass = $aes -> decode($pass);
		}
		$res = check_email_password($host, $port, $email, $pass);
		if($res == 'helo_error'){
			Response::getInstance() -> show('400', '握手失败');exit;
		}else if($res == 'auth_error'){
			Response::getInstance() -> show('400', '登陆验证失败');exit;
		}else if($res == 'username_error'){
			Response::getInstance() -> show('400', '用户名不存在');exit;
		}else if($res == 'password_error'){
			Response::getInstance() -> show('400', '用户名或密码错误');exit;
		}else if($res == 'success'){
			$tongxulu_obj = new Tongxunlu();
			$userinfo = $tongxulu_obj -> get_user_data($email);
			if(!empty($userinfo)){
				$userid = $userinfo['id'];
				$sql_login = "update oa_user set is_login='1' where id='{$userid}'";
				$ob_login = $this -> db -> query($sql_login);
				if($ob_login){
					Response::getInstance() -> show('200', 'success', $userinfo, 'json');
				}else{
					Response::getInstance() -> show('400', '未知错误3');exit;
				}
			}else{
				$tar_user = $tongxulu_obj -> login_txl($email);
				if ($tar_user['status']){
					$userid = $tar_user['data']['id'];
					$sql_login = "update oa_user set is_login='1' where id='{$userid}'";
					$ob_login = $this -> db -> query($sql_login);
					if($ob_login){
						Response::getInstance() -> show('200', 'success', $tar_user['data'], 'json');
					}else{
						Response::getInstance() -> show('400', '未知错误4');exit;
					}
				}else {
					Response::getInstance() -> show('400', $tar_user['mesg']);exit;
				}
			}
		}else{
			Response::getInstance() -> show('400', '未知错误2');exit;
		}
	}
	
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new checkemail();
$obj -> $action();