<?php
/**
 * @abstract	系统公用方法（不与数据库交互）
 * @author		wangkai
 * @copyright	20130825
 */

if ( !defined( "xinlangAPI" ) ) {
	die( "Hacking attempt" );
}


//验证方法
function check_email_password($host, $port, $user, $pass){
	//创建sock链接
	if (! $sock = fsockopen($host, $port, $errno, $errstr, 100) ){
		return 'fsockopen_error';
	}

	if ( strstr(fgets($sock), '220') ){
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
			
		return 'success';
	}
}

/**
 * 验证邮箱是否合法，否则AES解密
 * @param string $email
 * @return string $mail
 */
function decodemail($email){
	$mail = filter_var($email, FILTER_VALIDATE_EMAIL);
	if($mail){
		return $mail;
	}else{
		$aes =  Aes_encrypt::getInstance();
		$aes -> setKey('lejuchoujianghdy');
		$mail = $aes -> decode($email);
		return $mail;
	}
}

/**
 * @abstract	预处理搜索内容
 * @param $keywords	String
 */
function keywords($keywords){
	$number = filter_var($keywords, FILTER_VALIDATE_INT);
	if($number){
		if(strlen($number) < 4){
			return 1;
		}
	}else{
		if(preg_match('/^[a-zA-Z]+$/',$keywords)){
			if(strlen($keywords) < 2){
				return 2;
			}
		}
	}
}

/**
 * @abstract	预处理提交内容
 * @param $value	String
 */
function addslashes_deep($value) {
	if (empty($value)) {
		return $value;
	} else {
		return is_array($value) ? array_map('addslashes_deep', $value) : addslashes($value);
	}
}

/**
 * @abstract	批量引用
 * @param	 $dir_name		String		文件夹名
 * @param	 $filter		String		要遍历文件的后缀名
 */
function load_lib($dir_name, $filter) {
	$dir_name_base = API_ROOT_PATH .'/'. $dir_name;
	if (is_dir($dir_name_base)) {
		$dir_stream = opendir($dir_name_base);
		while ( ( $file_name = readdir($dir_stream) ) != false ){
			if ($file_name != '.' && $file_name != '..' && strpos($file_name, $filter)){
				include ( ''.$dir_name . '/' . $file_name);
			}
		}
		rewinddir($dir_stream);
		closedir($dir_stream);
	}
}

/**
 * 自动引用加载libraries公共类
 */
function load_libraries($classname){
	include_once ('include/libraries/'.$classname.'.class.php');
}

/**
 * 检查token验证
 * @param $withoutkey Array 不需要进行校验的值
 * @param $sendtype String 请求类型
 */
function check_token($withoutkey = "", $sendtype = ""){
	$params = $sendtype ? $sendtype : $_GET;
	$params = array_map('trim', $params);
// 	print_r($params);
// 	echo PHP_EOL;
	$secret = 'lejutong_matouit';
	$str = '';  //待签名字符串
	//先将参数以其参数名的字典序升序进行排序
	krsort($params);
	//遍历排序后的参数数组中的每一个key/value对
	$ckey = array('sign');
	$ckey = array_merge($ckey, $withoutkey);
// 	print_r($ckey);
// 	echo PHP_EOL;
	foreach ($params as $k => $v) {
		//为key/value对生成一个key=value格式的字符串，并拼接到待签名字符串后面
		if(!in_array($k, $ckey)){
			$str .= "$k=$v";
		}
	}
	//将签名密钥拼接到签名字符串最后面
	$str .= $secret;
// 	echo $str,PHP_EOL;
	//通过md5算法为签名字符串生成一个md5签名，该签名就是我们要追加的sign参数值
	$target_sign = strtoupper(md5($str));
// 	echo $target_sign;
	if ($params['sign'] == $target_sign){
		return true;
	}else {
		return false;
	}
}

/**
 * @abstract	获得用户的真实IP地址
 * @access  	public
 * @return  	string
 */
