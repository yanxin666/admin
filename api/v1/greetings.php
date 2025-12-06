<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class greetings extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看问候语
	function index(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$sql_greetings = "select id, img, content, color from oa_greetings order by createtime desc limit 1";
		$greetings_ob = $this -> db -> query($sql_greetings);
		$greetings = $greetings_ob -> fetch();
		if(empty($greetings['id'])){
			Response::getInstance() -> show('400', '暂无问候语');exit;
		}else{
			@$data['id'] = $greetings['id'];
			if(!empty($greetings['img'])){
				@$data['img'] = 'http://lejutong.leju.com/'.$greetings['img'];
			}else{
				@$data['img'] = $greetings['img'];
			}
			@$data['content'] = $greetings['content'];
			@$data['color'] = $greetings['color'];
			Response::getInstance() -> show('200', 'success', $data, 'json');
		}		
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new greetings();
$obj -> $action();