<?php
define("xinlangAPI", true);
// ini_set("display_errors","on");
// error_reporting(E_ALL);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class notify extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看通知列表
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
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname' limit 1";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_all_notify = "select count(ns.notifysendid) from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='1' and (ns.notify_status = 1 or ns.notify_status = 2)";	
			$sql_show = "ns.read_status, n.id, n.title, n.time, n.send_dept";
			$sql_notify = "select {$sql_show}, ({$sql_all_notify}) as unread from oa_notify_senduser ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_notify .= "where ns.user_id='{$userid}' and (ns.notify_status = 1 or ns.notify_status = 2) ";
			$sql_notify .= "and n.whose='1' order by ns.sendtime desc limit ".($curr_page-1)*$length.','.$length;
			$notify_ob = $this -> db -> query($sql_notify);
			$notify = $notify_ob -> fetchAll();
			if(empty($notify)){
				Response::getInstance() -> show('400', '获取通知列表失败');exit;
			}else {
				Response::getInstance() -> show('200', 'success', $notify, 'json');
			}
		}
	}
	
	//通知搜索
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
		$length = @$_REQUEST['length'] ? intval($_REQUEST['length']) : 5;
		$data = trim($_REQUEST['data']) ? trim($_REQUEST['data']) : '';
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_all_notify = "select count(ns.notifysendid) from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='1' and (ns.notify_status = 1 or ns.notify_status = 2)";
			$sql_show = "ns.read_status, n.id, n.title, n.time, n.send_dept";
			$sql_notify = "select {$sql_show}, ({$sql_all_notify}) as unread from oa_notify_senduser ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_notify .= "where ns.user_id='{$userid}' and (ns.notify_status = 1 or ns.notify_status = 2) ";
			$sql_notify .= "and n.whose='1' and (n.send_dept like '%{$data}%' or n.title like '%{$data}%') order by ns.sendtime desc limit ".($curr_page-1)*$length.','.$length;
			$notify_ob = $this -> db -> query($sql_notify);
			$notify = $notify_ob -> fetchAll();
			if(empty($notify)){
				Response::getInstance() -> show('400', '获取通知列表失败');exit;
			}else {
				Response::getInstance() -> show('200', 'success', $notify, 'json');
			}
		}
	}
	
	//滚动通知
	function roll(){
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
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$sql_show = "n.id, n.title";
			$sql_notify = "select {$sql_show} from oa_notify_senduser ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_notify .= "where ns.user_id='{$userid}' and (ns.notify_status = 1 or ns.notify_status = 2) ";
			$sql_notify .= "and n.whose='1' order by ns.sendtime desc limit 0,3";
			$notify_ob = $this -> db -> query($sql_notify);
			$notify = $notify_ob -> fetchAll();
			if(empty($notify)){
				Response::getInstance() -> show('400', '获取通知列表失败');exit;
			}else {
				$count = count($notify);
				for($i=0;$i<$count;$i++){
					@$data[$i]['id'] = $notify[$i]['id'];
					if(strlen($notify[$i]['title']) <= 30){
						@$data[$i]['title'] = $notify[$i]['title'];
					}else{
						@$data[$i]['title'] = iconv_substr($notify[$i]['title'],0,10,'utf-8');
					}
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//查看通知详情
	function details(){
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
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user)){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			$notifyid = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
			$sql_details = "select title, content, time, send_dept, viewcount from oa_notify where id='{$notifyid}'";
			$ob_details = $this -> db -> query($sql_details);
			$details = $ob_details -> fetch();
			if(empty($details)){
				Response::getInstance() -> show('400', '暂无通知信息详情');exit;
			}else{
				$viewcount = $details['viewcount'] + 1;
				$sql_viewcount = "update oa_notify set viewcount='$viewcount' where id='{$notifyid}'";
				$ob_viewcount = $this -> db -> query($sql_viewcount);
				$sql_read = "update oa_notify_senduser set read_status='1', notify_status='2' where notify_id='{$notifyid}' and user_id='{$userid}'";
				$ob_read = $this -> db -> query($sql_read);
				if($ob_viewcount && $ob_read){
					Response::getInstance() -> show('200', 'success', $details, 'json');
				}else{
					Response::getInstance() -> show('400', '通知详情查看失败');exit;
				}
			}
		}
	}
	
	//获取通知总条数
	function num(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$plat_form = trim($_REQUEST['plat_form']) ? trim($_REQUEST['plat_form']) : '';
		$email = decodemail($email);
		$mail = substr($email,0,strpos($email,'@'));
		$mailname = substr($email,strpos($email,'@'),strlen($email));
		$sql_user = "select id from oa_user where lejumail='$mail' and mailname='$mailname'";
		$ob_user = $this -> db -> query($sql_user);
		$user = $ob_user -> fetch();
		if(empty($user['id'])){
			Response::getInstance() -> show('400', '获取用户信息失败');exit;
		}else{
			$userid = $user['id'];
			//修改用户使用平台
			$sql_plat = "update oa_user set plat_form='{$plat_form}' where id='{$userid}'";
			$this -> db -> query($sql_plat);
			//查询未读通知数
			$sql_all_notify = "select count(ns.notifysendid) as num from oa_notify_senduser as ns left join oa_notify as n on n.id=ns.notify_id ";
			$sql_all_notify .= "where ns.user_id='{$userid}' and ns.read_status = 0 and n.whose='1' and (ns.notify_status = 1 or ns.notify_status = 2)";
			$all_notify_ob = $this -> db -> query($sql_all_notify);
			$all_notify = $all_notify_ob -> fetch();
			if(empty($all_notify['num'])){
				$data = 0;
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}else{
				$data = $all_notify['num'];
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}
	}
	
	//发送未接收的通知
	function sendnotify(){
		//验证token加密 START
		$withoutkey = array('action','token');
		if (!check_token($withoutkey, $_POST)){
			$error_str = __CLASS__ . '::' . __FUNCTION__ . '() ';
			Response::getInstance() -> show('400', $error_str . 'Hacking attempt');exit;
		}
		//验证token加密 END
		$email = trim($_REQUEST['email']) ? trim($_REQUEST['email']) : '';
		$email = decodemail($email);
		$lejumail = substr($email,0,strpos($email,'@'));
		$lejumail = explode(',',$lejumail);
		$userid = is_numeric($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
		$sql_notifyid = "select notify_id from oa_notify_senduser where user_id='{$userid}' and notify_status='4'";
		$ob_notifyid = $this -> db -> query($sql_notifyid);
		$notifyid = $ob_notifyid -> fetchAll();
		if(empty($notifyid)){
			Response::getInstance() -> show('200', 'success', '暂无新通知', 'json');
		}else{
			$notify_id = '';
			foreach($notifyid as $v){
				$notify_id .= $v['notify_id'].',';
			}
			$notify_id = rtrim($notify_id,',');
			$sql_notify = "select id, title, whose from oa_notify where id in ($notify_id)";
			$ob_notify = $this -> db -> query($sql_notify);
			$notify = $ob_notify -> fetchAll();
			//使用推送
			$pushObj = new Jpush();
			$receive = array('alias'=>$lejumail);
			$m_type = 'http';
			$m_txt = 'http://www.iqujing.com/';
			$m_time = '600';        //离线保留时间
			foreach($notify as $v){
				$tzid = $v['id'];
				$content = $v['title'];
				if($v['whose'] == 1){
					$sendtype = '1';
				}else{
					$sendtype = '2';
				}
				//调用推送,并处理
				$result = $pushObj->push($receive,$content,$m_type,$m_txt,$m_time,$sendtype);
				if($result){
					$res_arr = json_decode($result, true);
					if(isset($res_arr['error'])){                       //如果返回了error则证明失败
//     					echo $res_arr['error']['message'];          //错误信息
//     					echo $res_arr['error']['code'];             //错误码
//     					return false;
						$sql_notify = "update oa_notify_senduser set notify_status='3' where notify_id='{$tzid}' and user_id='{$userid}'";
						$ob_notify = $this -> db -> query($sql_notify);
						if($ob_notify){
							Response::getInstance() -> show('400', '通知失败');exit;
// 							Response::getInstance() -> show('200', 'success', '通知失败', 'json');
						}else{
							Response::getInstance() -> show('400', '通知失败1');exit;
// 							Response::getInstance() -> show('200', 'success', '通知失败1', 'json');
						}
					}else{
						//处理成功的推送
						$sql_notify = "update oa_notify_senduser set notify_status='1' where notify_id='{$tzid}' and user_id='{$userid}'";
						$ob_notify = $this -> db -> query($sql_notify);
						if($ob_notify){
							Response::getInstance() -> show('200', 'success', '通知成功', 'json');
						}else{
							Response::getInstance() -> show('200', 'success', '通知成功1', 'json');
						}
					}
				}else{      //接口调用失败或无响应
					Response::getInstance() -> show('400', '推送失败');exit;
				}
			}
		}
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new notify();
$obj -> $action();