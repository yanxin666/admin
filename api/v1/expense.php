<?php
define("xinlangAPI", true);
$path = str_replace( "/v1", "", str_replace( "\\", "/", dirname(__FILE__) ) );
include ( $path."/include/init.php" );

class expense extends baseclass implements baseInterface{
	
	function __construct(){
		$open_system_os['need_db_connect'] = true;
		$open_system_os['datamanagers'] = array('mysql');
		parent::__construct($open_system_os);
	}
	
	function __call($name, $args){
		$message = 'Call to undefined method '.get_class($this).'::'.$name.'()';
		throw new Exception($message, 3);
	}
	
	//查看本月报销
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
		//用户id
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
			$id = $user['id'];
			$date = date("Y-m-d",time());
			$now = substr($date,0,7);
			$sql_expense = "select e.id, e.expense_code, u.fullname, o.depart_name, e.draft_time, e.total_expense, e.had_act_user, e.budget_year, e.budget_month, e.activityos, e.islk, e.gz_no from oa_expense as e left join oa_user as u on e.author_user=u.id left join oa_org as o on e.author_dept=o.id where e.author_user='$id' and e.draft_time like '%$now%'";
			$expense_ob = $this -> db -> query($sql_expense);
			$expense = $expense_ob -> fetchAll();
			if(empty($expense)){
				Response::getInstance() -> show('400', '暂无报销信息');exit;
			}else{
				//数据映射
				global $config;
				$oa_config = $config['oa_config'];
				$activityos = $oa_config['activityos'];
				$islk = $oa_config['islk'];
				for($i=0;$i<$length;$i++){
					@$data[$i]['id'] = $expense[$i]['id'];
					@$data[$i]['expense_code'] = $expense[$i]['expense_code'];
					@$data[$i]['fullname'] = $expense[$i]['fullname'];
					@$data[$i]['depart_name'] = $expense[$i]['depart_name'];
					@$data[$i]['draft_time'] = $expense[$i]['draft_time'];
					@$data[$i]['total_expense'] = $expense[$i]['total_expense'];
					@$data[$i]['had_act_user'] = $expense[$i]['had_act_user'];
					@$data[$i]['budget_year'] = $expense[$i]['budget_year'];
					@$data[$i]['budget_month'] = $expense[$i]['budget_month'];
					@$data[$i]['activityos'] = $activityos[$expense[$i]['activityos']];
					@$data[$i]['islk'] = $islk[$expense[$i]['islk']];
					@$data[$i]['gz_no'] = $expense[$i]['gz_no'];
				}
				Response::getInstance() -> show('200', 'success', $data, 'json');
			}
		}	
	}
}

$action = !empty($_REQUEST['action']) ? @trim($_REQUEST['action']) : 'index';
$obj = new expense();
$obj -> $action();