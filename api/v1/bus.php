
<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class bus extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//班车线路列表
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
		$sql_bus = "select lineid, linename, line, linetime from oa_busline order by lineid asc limit ".($curr_page-1)*$length.','.$length;
		$ob_bus = $this-> db -> query($sql_bus);
		$bus = $ob_bus -> fetchAll();
		if(!empty($bus)){
			$count = count($bus);
			for($i=0;$i<$count;$i++){
				@$data[$i]['lineid'] = $bus[$i]['lineid'];
				@$data[$i]['linename'] = $bus[$i]['linename'];
				@$data[$i]['line'] = $bus[$i]['line'];
				@$data[$i]['linetime'] = $bus[$i]['linetime'];
				@$data[$i]['showimg'] = 'http://lejutong.leju.com/images/default_bus.png';
			}
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}else{
			Response::getInstance() -> show('400', '暂无班车');exit;
		}
	}
	
	//班车站点详情
	function details(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$id = is_numeric($_REQUEST['lineid']) ? intval($_REQUEST['lineid']) : 0;
		$sql_bus = "select linename, line, linetime, driver, dmobile, busnumber, teamer, tmobile, temail, nightstart, nighttime, nightadd from oa_busline where lineid='{$id}'";
		$ob_bus = $this -> db -> query($sql_bus);
		$bus = $ob_bus -> fetch();
		if(!empty($bus)){
			$sql_station = "select get_station, send_time, stop_address from oa_busline_station where lineid='{$id}' order by send_time asc";
			$ob_station = $this-> db -> query($sql_station);
			$station = $ob_station -> fetchAll();
			if(!empty($station)){
				$count = count($station);
				for($i=0;$i<$count;$i++){
					@$data[$i]['linename'] = $bus['linename'];
					@$data[$i]['line'] = $bus['line'];
					@$data[$i]['linetime'] = $bus['linetime'];
					@$data[$i]['driver'] = $bus['driver'];
					@$data[$i]['dmobile'] = $bus['dmobile'];
					@$data[$i]['busnumber'] = $bus['busnumber'];
					@$data[$i]['teamer'] = $bus['teamer'];
					@$data[$i]['tmobile'] = $bus['tmobile'];
					@$data[$i]['temail'] = $bus['temail'];
					@$data[$i]['nightstart'] = $bus['nightstart'];
					@$data[$i]['nighttime'] = $bus['nighttime'];
					@$data[$i]['nightadd'] = $bus['nightadd'];
					@$data[$i]['get_station'] = $station[$i]['get_station'];
					@$data[$i]['send_time'] = $station[$i]['send_time'];
					@$data[$i]['stop_address'] = $station[$i]['stop_address'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				Response::getInstance() -> show('400', '暂无班车站点详情');exit;
			}
		}else{
			Response::getInstance() -> show('400', '暂无班车');exit;
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new bus();
$obj -> $action();