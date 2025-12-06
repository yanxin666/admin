<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class userinfo extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查找用户
	function search(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 1;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$search = @$_REQUEST['data'] ? trim($_REQUEST['data']) : '';
		//验证搜索参数 START
		$checkwords = keywords($search);
		if($checkwords == 1){
			Response::getInstance() -> show('400', '数字搜索不少于四位');exit;
		}else if($checkwords == 2){
			Response::getInstance() -> show('400', '字母搜索不少于两位');exit;
		}
		//验证搜索参数END
		$tongxulu_obj = new Tongxunlu();
		$txldata = $tongxulu_obj -> get_search_txl($search);
		if ($txldata){
			if(is_array($txldata)){
				$offset = ($curr_page - 1) * $length;
				$tar = array_slice($txldata, $offset, $length);
				Response::getInstance() -> show('200', 'success', $tar, 'json');
			}else{
				Response::getInstance() -> show('400', '用户不存在');exit;
			}
		}else {
			Response::getInstance() -> show('400', 'database_error');exit;
		}
	}
	
	//获取抽奖用户信息
	function cjuserinfo(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$tongxulu_obj = new Tongxunlu();
		$tar_user = $tongxulu_obj -> login_txl($email);
		if ($tar_user['status']){
			Response::getInstance() -> show('200', 'success', $tar_user['data'], 'json');
		}else {
			Response::getInstance() -> show('400', $tar_user['mesg']);exit;
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new userinfo();
$obj -> $action();