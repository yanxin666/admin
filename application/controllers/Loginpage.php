<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class loginpage extends CI_Controller{
	
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
	public function index(){
		//加载登录模板
		$this -> load -> view( 'login');
	}
	//登录方法
	public function login(){
	if($_POST){
			//接收用户名
			$email = trim($_POST['user_name']) ? trim($_POST['user_name']):'';
			$pass = trim($_POST['password']) ? trim($_POST['password']) : '';
			$mail = substr($email,0,strpos($email,'@'));
			$mailname = substr($email,strpos($email,'@'),strlen($email));
			if($email == 'chaojiguanli@leju.com'){
				$sql_admin = "select id, fullname, password, is_notify, depart_name, is_ok from oa_user where lejumail='$mail' and mailname='$mailname'";
				$admin_ob = $this -> db -> query($sql_admin);
				$admin = $admin_ob -> row_array();
				if(empty($admin)){
					echo "<script>alert('获取用户信息失败');parent.location.href='/index.php?c=loginpage&m=index';</script>";
				}else{
					if(md5($pass) != $admin['password']){
						echo "<script>alert('密码错误');parent.location.href='/index.php?c=loginpage&m=index';</script>";
					}else{
						$_SESSION['loginInfo']['loginid'] = $admin['id'];
						$_SESSION['loginInfo']['loginname'] = $admin['fullname'];
						$_SESSION['loginInfo']['is_notify'] = $admin['is_notify'];
						$_SESSION['loginInfo']['depart_name'] = $admin['depart_name'];
						$_SESSION['loginInfo']['is_ok'] = $admin['is_ok'];
						$_SESSION['loginInfo']['usertype'] = 'admin';
						echo "<script>alert('登陆成功');parent.location.href='/index.php?c=welcome&m=index';</script>";
					}
				}
			}else{
				//验证邮箱和密码
				$host = "smtp.leju.com";
				$port = 25;
				$res = $this -> check_email_password($host, $port, $email, $pass);
				if($res == 'helo_error'){
					echo "<script>alert('握手失败');parent.location.href='/index.php?c=loginpage&m=index';</script>";
				}else if($res == 'auth_error'){
					echo "<script>alert('登陆验证失败');parent.location.href='/index.php?c=loginpage&m=index';</script>";
				}else if($res == 'username_error'){
					echo "<script>alert('用户名不存在');parent.location.href='/index.php?c=loginpage&m=index';</script>";
				}else if($res == 'password_error'){
					echo "<script>alert('用户名或密码错误');parent.location.href='/index.php?c=loginpage&m=index';</script>";
				}else if($res == 'success'){
					$sql_user = "select id, fullname, password, is_notify, depart_name, is_ok from oa_user where lejumail='$mail' and mailname='$mailname'";
					$user_ob = $this -> db -> query($sql_user);
					$user = $user_ob -> row_array();
					//判断用户名是否存在
					if(!empty($user)){
						if($user['is_ok'] == 1){
							$userid = $user['id'];
							$sql_auth = "select auth from oa_userauth where userid='$userid'";
							$ob_auth = $this -> db -> query($sql_auth);
							$auth = $ob_auth -> row_array();
							if(empty($auth)){
								$_SESSION['loginInfo']['auth'] = '';
							}else{
								if(strpos($auth['auth'],',') == true){
									$_SESSION['loginInfo']['auth'] = explode(",",$auth['auth']);
								}else{
									$pop = "pop";
									$string = $auth['auth'].",".$pop;
									$_SESSION['loginInfo']['auth'] = explode(",",$string);
								}
							}
							$_SESSION['loginInfo']['loginid'] = $user['id'];
							$_SESSION['loginInfo']['loginname'] = $user['fullname'];
							$_SESSION['loginInfo']['is_notify'] = $user['is_notify'];
							$_SESSION['loginInfo']['depart_name'] = $user['depart_name'];
							$_SESSION['loginInfo']['is_ok'] = $user['is_ok'];
							$_SESSION['loginInfo']['usertype'] = 'admin';
							echo "<script>alert('登陆成功');parent.location.href='/index.php?c=welcome&m=index';</script>";
						}else{
							echo "<script>alert('无登录权限,请联系后台管理员');parent.location.href='/index.php?c=loginpage&m=index';</script>";
						}
					}else{
						$http = "http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords={$mail}";
						$users = json_decode(file_get_contents($http),true);
						if(!isset($users['status']) && !isset($users['info'])){
							for($i=0;$i<count($users);$i++){
								if( $users[$i]['mailname'] == $mailname && ($users[$i]['username'] == $mail || $users[$i]['lejumail'] == $mail) ){
									@$data[$i]['id'] = trim($users[$i]['id']);
									@$data[$i]['username'] = trim($users[$i]['username']);
									@$data[$i]['sno'] = trim($users[$i]['sno']);
									@$data[$i]['fullname'] = trim($users[$i]['fullname']);
									@$data[$i]['city'] = trim($users[$i]['city']);
									@$data[$i]['dept'] = trim($users[$i]['dept']);
									@$data[$i]['lft'] = trim($users[$i]['lft']);
									@$data[$i]['rgt'] = trim($users[$i]['rgt']);
									@$data[$i]['wtype'] = trim($users[$i]['wtype']);
									@$data[$i]['tel'] = trim($users[$i]['tel']);
									@$data[$i]['mobile'] = trim($users[$i]['mobile']);
									@$data[$i]['ctype'] = trim($users[$i]['ctype']);
									@$data[$i]['position'] = trim($users[$i]['position']);
									@$data[$i]['status'] = trim($users[$i]['status']);
									@$data[$i]['birthday'] = trim($users[$i]['birthday']);
									@$data[$i]['work_position'] = trim($users[$i]['work_position']);
									@$data[$i]['city_true'] = trim($users[$i]['city_true']);
									@$data[$i]['role_id'] = trim($users[$i]['role_id']);
									@$data[$i]['weibo'] = trim($users[$i]['weibo']);
									@$data[$i]['is_exists'] = trim($users[$i]['is_exists']);
									@$data[$i]['wmh'] = trim($users[$i]['wmh']);
									@$data[$i]['depart_name'] = trim($users[$i]['depart_name']);
									@$data[$i]['lejumail'] = trim($users[$i]['lejumail']) ? trim($users[$i]['lejumail']) : trim($users[$i]['username']);
									@$data[$i]['mailname'] = trim($users[$i]['mailname']);
									if(!empty($users[$i]['pic_path'])){
										$file = file_get_contents('http://new.intra.leju.com'.trim($users[$i]['pic_path']));
										$string = time().rand(1000,9999).'.jpg';
										$mdir = 'thumb_img';
										if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$mdir)){
											mkdir($_SERVER['SINASRV_DATA_DIR'].$mdir);
										}
										$newfiles = $_SERVER['SINASRV_DATA_DIR'].$mdir.'/'.$string;
										$newfile = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $newfiles));
										file_put_contents($newfiles,$file);
										@$data[$i]['pic_path'] = $newfile;
									}else{
										@$data[$i]['pic_path'] = trim($users[$i]['pic_path']);
										// @$data[$i]['pic_path'] = 'images/user_img/default_image.png';
									}
								}
							}
							$sql_add = "insert into oa_user (id, username, lejumail, sno, fullname, city, dept, depart_name, lft, rgt, wtype, tel, mobile, ctype, position, status, birthday, work_position, city_true, mailname, role_id, weibo, is_exists, wmh, pic_path) values";
							$sql_linkman = "insert into oa_linkman (userid) values";
							$sql_savenote = "insert into oa_savenote (userid) values";
							foreach($data as $info){
								$sql_add .="("."'{$info['id']}'".","."'{$info['username']}'".","."'{$info['lejumail']}'".","."'{$info['sno']}'".","."'{$info['fullname']}'".","."'{$info['city']}'".","."'{$info['dept']}'".","."'{$info['depart_name']}'".","."'{$info['lft']}'".","."'{$info['rgt']}'".","."'{$info['wtype']}'".","."'{$info['tel']}'".","."'{$info['mobile']}'".","."'{$info['ctype']}'".","."'{$info['position']}'".","."'{$info['status']}'".","."'{$info['birthday']}'".","."'{$info['work_position']}'".","."'{$info['city_true']}'".","."'{$info['mailname']}'".","."'{$info['role_id']}'".","."'{$info['weibo']}'".","."'{$info['is_exists']}'".","."'{$info['wmh']}'".","."'{$info['pic_path']}'"."),";
								$sql_linkman .= "("."'{$info['id']}'"."),";
								$sql_savenote .= "("."'{$info['id']}'"."),";
							}
							$sql_add = rtrim($sql_add, ',');
							$ob_add = $this -> db -> query($sql_add);
							$sql_linkman = rtrim($sql_linkman, ',');
							$ob_linkman = $this -> db -> query($sql_linkman);
							$sql_savenote = rtrim($sql_savenote, ',');
							$ob_savenote = $this -> db -> query($sql_savenote);
							// echo $sql_add, PHP_EOL, $sql_linkman, PHP_EOL, $sql_savenote, PHP_EOL;
							// var_dump($ob_add);
							// var_dump($ob_linkman);
							// var_dump($ob_savenote);
							if($ob_add && $ob_linkman && $ob_savenote){
								echo "<script>alert('无登录权限,请联系后台管理员');parent.location.href='/index.php?c=loginpage&m=index';</script>";
							}else{
								echo "<script>alert('未知错误');parent.location.href='/index.php?c=loginpage&m=index';</script>";
							}
						}else{
							echo "<script>alert('该用户不存在');parent.location.href='/index.php?c=loginpage&m=index';</script>";
						}
					}
				}
			}
		}
	}
	
	//验证方法
	function check_email_password($host, $port, $user, $pass){
		//创建sock链接
		if (! $sock = fsockopen($host, $port, $errno, $errstr, 100) ){
			return 'fsockopen_error';
		}
	
		if ( strstr(fgets($sock), '220') ){
			//开启握手
			fwrite($sock, "HELO $host\r\n");
			if ( !strstr($err_msg = fgets($sock), '250') ){
				return 'helo_error';
			}
			//开始登陆验证命令
			fwrite($sock, "AUTH LOGIN\r\n");
			if ( !strstr($err_msg = fgets($sock), '334') ){
				return 'auth_error';
			}
			//输入用户名命令
			fwrite($sock, base64_encode($user)."\r\n");
			if ( !strstr($err_msg = fgets($sock), '334') ){
				// 				echo $err_msg;
				return 'username_error';
			}
			//输入密码命令
			fwrite($sock, base64_encode($pass)."\r\n");
			if ( !strstr($err_msg = fgets($sock), '235') ){
				return 'password_error';
			}
				
			return 'success';
		}
	}
	
	//退出
	function loginout(){
		session_destroy();
		$this -> load -> view( 'login');
	}
}