<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class payment extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '薪酬密码管理';
    	$data['navshow'] = 'payment';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">薪酬密码管理后台<small>薪酬密码管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=payment">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=payment">薪酬密码管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>薪酬密码列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkpayment();
        $this -> load -> view('showpayment', $data);
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
        $sql_admin_total = "select count(id) as memTotal from oa_payment";
        $memTotal_ob = $this -> db -> query($sql_admin_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select id, email from oa_payment";
        //查询条件
        if($search){
            $sql_member .= " where id like '%{$search}%' or email like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by email {$sortdir} ";
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
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=payment&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=payment&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<4;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        } 
        exit;
    } 

	//薪酬密码信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '薪酬密码添加';
        $data['navshow'] = 'payment';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">薪酬密码管理后台<small>薪酬密码管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=payment">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=payment">薪酬密码管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>薪酬密码添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkpayment();
        $this -> load -> view('addpayment',$data);
    }

    //执行薪酬密码信息添加
    public function insert(){
        //获取表单提交信息
        $email = trim($_POST['email']) ? trim($_POST['email']) : '';
        $password = trim(md5($_POST['password'])) ? trim(md5($_POST['password'])) : '';
        $sql_payment = "insert into oa_payment(email, password) values('$email', '$password')";
        $obj_payment = $this -> db -> query($sql_payment);
        //判断添加是否成功
        if($obj_payment){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=payment&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=payment&m=index';</script>";
        }
    }
    
    //薪酬密码信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '薪酬密码修改';
        $data['navshow'] = 'payment';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">薪酬密码管理后台<small>薪酬密码管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=payment">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=payment">薪酬密码管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>薪酬密码修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_payment = "select id, email from oa_payment where id={$id};";
        $payment_ob = $this -> db -> query($sql_payment);
        $payment = $payment_ob -> row_array();
        $data['payment'] = $payment;
        $this -> load -> view('editpayment',$data);
    }

    //执行薪酬密码信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $email = trim($_POST['email']) ? trim($_POST['email']) : "";
        $sql_payment = "update oa_payment set email='$email' where id='$id'";
        $ob_payment = $this -> db -> query($sql_payment);
        //判断是否修改成功
        if($ob_payment){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=payment&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=payment&m=index';</script>";
        }
    }

    //薪酬密码密码修改页
    public function editpass(){
        //状态栏控制
        $data['title'] = '薪酬密码修改';
        $data['navshow'] = 'payment';
         //导航栏控制
        $breadcrumb = '<h3 class="page-title">薪酬密码管理后台<small>薪酬密码管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=payment">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=payment">薪酬密码管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>薪酬密码修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkpayment();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_payment = "select id, password from oa_payment where id={$id};";
        $payment_ob = $this -> db -> query($sql_payment);
        $payment = $payment_ob -> row_array();
        $data['payment_data'] = $payment;
        $this -> load -> view('editpassword',$data);
    }

    //执行薪酬密码密码修改
    public function updatepass(){
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $password = trim(md5($_POST['newpass'])) ? trim(md5($_POST['newpass'])) : "";
        $sql_payment = "update oa_payment set password='$password' where id='$id'";
        $ob_payment = $this -> db -> query($sql_payment);
        //判断是否修改成功
        if($ob_payment){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=payment&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=payment&m=index';</script>";
        }
    } 

    //薪酬密码信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_payment ="delete from oa_payment where id='$id'";
        $ob_payment = $this -> db ->query($sql_payment);
        //判断是否删除成功
        if($ob_payment){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=payment&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=payment&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_payment where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //薪酬密码添加页表单验证
    public function checkemail(){
        //验证添加的薪酬密码邮箱是否已存在
        $email = trim($_GET['email']) ? trim($_GET['email']) : "";
        $sql_email = "select * from oa_payment where email='$email'";
        $email_ob = $this -> db -> query($sql_email);
        $emails = $email_ob -> row_array();
        //判断薪酬密码邮箱是否合法
        if(empty($emails)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //薪酬密码修改页表单验证
    public function checkeditemail(){
        //验证表单中薪酬密码邮箱是否被更改
        $email = trim($_POST['email']) ? trim($_POST['email']) : "";
        $oldemail = trim($_POST['oldemail']) ? trim($_POST['oldemail']) : "";
        //薪酬密码邮箱未被更改时
        if($email == $oldemail){
            echo "true";exit;
        }else{ //薪酬密码邮箱改变时
            $sql_email = "select * from oa_payment where email='$email';";
            $email_ob = $this -> db -> query($sql_email);
            $emails = $email_ob -> row_array();
            //判断薪酬密码邮箱是否合法
            if(empty($emails)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }

     //薪酬密码密码修改页表单验证
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