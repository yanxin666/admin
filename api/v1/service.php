<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class service extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//服务与支持列表显示
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
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 9;
		$sql_beijing = "select id, city, jstel, xztel, rltel from oa_service where city='北京'";
		$ob_beijing = $this -> db -> query($sql_beijing);
		$beijing = $ob_beijing -> fetch();
		if(!empty($beijing['id'])){
			@$data[0]['id'] = $beijing['id'];
			@$data[0]['city'] = $beijing['city'];
			@$data[0]['jstel'] = $beijing['jstel'];
			@$data[0]['xztel'] = $beijing['xztel'];
			@$data[0]['rltel'] = $beijing['rltel'];
			$sql_service = "select id, city, jstel, xztel, rltel from oa_service where city!='北京' order by id asc limit ".($curr_page-1)*$length.','.$length;
			$ob_service = $this -> db -> query($sql_service);
			$service = $ob_service -> fetchAll();
			if(!empty($service)){
				$count = count($service);
				for($i=0;$i<$count;$i++){
					@$data[$i+1]['id'] = $service[$i]['id'];
					@$data[$i+1]['city'] = $service[$i]['city'];
					@$data[$i+1]['jstel'] = $service[$i]['jstel'];
					@$data[$i+1]['xztel'] = $service[$i]['xztel'];
					@$data[$i+1]['rltel'] = $service[$i]['rltel'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				Response::getInstance() -> show('400', '暂无分公司信息');exit;
			}
		}else{
			Response::getInstance() -> show('400', '总部获取失败');exit;
		}
	}
	
	//服务与支持列表加载
	function more(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		//页数
		$curr_page = @$_REQUEST['page'] ? intval($_REQUEST['page']) : 2;
		//一页显示多少条
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 10;
		$sql_service = "select id, city, jstel, xztel, rltel from oa_service where city!='北京' order by id asc limit ".(($curr_page-1)*$length-1).','.$length;
		$ob_service = $this -> db -> query($sql_service);
		$service = $ob_service -> fetchAll();
		if(!empty($service)){
			$count = count($service);
			for($i=0;$i<$count;$i++){
				@$data[$i]['id'] = $service[$i]['id'];
				@$data[$i]['city'] = $service[$i]['city'];
				@$data[$i]['jstel'] = $service[$i]['jstel'];
				@$data[$i]['xztel'] = $service[$i]['xztel'];
				@$data[$i]['rltel'] = $service[$i]['rltel'];
			}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}else{
			Response::getInstance() -> show('400', '暂无分公司信息');exit;
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new service();
$obj -> $action();