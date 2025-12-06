<?php
define("xinlangAPI", true);
ini_set("display_errors","On");
error_reporting(E_ALL);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class index extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql', 'memcache');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	function index(){
		$sql_pass = "select * from oa_payment where email='guosong@leju.com'";
		$ob_pass = $this -> db -> query($sql_pass);
		$pass = $ob_pass -> fetchAll();
		var_dump($pass);exit;
// 		$sql_del = "delete from oa_auth where id in (7,11,13)";
// 		$ob_del = $this -> db -> query($sql_del);
		
// 		$sql_pass = "delete from oa_payment where password='chenjuan@leju.com'";
// 		$ob_pass = $this -> db -> query($sql_pass);
// 		if($ob_pass){
// 			Response::getInstance() -> show('200', 'success', '验证通过', 'json');
// 		}else{
// 			Response::getInstance() -> show('400', '验证失败,请重试');exit;
// 		}
		exit;
		
		$memberid = is_numeric($_GET['memberid']) ? intval($_GET['memberid']) : 0;
		$sql_member = 'select * from oa_admin where id = '.$memberid; 
		$member_ob = $this -> db -> query($sql_member);
		$member = $member_ob -> fetchAll();
		$data = array(
				'id' => 1,
				'name' => 'singwa',
				'type' => array(4,5,6),
				'test' => array(
						1,
						45,
						67=>array(123, 'dfass')
				)
		);
		Response::getInstance() -> show('200', 'success', $member, 'json');		
	}
	
	function test(){
		ini_set("display_errors", 'On');
		error_reporting(E_ALL);
		$keywords = !empty($_GET['keywords']) ? @trim($_GET['keywords']) : '';
// 		$http = "http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords={$keywords}";
// 		$users = json_decode(file_get_contents($http),true);
// 		var_dump($users);

		$obj = new Tongxunlu();
		$data = $obj -> auto_tongxunlu($keywords);
		print_r($data);
		$data2 = $obj -> get_search_txl($keywords);
		print_r($data2);
		$memeche_key = $_SERVER['SINASRV_MEMCACHED_KEY_PREFIX'] . "txlu_" . $keywords;
		$target_mem = $this -> memcache -> get($memeche_key);
		print_r($target_mem);
	}
	
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new index();
$obj -> $action();