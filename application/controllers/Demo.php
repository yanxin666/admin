<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class demo extends CI_Controller{
	
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
	public function index(){
		echo 'default page from config/routes.php [default_controller]=demo';
	}
	
	public function usetype($v=NULL){

//		uri路由模式
// 		print_r($this -> uri);
//		方式1 eg: http://***/index.php/demo/ttt/v3/v4/v5/.../vn
// 		$this -> uri -> segment(n) || function($v3, $v4, ... $vn)

// 		方式2 eg: http://***/index.php?c=demo&m=ttt&s=ddd
// 		修改 config/config.php $config['enable_query_strings'] = TRUE; 开启
		
// 		视图层展示
		$data['testvar'] = "ClassName is " . self::class . ' ' . $v;
// 		$this -> load -> view( 'demo', $data);
		
		
// 		数据库操作
// 		$this -> load -> database();
// 		$sql_sysuser = "select * from sg_sysuser;";
// 		$sysuser_ob = $this -> db -> query($sql_sysuser);
// 		$sysuser = $sysuser_ob -> row_array();		//返回一个结果
// 		$sysuser = $sysuser_ob -> result_array();	//返回多个结果
// 		print_r($sysuser);
		
// 		验证码
		$this->load->helper('captcha');
		$vals = array(
				'word' => rand(10000, 99990),
				'img_path' => './captcha/',
				'img_url' => '/captcha/',
				'img_width' => '150',
				'img_height' => '30',
				'expiration' => '60*10' //过期时间
		);
		$cap = create_captcha($vals);
		//print_r($cap);
		$data['cap'] = $cap;
		$_SESSION['cap'] = $cap['word'];
		print_r($_SESSION);
		$this -> load -> view('demo', $data);
	}
	
	function formtable1(){
		
		$data['title'] = '表单';
		$data['navshow'] = 'demo';
		$this -> load -> view('demohtml/form', $data);	
	}
	
	function formtable1_add(){
		if (!empty($_POST)){
			echo '<pre>';
			print_r($_POST);
			echo '</pre>';
		}
	}
	
	function table_managed(){
		$sql_member = "select * from sg_members;";
		$memberData_ob = $this -> db -> query($sql_member);
		$memberData = $memberData_ob -> result_array();
		$data['memberData'] = $memberData;
		$data['title'] = '普通表格';
		$data['navshow'] = 'members';
		
		
		$this -> load -> library('demolibrary');
// 		$this -> demolibrary -> test();
// 		$this -> demolibrary -> foo();
// 		$this -> demolibrary -> bar();
// 		$this -> demolibrary -> sessiondata();
		$this -> load -> view('demohtml/table_managed', $data);
	}
	
	function ajax_table_managed(){
		$data['title'] = '表格';
		$data['navshow'] = 'members';
		$this -> load -> view('demohtml/ajax_table_managed', $data);
	}
	
	function ajax_data(){
// 		$reAjaxData = Array
// 			(
// 			"sEcho" => "1",
// 			"iTotalRecords" => "57",
// 			"iTotalDisplayRecords" => "57",
// 			"aaData" => Array
// 					(
// 					"0" => Array
// 		                (
// 		                	"0" => '<input class="checkboxes" type="checkbox" value="1">',
// 		                    "1" => "1",
// 		                    "2" => "小天",
// 		                    "3" => "158321452133",
// 		                    "4" => "北京市大兴区",
// 		                    "5" => "411493155121452221",
// 		                	"6" => '<a href="#">删除</a> | <a href="#">修改</a>'
// 		                )
// 			        )
// 			);
//		print_r($_POST);exit;
		
		$page = is_numeric($_POST['sEcho']) ? intval($_POST['sEcho']) : 0;
		$pagesize = is_numeric($_POST['iDisplayLength']) ? intval($_POST['iDisplayLength']) : 0;
		$offset = is_numeric($_POST['iDisplayStart']) ? intval($_POST['iDisplayStart']) : 0;
		
		$reAjaxData['sEcho'] = $page;
		$sql_member_total = "select count(memberid) as memTotal from sg_members";
		$memTotal_ob = $this -> db -> query($sql_member_total);
		$memTotal = $memTotal_ob -> row_array();
		
		$reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
		$reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
		
		
		$sql_member = "select memberid, member_name, member_phone, member_address, member_idcard from sg_members limit {$offset}, {$pagesize};";
		$memberData_ob = $this -> db -> query($sql_member);
		$memberData = $memberData_ob -> result_array();
		
		$num_memData = count($memberData);
		for ($i=0; $i < $num_memData; $i++){
			$reAjaxData['aaData'][$i][] = '<input class="checkboxes" type="checkbox" value="1">';
			foreach ($memberData[$i] as $mkey => $member){
				$reAjaxData['aaData'][$i][] = $member;
			}
			$reAjaxData['aaData'][$i][] = '<a href="#">删除</a> | <a href="#">修改</a>';
		}
		
		echo json_encode($reAjaxData); 
		exit;
	}
	
	function upload_file(){
		print_r($_FILES);
		$newname = str_replace("/system", "", BASEPATH).'upload/execl/'.time().'.xlsx';
		move_uploaded_file($_FILES['upfile']['tmp_name'], $newname);
	}
	
	function dialog(){
		$data['title'] = '上传';
		$data['navshow'] = 'members';
		$this -> load -> view('demohtml/dialog', $data);
	}
	
	function edit_table_manage(){
		$data['title'] = 'edit插件demo';
		$data['navshow'] = 'clubs';
		//导航栏控制
		$breadcrumb = '<h3 class="page-title">插件demo<small>deit表格插件</small></h3>';
		$breadcrumb .= '<ul class="breadcrumb">';
		
		$breadcrumb .= '<li>';
		$breadcrumb .= '<i class="icon-home"></i>';
		$breadcrumb .= '<a href="/index.php?c=toppage">demo</a>';
		$breadcrumb .= '<i class="icon-angle-right"></i>';
		$breadcrumb .= '</li>';
		
		
		$breadcrumb .= '<li>';
		$breadcrumb .= 'edit插件';
		$breadcrumb .= '<i class="icon-angle-right"></i>';
		$breadcrumb .= '</li>';
		$breadcrumb .= '</ul>';
		$data['breadcrumb'] = $breadcrumb;
		//权限控制
		$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		
		$this -> load -> view('demohtml/edit_table_manage', $data);
	}
	
}