function real_ip() {
	static $realip = NULL;

	if ($realip !== NULL) {
		return $realip;
	}

	if (isset($_SERVER)) {
		if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			$arr = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);

			/* 取X-Forwarded-For中第一个非unknown的有效IP字符串 */
			foreach ($arr AS $ip) {
				$ip = trim($ip);

				if ($ip != 'unknown') {
					$realip = $ip;

					break;
				}
			}
		} elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
			$realip = $_SERVER['HTTP_CLIENT_IP'];
		} else {
			if (isset($_SERVER['REMOTE_ADDR'])) {
				$realip = $_SERVER['REMOTE_ADDR'];
			} else {
				$realip = '0.0.0.0';
			}
		}
	} else {
		if (getenv('HTTP_X_FORWARDED_FOR')) {
			$realip = getenv('HTTP_X_FORWARDED_FOR');
		} elseif (getenv('HTTP_CLIENT_IP')) {
			$realip = getenv('HTTP_CLIENT_IP');
		} else {
			$realip = getenv('REMOTE_ADDR');
		}
	}

	preg_match("/[\d\.]{7,15}/", $realip, $onlineip);
	$realip = !empty($onlineip[0]) ? $onlineip[0] : '0.0.0.0';

	return $realip;
}


// include_once (ROOT_PATH . 'include/lib_common/' . "class.phpmailer.php");
/**
 * @abstract	新发送邮件函数
 * @param $to
 * @param $subject
 * @param $body
 * @author kai
 */
function mail_send($to, $subject, $body){
	include_once (ROOT_PATH . '/system/libraries/Phpmailer.php');
	global $config;
	// llll
	$mailObj = new PHPMailer(true);
	$mailObj -> IsSMTP();
	$mailObj -> CharSet = 'UTF-8';
	$mailObj -> Host = $config['oa_config']['email']['smtp_server'];
	$mailObj -> SMTPAuth = true;
	$mailObj -> Username = $config['oa_config']['email']['username'];
	$mailObj -> Password = $config['oa_config']['email']['password'];
	$mailObj -> Port = $config['oa_config']['email']['port'];
	//是否是Html邮件
	$mailObj -> IsHTML(true);
	$mailObj -> AddAddress($to);
	$mailObj -> Subject = $subject;
	$mailObj -> Body  = $body;
	$mailObj -> From = $config['oa_config']['email']['username'];
	$mailObj -> FromName = $config['oa_config']['email']['sitename'];
	
	if (!$mailObj -> Send()){
		echo("邮件发送错误:".$mailObj -> ErrorInfo);
		unset($mailObj);
		return false;
	}else {
		unset($mailObj);
		return TRUE;
	}
}


/**
 * 系统加密算法
 * @param $str		要加密或解密的字符
 * @param $dotype	解密或加密
 */
function encrypt_func($str) {
	global $encryption;
	$str = md5($encryption . $str);
	unset($encryption);
	return $str;
}

/**
 * 过滤可能会有xss工具的变量值
 * @param $data		文本值
 */
function xss_clean($data) {
	// Fix &entity\n;
	$data = str_replace(array('&amp;', '&lt;', '&gt;'), array('&amp;amp;', '&amp;lt;', '&amp;gt;'), $data);
	$data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
	$data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
	$data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');

	// Remove any attribute starting with "on" or xmlns
	$data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);

	// Remove javascript: and vbscript: protocols
	$data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
	$data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
	$data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);

	// Only works in IE: <span style="width: expression(alert('Ping!'));"></span>
	$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
	$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
	$data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);

	// Remove namespaced elements (we do not need them)
	$data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);

	do {
		// Remove really unwanted tags
		$old_data = $data;
		$data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed|frame(?:set)?|i(?:frame|layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
	} while ($old_data !== $data);

	// we are done...
	return $data;
}


function mobile_handle_array($tarArr){
	if (is_array($tarArr ) && !empty($tarArr)){
		$reslutArr = Array();
		$i = 0;
		foreach ($tarArr as $key => $value){
			$reslutArr[$i]['key'] = $key;
			$reslutArr[$i]['value'] = $value;
			$i++;
		}
	}
	return $reslutArr;
}

?>