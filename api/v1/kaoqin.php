<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class kaoqin extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//添加考勤信息
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
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$user_ob = $this -> db -> query($sql_user);
		$user = $user_ob -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '暂无用户信息');exit;
		}else{
			$lejuid = is_numeric($user['id']) ? intval($user['id']) : 0;
			$address = trim($_REQUEST['address']) ? trim($_REQUEST['address']) : '';
			$kqtime = trim($_REQUEST['kqtime']) ? trim($_REQUEST['kqtime']) : '';
			$date = date('Ymd',time());
			$week = trim($_REQUEST['week']) ? trim($_REQUEST['week']) : '';
			$sql_kaoqin = "insert into oa_kaoqin(lejuid, address, kqtime, date, week) values('$lejuid','$address','$kqtime','$date','$week')";
			$kaoqin_ob = $this -> db -> query($sql_kaoqin);
			if($kaoqin_ob){
				Response::getInstance() -> show('200', 'success', '打卡成功', 'json');
			}else{
				Response::getInstance() -> show('400', '打卡失败');exit;
			}
		}
	}
	
	//查看本周考勤
	function weekkaoqin(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$user_ob = $this -> db -> query($sql_user);
		$user = $user_ob -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '暂无用户信息');exit;
		}else{
			$lejuid = is_numeric($user['id']) ? intval($user['id']) : 0;
			$sdefaultDate = date("Y-m-d");
			$first=1;
			$w=date('w',strtotime($sdefaultDate));
			$start=date('Ymd',strtotime("$sdefaultDate -".($w ? $w - $first : 6).' days'));
			$end=date('Ymd',strtotime("$start +6 days"));
			$sql_weekkaoqin = "select u.fullname, k.address, k.kqtime, k.week from oa_kaoqin as k left join oa_user as u on k.lejuid=u.id where k.lejuid='{$lejuid}' and date between $start and $end order by k.kqtime desc";
			$ob_weekkaoqin = $this -> db -> query($sql_weekkaoqin);
			$weekkaoqin = $ob_weekkaoqin -> fetchAll();
			if(empty($weekkaoqin)){
				Response::getInstance() -> show('400', '暂无打卡记录');exit;
			}else{
				Response::getInstance() -> show('200', 'success', $weekkaoqin, 'json');
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new kaoqin();
$obj -> $action();