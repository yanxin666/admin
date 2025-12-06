<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class resume extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //加载简历页
    public function index(){
    	//验证token加密 START
    	$withoutkey = array('action','token');
    	if ($this->check_token($withoutkey, $_POST)){
    		$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
    		Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
    	}
    	//验证token加密 END
    	$userid = trim($_REQUEST['id']) ? trim($_REQUEST['id']) : '';
    	if ($userid){
    		$userid = $this -> decode($userid);
    	}
    	$position_id = trim($_REQUEST['position_id']) ? trim($_REQUEST['position_id']) : '';
    	if ($position_id){
    		$position_id = $this -> decode($position_id);
    	}
    	$data['userid'] = $userid;
    	$data['position_id'] = $position_id;
        $this -> load -> view('resume',$data);
    }
    
    //执行简历信息添加
    public function insert(){
        //获取表单提交信息
    	$userid = is_numeric($_POST['userid']) ? intval($_POST['userid']) : 0;
    	$position_id = is_numeric($_POST['position_id']) ? intval($_POST['position_id']) : 0;
    	$name = trim($_POST['name']) ? trim($_POST['name']) : '';
    	$sex = trim($_POST['sex']) ? trim($_POST['sex']) : '';
    	$mobile = trim($_POST['mobile']) ? trim($_POST['mobile']) : '';
    	$email = trim($_POST['email']) ? trim($_POST['email']) : '';
    	$edu = trim($_POST['edu']) ? trim($_POST['edu']) : '';
    	$workhistory = trim($_POST['workhistory']) ? trim($_POST['workhistory']) : '';
    	$content = trim($_POST['content']) ? trim($_POST['content']) : '';
    	$createtime = date("Y-m-d H:i:s",time());
    	$sql_user = "select lejumail from oa_user where id='$userid'";
    	$ob_user = $this -> db -> query($sql_user);
    	$user = $ob_user -> row_array();
    	if(empty($user)){
    		echo "<script>alert('简历提交失败!');window.history.back(-1);</script>";
    	}else{
    		$sql_check = "select name from oa_tuijian where position_id='$position_id' and name='$name'";
    		$ob_check = $this -> db -> query($sql_check);
    		$check = $ob_check -> row_array();
    		if(!empty($check)){
    			echo "<script>alert('请勿重复提交简历!');window.history.back(-1);</script>";
    		}else{
    			$lejumail = $user['lejumail'];
    			$sql_tuijian = "insert into oa_tuijian(position_id, lejumail, name, sex, femail, fmobile, workhistory, content, feducation, createtime) values('$position_id', '$lejumail', '$name', '$sex', '$email', '$mobile', '$workhistory', '$content', '$edu', '$createtime')";
    			$obj_tuijian = $this -> db -> query($sql_tuijian);
    			//判断添加是否成功
    			if($obj_tuijian){
    				echo "<script>alert('简历提交成功!');window.history.back(-1);</script>";
    			}else{
    				echo "<script>alert('简历提交失败!');window.history.back(-1);</script>";
    			}
    		}
    	}
    }
    
    //添加页表单验证
    public function checksex(){
    	$sex = trim($_GET['sex']) ? trim($_GET['sex']) : "";
    	if($sex == '男' || $sex == '女'){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
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
     * AES解密
     * @param unknown $data
     * @return string
     */
    function decode($data) {
    	$data = base64_decode($data);
    	$td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');
    	$iv = mb_substr($data, 0, mcrypt_enc_get_iv_size($td), 'latin1');
    	mcrypt_generic_init($td, 'lejuchoujianghdy', $iv);
    	$data = mb_substr($data, mcrypt_enc_get_iv_size($td), mb_strlen($data, 'latin1'), 'latin1');
    	$data = mdecrypt_generic($td, $data);
    	mcrypt_generic_deinit($td);
    	mcrypt_module_close($td);
    	return trim($data);
    }
}