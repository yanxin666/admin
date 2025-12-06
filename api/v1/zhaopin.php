<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class zhaopin extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//招聘信息列表
	function index(){
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
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 5;
		$sql_zhaopin = "select id, position, num, address, bonus from oa_zhaopin where status='1' order by time desc limit ".($curr_page-1)*$length.','.$length; 
		$zhaopin_ob = $this -> db -> query($sql_zhaopin);
		$zhaopin = $zhaopin_ob -> fetchAll();
		if(empty($zhaopin)){
			Response::getInstance() -> show('400', '暂无招聘信息');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $zhaopin, 'json');
		}		
	}
	
	//查看招聘详情
	function detail(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_zhaopin = "select time, num, limittime, edu, jobduty, jobneed from oa_zhaopin where id='$id'"; 
		$zhaopin_ob = $this -> db -> query($sql_zhaopin);
		$zhaopin = $zhaopin_ob -> fetch();
		if(empty($zhaopin['jobduty'])){
			Response::getInstance() -> show('400', '暂无招聘详情');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $zhaopin, 'json');
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new zhaopin();
$obj -> $action();