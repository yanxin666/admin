<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class question extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看更多问题
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_question = "select id, title from oa_question order by createtime desc"; 
		$question_ob = $this -> db -> query($sql_question);
		$question = $question_ob -> fetchAll();
		if(empty($question)){
			Response::getInstance() -> show('400', '暂无信息');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $question, 'json');
		}		
	}
	
	//查看更多问题详情
	function details(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_question = "select content from oa_question where id='$id'";
		$ob_question = $this -> db -> query($sql_question);
		$question = $ob_question -> fetch();
		if(empty($question['content'])){
			Response::getInstance() -> show('400', '暂无详情');exit;
		}else{
			Response::getInstance() -> show('200', 'success', $question, 'json');
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new question();
$obj -> $action();