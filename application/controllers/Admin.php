<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class admin extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '管理员管理';
    	$data['navshow'] = 'admin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>管理员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=admin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=admin">管理员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>管理员列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkpermissions();
        $this -> load -> view('showadmin', $data);
    }

    //处理表格ajax传输的数据
    public function ajax_data(){
        //请求次数
        $page = is_numeric($_POST['sEcho']) ? intval($_POST['sEcho']) : 0;
        //获取每页数据条数
        $pagesize = is_numeric($_POST['iDisplayLength']) ? intval($_POST['iDisplayLength']) : 0;
        //获取当前页起始数据的ID
        $offset = is_numeric($_POST['iDisplayStart']) ? intval($_POST['iDisplayStart']) : 0;
        //获取搜索框输入值
        $search = trim($_POST['sSearch']) ? trim($_POST['sSearch']) : false;
        //$length = strlen($search);
        //获取表格中执行排序的列号(每列都包括在内,从0开始)
        $sortcol = is_numeric($_POST['iSortCol_0']) ? intval($_POST['iSortCol_0']) : 0;
        //获取表格中执行排序的规则(asc,desc)
        $sortdir = trim($_POST['sSortDir_0']) ? trim($_POST['sSortDir_0']) : false;

        
        //拼接dataTable识别的数据格式
        $reAjaxData['sEcho'] = $page;
        //获取数据总条数
        $sql_admin_total = "select count(id) as memTotal from oa_admin";
        $memTotal_ob = $this -> db -> query($sql_admin_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select id, email, department, is_notify, createtime from oa_admin where id!=1";
        //查询条件
        if($search){
            $sql_member .= " where id like '%{$search}%' or email like '%{$search}%' or department like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by email {$sortdir} ";
                break;

            case '3':
                $sql_member .= " order by department {$sortdir} ";
                break;
                
            case '4':
                $sql_member .= " order by is_notify {$sortdir} ";
                break;
            
            case '5':
                $sql_member .= " order by createment {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_member .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_member);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $is_notify = $this->config->item('oa_config')['is_notify'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $reAjaxData['aaData'][$i][] = '<input class="checkboxes" type="checkbox" value="1">';
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][4] = $is_notify[$reAjaxData['aaData'][$i][4]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=admin&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=admin&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<7;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        }
        exit;
    } 

	//管理员信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '管理员添加';
        $data['navshow'] = 'admin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>管理员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=admin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=admin">管理员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>管理员添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $this -> load -> view('addadmin',$data);
    }

    //执行管理员信息添加
    public function insert(){
        //获取表单提交信息
        $email = trim($_POST['email']) ? trim($_POST['email']) : '';
        $password = trim(md5($_POST['password'])) ? trim(md5($_POST['password'])) : '';
        $department = trim($_POST['department']) ? trim($_POST['department']) : '';
        $is_notify = is_numeric($_POST['is_notify']) ? intval($_POST['is_notify']) : 0;
        $createtime = date('Y-m-d H:i:s',time());
        $sql_admin = "insert into oa_admin(email, password, department, is_notify, createtime) values('$email', '$password', '$department', '$is_notify', '$createtime')";
        $obj_admin = $this -> db -> query($sql_admin);
        //判断添加是否成功
        if($obj_admin){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=admin&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=admin&m=index';</script>";
        }
    }
    
    //管理员信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '管理员修改';
        $data['navshow'] = 'admin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>管理员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=admin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=admin">管理员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>管理员修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_admin = "select id, email, department, is_notify from oa_admin where id={$id};";
        $admin_ob = $this -> db -> query($sql_admin);
        $admin = $admin_ob -> row_array();
        $data['admin_data'] = $admin;
        $this -> load -> view('editadmin',$data);
    }

    //执行管理员信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $email = trim($_POST['email']) ? trim($_POST['email']) : "";
        $department = trim($_POST['department']) ? trim($_POST['department']) : "";
        $is_notify = is_numeric($_POST['is_notify']) ? intval($_POST['is_notify']) : 0;
        $createtime = date('Y-m-d H:i:s',time());
        $sql_admin = "update oa_admin set email='$email',department='$department',is_notify='$is_notify', createtime='$createtime' where id='$id'";
        $ob_admin = $this -> db -> query($sql_admin);
        //判断是否修改成功
        if($ob_admin){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=admin&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=admin&m=index';</script>";
        }
    }

    //管理员密码修改页
    public function editpass(){
        //状态栏控制
        $data['title'] = '管理员修改';
        $data['navshow'] = 'admin';
         //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>管理员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=admin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=admin">管理员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>管理员密码修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_admin = "select id, password from oa_admin where id={$id};";
        $admin_ob = $this -> db -> query($sql_admin);
        $admin = $admin_ob -> row_array();
        $data['admin_data'] = $admin;
        $this -> load -> view('editpass',$data);
    }

    //执行管理员密码修改
    public function updatepass(){
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $password = trim(md5($_POST['newpass'])) ? trim(md5($_POST['newpass'])) : "";
        $sql_admin = "update oa_admin set password='$password' where id='$id'";
        $ob_admin = $this -> db -> query($sql_admin);
        //判断是否修改成功
        if($ob_admin){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=admin&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=admin&m=index';</script>";
        }
    } 

    //管理员信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_admin ="delete from oa_admin where id='$id'";
        $ob_admin = $this -> db ->query($sql_admin);
        //判断是否删除成功
        if($ob_admin){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=admin&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=admin&m=index';</script>";
        }
    }

    //管理员添加页表单验证
    public function checkemail(){
        //验证添加的管理员邮箱是否已存在
        $email = trim($_GET['email']) ? trim($_GET['email']) : "";
        $sql_email = "select * from oa_admin where email='$email'";
        $email_ob = $this -> db -> query($sql_email);
        $emails = $email_ob -> row_array();
        //判断管理员邮箱是否合法
        if(empty($emails)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //管理员修改页表单验证
    public function checkeditemail(){
        //验证表单中管理员邮箱是否被更改
        $email = trim($_POST['email']) ? trim($_POST['email']) : "";
        $oldemail = trim($_POST['oldemail']) ? trim($_POST['oldemail']) : "";
        //管理员邮箱未被更改时
        if($email == $oldemail){
            echo "true";exit;
        }else{ //管理员邮箱改变时
            $sql_email = "select * from oa_admin where email='$email';";
            $email_ob = $this -> db -> query($sql_email);
            $emails = $email_ob -> row_array();
            //判断管理员邮箱是否合法
            if(empty($emails)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }

     //管理员密码修改页表单验证
    public function checkeditpass(){
        //接收ajax传值
        $oldpass = trim($_POST['oldpass']) ? trim($_POST['oldpass']) : "";
        $reoldpass = trim(md5($_POST['reoldpass'])) ? trim(md5($_POST['reoldpass'])) : "";
        if($oldpass == $reoldpass){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }
}