<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class tuijian extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//推荐好友
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
		$lejumail = substr($email,0,strpos($email,'@'));
		$position_id = is_numeric($_REQUEST['position_id']) ? intval($_REQUEST['position_id']) : 0;
		$name = trim($_REQUEST['name']) ? trim($_REQUEST['name']) : '';
		$femail = trim($_REQUEST['femail']) ? trim($_REQUEST['femail']) : '';
		$fmobile = trim($_REQUEST['fmobile']) ? trim($_REQUEST['fmobile']) : '';
		$feducation = trim($_REQUEST['feducation']) ? trim($_REQUEST['feducation']) : '';
		$createtime = date("Y-m-d H:i:s",time());
		$sql_check = "select * from oa_tuijian where position_id='$position_id' and name='$name'";
		$ob_check = $this -> db -> query($sql_check);
		$check = $ob_check -> fetch();
		if(!empty($check['name'])){
			Response::getInstance() -> show('400', '请勿重复推荐');exit;
		}else{
			$sql_tuijian = "insert into oa_tuijian(position_id, lejumail, name, femail, fmobile, feducation, createtime) values('$position_id', '$lejumail', '$name', '$femail', '$fmobile', '$feducation', '$createtime')";
			$tuijian_ob = $this -> db -> query($sql_tuijian);
			if($tuijian_ob){
				Response::getInstance() -> show('200', 'success', '推荐成功', 'json');
			}else{
				Response::getInstance() -> show('400', '推荐失败');exit;
			}
		}	
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new tuijian();
$obj -> $action();