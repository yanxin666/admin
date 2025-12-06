<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class sellman extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '销售组员管理';
    	$data['navshow'] = 'sellman';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>销售组员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=sellman">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=sellman">销售组员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>销售组员列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checksellman();
        $this -> load -> view('showsellman', $data);
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
        $sql_sellman_total = "select count(orgstrid) as memTotal from oa_orgstr";
        $memTotal_ob = $this -> db -> query($sql_sellman_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_sellman = "select orgstrid, user_id, user_name, user_sn, role, role_id, orgstr_id from oa_orgstr";
        //查询条件
        if($search){
            $sql_sellman .= " where orgstrid like '%{$search}%' or user_id like '%{$search}%' or user_name like '%{$search}%' or user_sn like '%{$search}%' or role like '%{$search}%' or orgstr_id like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_sellman .= " order by orgstrid {$sortdir} ";
                break;
            
            case '2':
                $sql_sellman .= " order by user_id {$sortdir} ";
                break;
                
            case '3':
                $sql_sellman .= " order by user_name {$sortdir} ";
                break;
                
            case '4':
                $sql_sellman .= " order by user_sn {$sortdir} ";
                break;
                
            case '5':
                $sql_sellman .= " order by role {$sortdir} ";
                break;
                
            case '6':
                $sql_sellman .= " order by role_id {$sortdir} ";
                break;
                
            case '7':
                $sql_sellman .= " order by orgstr_id {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_sellman .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_sellman);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['orgstrid'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=sellman&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=sellman&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<9;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        } 
        exit;
    } 

	//销售组员信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '销售组员添加';
        $data['navshow'] = 'sellman';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>销售组员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=sellman">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=sellman">销售组员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>销售组员添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checksellman();
        $rolelist = $this -> config -> item('oa_config')['role'];
        $data['rolelist'] = $rolelist;
        $this -> load -> view('addsellman',$data);
    }

    //执行销售组员信息添加
    public function insert(){
        //获取表单提交信息
    	$user_id = trim($_POST['user_id']) ? trim($_POST['user_id']) : '';
    	$user_name = trim($_POST['user_name']) ? trim($_POST['user_name']) : '';
    	$user_sn = trim($_POST['user_sn']) ? trim($_POST['user_sn']) : '';
        $role_id = is_numeric($_POST['role_id']) ? intval($_POST['role_id']) : 0;
        $rolelist = $this -> config -> item('oa_config')['role'];
        $role = $rolelist[$role_id];
        $orgstr_id = is_numeric($_POST['orgstr_id']) ? intval($_POST['orgstr_id']) : 0;
        $orgstr_tree = trim($_POST['orgstr_tree']) ? trim($_POST['orgstr_tree']) : '';
        $sql_sellman = "insert into oa_orgstr(user_id, user_name, user_sn, role, role_id, orgstr_id, orgstr_tree) values('$user_id', '$user_name', '$user_sn', '$role', '$role_id', '$orgstr_id', '$orgstr_tree')";
        $obj_sellman = $this -> db -> query($sql_sellman);
        //判断添加是否成功
        if($obj_sellman){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }
    }
    
    //销售组员信息修改页
    public function edit(){
        //状态栏控制
        $data['title'] = '销售组员修改';
        $data['navshow'] = 'sellman';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>销售组员管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=sellman">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=sellman">销售组员管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>销售组员修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checksellman();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_sellman = "select orgstrid, user_id, user_name, user_sn, role, role_id, orgstr_id, orgstr_tree from oa_orgstr where orgstrid='{$id}'";
        $sellman_ob = $this -> db -> query($sql_sellman);
        $sellman = $sellman_ob -> row_array();
        $data['sellman'] = $sellman;
        $rolelist = $this -> config -> item('oa_config')['role'];
        $data['rolelist'] = $rolelist;
        $this -> load -> view('editsellman',$data);  
    }

    //执行销售组员信息修改
    public function update(){
        //获取表单提交信息
        $orgstrid = is_numeric($_POST['orgstrid']) ? intval($_POST['orgstrid']) : 0;
        $user_id = trim($_POST['user_id']) ? trim($_POST['user_id']) : '';
    	$user_name = trim($_POST['user_name']) ? trim($_POST['user_name']) : '';
    	$user_sn = trim($_POST['user_sn']) ? trim($_POST['user_sn']) : '';
        $role_id = is_numeric($_POST['role_id']) ? intval($_POST['role_id']) : 0;
        $rolelist = $this -> config -> item('oa_config')['role'];
        $role = $rolelist[$role_id];
        $orgstr_id = is_numeric($_POST['orgstr_id']) ? intval($_POST['orgstr_id']) : 0;
        $orgstr_tree = trim($_POST['orgstr_tree']) ? trim($_POST['orgstr_tree']) : '';
        $sql_sellman = "update oa_orgstr set user_id='{$user_id}', user_name='{$user_name}', user_sn='{$user_sn}', role='{$role}', role_id='{$role_id}', orgstr_id='{$orgstr_id}', orgstr_tree='{$orgstr_tree}' where orgstrid='{$orgstrid}'";
        $ob_sellman = $this -> db -> query($sql_sellman);
        //判断是否修改成功
        if($ob_sellman){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }
    }

    //销售组员信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_sellman ="delete from oa_orgstr where orgstrid='{$id}'";
        $ob_sellman = $this -> db ->query($sql_sellman);
        //判断是否删除成功
        if($ob_sellman){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=sellman&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_orgstr where orgstrid in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
    
    //管理员添加页表单验证
    public function check(){
    	//验证添加的管理员邮箱是否已存在
    	$user_id = trim($_GET['user_id']) ? trim($_GET['user_id']) : "";
    	$sql_userid = "select * from oa_orgstr where user_id='{$user_id}'";
    	$userid_ob = $this -> db -> query($sql_userid);
    	$userid = $userid_ob -> row_array();
    	//判断管理员邮箱是否合法
    	if(empty($userid)){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
    }
    
    //管理员修改页表单验证
    public function checkedit(){
    	//验证表单中管理员邮箱是否被更改
    	$newuserid = trim($_POST['newuserid']) ? trim($_POST['newuserid']) : "";
    	$olduserid = trim($_POST['olduserid']) ? trim($_POST['olduserid']) : "";
    	//管理员邮箱未被更改时
    	if($newuserid == $olduserid){
    		echo "true";exit;
    	}else{ //管理员邮箱改变时
    		$sql_sellman = "select * from oa_orgstr where user_id='{$newuserid}'";
    		$sellman_ob = $this -> db -> query($sql_sellman);
    		$sellman = $sellman_ob -> row_array();
    		//判断管理员邮箱是否合法
    		if(empty($sellman)){
    			echo "true";exit;
    		}else{
    			echo "false";exit;
    		}
    	}
    }
}