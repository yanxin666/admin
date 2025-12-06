<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class sendmail extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql', 'memcache');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//发送邮件
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$to = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$to = decodemail($to);
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		
		$code = md5(microtime()); //微妙加密
		$getnum = substr(preg_replace('/\D/s', '', $code), 0, 6); //取加密后的数字中的前6位
		
		$this -> memcache -> add( $_SERVER['SINASRV_MEMCACHED_KEY_PREFIX'] . "findpassword_" . $id, $getnum, 0, 300 ); //前缀--名称--userid  存储内容   压缩方式  有效时间
		
		$subject = "乐居薪资密码安全验证";
		
		$content = "欢迎使用乐居帐号服务！<br /><br />";
		$content .= "你的登录账号是： {$to}<br /><br />";
		$content .= "你的验证码是： {$getnum}<br /><br />";
		$content .= "本邮件是由系统自动发送，请勿直接回复！<br /><br />";
		$content .= "感谢您的支持！我们会努力做到最好！<br /><br />";
		
		if (mail_send($to, $subject, $content)) {
// 			$msg = '邮件发送成功！请查收您的邮箱！然后输入验证码！';
			Response::getInstance() -> show('200', 'success', '邮件发送成功，请查收！', 'json');
		} else {
// 			$msg = '邮件发送失败，请确认本人邮箱是否存在！';
			Response::getInstance() -> show('400', '邮件发送失败，请确认邮箱是否存在！');exit;
		}
// 		echo $msg;		
	}
	
	//验证回执
	function checkback(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$backcode = trim($_REQUEST['code']) ? trim($_REQUEST['code']) : '';
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$oldcode = $this -> memcache -> get( $_SERVER['SINASRV_MEMCACHED_KEY_PREFIX'] . "findpassword_" . $id );
		if(empty($oldcode)){
			Response::getInstance() -> show('400', '验证码已失效，请重新发送');exit;
		}else{
			if($oldcode == $backcode){
				$sql_pass = "delete from oa_payment where email='{$email}'";
				$ob_pass = $this -> db -> query($sql_pass);
				if($ob_pass){
					Response::getInstance() -> show('200', 'success', '验证通过', 'json');
				}else{
					Response::getInstance() -> show('400', '验证失败,请重试');exit;
				}
			}else{
				Response::getInstance() -> show('400', '验证码输入错误');exit;
			}
		}
	}
	
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new sendmail();
$obj -> $action();