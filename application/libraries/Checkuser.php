<?php
class checkuser{
	
	private $CI;
	
	public function __construct()
	{
		$this -> CI = & get_instance();
	}
	
	public function checklogin(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
	}
	
	public function system_level($controller){
		$this -> checklogin();
		$SystemPermission = $this -> CI -> config -> item('SystemPermission');
		
		switch ($_SESSION['loginInfo']['usertype']){
			case 'admin':
				if (in_array($controller, $SystemPermission['systemuser'])){
					$shownav_arr = $SystemPermission['systemuser'];
				}
				break;
			default:
				echo 'error';exit;
		}
		return  $shownav_arr;
	}
	
	//验证用户权限管理权限
	public function checkpermissions(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('用户权限管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证用户管理权限
	public function checkusers(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('用户管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证轮播图管理权限
	public function checkslide(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('发布轮播图',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证后台通知管理权限
	public function checknotify(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if(($_SESSION['loginInfo']['loginid'] != 0 && $_SESSION['loginInfo']['is_notify'] != 1) || $_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('后台通知管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证考勤管理权限
	public function checkkaoqin(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('考勤管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证报销管理权限
	public function checkexpense(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('报销管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证后台联系组管理权限
	public function checkteam(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('后台联系组管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证菜单组管理权限
	public function checkmenu(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('菜单组管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证问候语管理权限
	public function checkgreetings(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('问候语管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证人事通知管理权限
	public function checkrsnotify(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('人事通知管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证前端联系组管理权限
	public function checkqtteam(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('前端联系组管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证发卡行管理权限
	public function checkbank(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('发卡行管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证行政联系管理权限
	public function checkadministrative(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('行政联系管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证组织机构管理权限
	public function checkorg(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('组织机构管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证薪酬密码管理权限
	public function checkpayment(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('薪酬密码管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证意见反馈管理权限
	public function checkview(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('意见反馈管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证招聘职位管理权限
	public function checkzhaopin(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('招聘职位管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证网址推荐管理权限
	public function checkurl(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('网址推荐管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证推荐好友管理权限
	public function checktuijian(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('推荐好友管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证工作沟通管理权限
	public function checkjobtalk(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('工作沟通管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证办理流程管理权限
	public function checkprocess(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('办理流程管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证更多问题管理权限
	public function checkquestion(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('更多问题管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证使用帮助管理权限
	public function checkusehelp(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('使用帮助管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证乐居菜单管理权限
	public function checkappmenu(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('乐居菜单管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证人事菜单管理权限
	public function checkrsappmenu(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('人事菜单管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证班车线路管理权限
	public function checkbus(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('班车线路管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证服务支持管理权限
	public function checkservice(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('服务支持管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证销售组员管理权限
	public function checksellman(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('销售组员管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
	
	//验证版本管理权限
	public function checkversion(){
		if (empty($_SESSION['loginInfo'])){
			echo "<script>alert('请登陆');parent.location.href='/index.php?c=loginpage&m=index';</script>";
		}
		if($_SESSION['loginInfo']['loginid'] != 0 && (@!in_array('版本管理',$_SESSION['loginInfo']['auth']))){
			echo "<script>alert('没有权限');parent.location.href='/index.php?c=loginpage&m=index';</script>";
			session_destroy();
		}
	}
}