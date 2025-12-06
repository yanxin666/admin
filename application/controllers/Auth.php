<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class auth extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '权限管理';
    	$data['navshow'] = 'auth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=auth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=auth">权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>权限列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkpermissions();
        $this -> load -> view('showauth', $data);
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
        $sql_auth_total = "select count(id) as memTotal from oa_auth";
        $memTotal_ob = $this -> db -> query($sql_auth_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_auth = "select id, cname, ename from oa_auth";
        //查询条件
        if($search){
            $sql_auth .= " where id like '%{$search}%' or cname like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_auth .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_auth .= " order by cname {$sortdir} ";
                break;
                
            case '3':
                $sql_auth .= " order by ename {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_auth .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_auth);
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=auth&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=auth&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<5;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        }
        exit;
    } 

	//权限信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '权限添加';
        $data['navshow'] = 'auth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=auth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=auth">权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>权限添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $this -> load -> view('addauth',$data);
    }

    //执行权限信息添加
    public function insert(){
        //获取表单提交信息
        $cname = trim($_POST['cname']) ? trim($_POST['cname']) : '';
        $ename = trim($_POST['ename']) ? trim($_POST['ename']) : '';
        $sql_auth = "insert into oa_auth(cname, ename) values('$cname', '$ename')";
        $obj_auth = $this -> db -> query($sql_auth);
        //判断添加是否成功
        if($obj_auth){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=auth&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=auth&m=index';</script>";
        }
    }
    
    //权限信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '权限修改';
        $data['navshow'] = 'auth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=auth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=auth">权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>权限修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改项
        $sql_auth = "select id, cname, ename from oa_auth where id={$id};";
        $auth_ob = $this -> db -> query($sql_auth);
        $auth = $auth_ob -> row_array();
        $data['auth'] = $auth;
        $this -> load -> view('editauth',$data);
    }

    //执行权限信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $cname = trim($_POST['cname']) ? trim($_POST['cname']) : "";
        $ename = trim($_POST['ename']) ? trim($_POST['ename']) : "";
        $sql_auth = "update oa_auth set cname='$cname',ename='$ename' where id='$id'";
        $ob_auth = $this -> db -> query($sql_auth);
        //判断是否修改成功
        if($ob_auth){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=auth&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=auth&m=index';</script>";
        }
    }


    //权限信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_auth ="delete from oa_auth where id='$id'";
        $ob_auth = $this -> db ->query($sql_auth);
        //判断是否删除成功
        if($ob_auth){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=auth&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=auth&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_auth where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //权限添加页表单验证
    public function check(){
        //验证添加的权限是否已存在
        $cname = trim($_GET['cname']) ? trim($_GET['cname']) : "";
        $sql_cname = "select * from oa_auth where cname='$cname'";
        $cname_ob = $this -> db -> query($sql_cname);
        $cnames = $cname_ob -> row_array();
        //判断权限是否合法
        if(empty($cnames)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //发卡行修改页表单验证
    public function checkedit(){
        //验证表单中发卡行是否被更改
        $newname = trim($_POST['newname']) ? trim($_POST['newname']) : "";
        $oldname = trim($_POST['oldname']) ? trim($_POST['oldname']) : "";
        //发卡行未被更改时
        if($newname == $oldname){
            echo "true";exit;
        }else{ //发卡行改变时
            $sql_name = "select * from oa_auth where cname='$newname';";
            $name_ob = $this -> db -> query($sql_name);
            $name = $name_ob -> row_array();
            //判断发卡行是否合法
            if(empty($name)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}