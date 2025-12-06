<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class slide extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看轮播图
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_slide = "select id, title, img from oa_slide where status=1  order by createtime desc limit 0,3"; 
		$slide_ob = $this -> db -> query($sql_slide);
		$slide = $slide_ob -> fetchAll();
		if(empty($slide)){
			Response::getInstance() -> show('400', '暂无轮播图');exit;
		}else{
			for($i=0;$i<3;$i++){
				@$data[$i]['id'] = $slide[$i]['id'];
				@$data[$i]['title'] = $slide[$i]['title'];
				@$data[$i]['img'] = 'http://lejutong.leju.com/'.$slide[$i]['img'];
			}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}		
	}
	
	//查看轮播图详情
	function details(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_slide = "select createtime, viewcount, deptname, content from oa_slide where id='$id'";
		$ob_slide = $this -> db -> query($sql_slide);
		$slide = $ob_slide -> fetch();
		if(empty($slide['content'])){
			Response::getInstance() -> show('400', '暂无轮播图详情');exit;
		}else{
			$viewcount = $slide['viewcount'] + 1;
			$sql_viewcount = "update oa_slide set viewcount='$viewcount' where id='$id'";
			$ob_viewcount = $this -> db -> query($sql_viewcount);
			if($ob_viewcount){
				Response::getInstance() -> show('200', 'success', $slide, 'json');
			}else{
				Response::getInstance() -> show('400', '轮播图详情查看失败');exit;
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new slide();
$obj -> $action();