<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class administrative extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//通讯地址
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		@$city = trim($_REQUEST['city']) ? trim($_REQUEST['city']) : '';
		if(empty($city)){
			$sql_administrative = "select id, city, tel, address, code from oa_administrative order by id asc";
			$ob_administrative = $this -> db -> query($sql_administrative);
			$administrative = $ob_administrative -> fetchAll();
			if(empty($administrative)){
				Response::getInstance() -> show('400', '通讯地址请求失败');exit;
			}else{
				for($i=0;$i<count($administrative);$i++){
					@$data[$i]['id'] = $administrative[$i]['id'];
					@$data[$i]['city'] = $administrative[$i]['city'];
					@$data[$i]['tel'] = $administrative[$i]['tel'];
					@$data[$i]['fax'] = $administrative[$i]['tel'];
					@$data[$i]['address'] = $administrative[$i]['address'];
					@$data[$i]['code'] = $administrative[$i]['code'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}else{	
			$sql_administrative = "select id, city, tel, address, code from oa_administrative where city='$city'";
			$ob_administrative = $this -> db -> query($sql_administrative);
			$administrative = $ob_administrative -> fetch();
			if(empty($administrative['id'])){
				Response::getInstance() -> show('400', '通讯地址请求失败');exit;
			}else{
				@$data[0]['id'] = $administrative['id'];
				@$data[0]['city'] = $administrative['city'];
				@$data[0]['tel'] = $administrative['tel'];
				@$data[0]['fax'] = $administrative['tel'];
				@$data[0]['address'] = $administrative['address'];
				@$data[0]['code'] = $administrative['code'];
				$outid = $administrative['id'];
				$sql_administratives = "select id, city, tel, address, code from oa_administrative where id!='$outid' order by id asc";
				$ob_administratives = $this -> db -> query($sql_administratives);
				$administratives = $ob_administratives -> fetchAll();
				if(empty($administratives)){
					Response::getInstance() -> show('400', '通讯地址请求失败');exit;
				}else{
					for($i=0;$i<count($administratives);$i++){
						@$data[$i+1]['id'] = $administratives[$i]['id'];
						@$data[$i+1]['city'] = $administratives[$i]['city'];
						@$data[$i+1]['tel'] = $administratives[$i]['tel'];
						@$data[$i+1]['fax'] = $administratives[$i]['tel'];
						@$data[$i+1]['address'] = $administratives[$i]['address'];
						@$data[$i+1]['code'] = $administratives[$i]['code'];
					}
					Response::getInstance() -> show('200', 'success', $data, 'json');
				}
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new administrative();
$obj -> $action();