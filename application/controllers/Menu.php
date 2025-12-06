<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class menu extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '菜单管理';
    	$data['navshow'] = 'menu';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>菜单管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=menu">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=menu">菜单管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>菜单列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkmenu();
        $this -> load -> view('showmenu', $data);
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
        $sql_menu_total = "select count(id) as memTotal from oa_menu";
        $memTotal_ob = $this -> db -> query($sql_menu_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_menu = "select id, menu, pmenuid, alias from oa_menu";
        //查询条件
        if($search){
            $sql_menu .= " where id like '%{$search}%' or menu like '%{$search}%' or alias like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_menu .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_menu .= " order by menu {$sortdir} ";
                break;

            case '3':
                $sql_menu .= " order by pmenuid {$sortdir} ";
                break;
            
            case '4':
                $sql_menu .= " order by alias {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_menu .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_menu);
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=menu&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=menu&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<6;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        } 
        exit;
    } 

	//菜单信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '菜单添加';
        $data['navshow'] = 'menu';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>菜单管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=menu">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=menu">菜单管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>菜单添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkmenu();
        $sql_menu = "select id,menu from oa_menu";
        $ob_menu = $this -> db -> query($sql_menu);
        $menu = $ob_menu -> result_array();
        $data['menu'] = $menu;
        $this -> load -> view('addmenu',$data);
    }

    //执行菜单信息添加
    public function insert(){
//     	var_dump($_POST);exit;
        //获取表单提交信息
        $menu = trim($_POST['menu']) ? trim($_POST['menu']) : '';
        $pmenuid = trim($_POST['pmenuid']) ? trim($_POST['pmenuid']) : '';
        $alias = trim($_POST['alias']) ? trim($_POST['alias']) : '';
        $sql_menu = "insert into oa_menu(menu, pmenuid, alias) values('$menu', '$pmenuid', '$alias')";
        $obj_menu = $this -> db -> query($sql_menu);
        //判断添加是否成功
        if($obj_menu){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=menu&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=menu&m=index';</script>";
        }
    }
    
    //菜单信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '菜单修改';
        $data['navshow'] = 'menu';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>菜单管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=menu">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=menu">菜单管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>菜单修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkmenu();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_menu = "select id, menu, pmenuid, alias from oa_menu where id={$id};";
        $menu_ob = $this -> db -> query($sql_menu);
        $menu = $menu_ob -> row_array();
        $data['menu_data'] = $menu;
        
        $sql_menus = "select id, menu from oa_menu";
        $ob_menus = $this -> db -> query($sql_menus);
        $menus = $ob_menus -> result_array();
        $data['menus'] = $menus;
        $this -> load -> view('editmenu',$data);
    }

    //执行菜单信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $menu = trim($_POST['menu']) ? trim($_POST['menu']) : "";
        $pmenuid = is_numeric($_POST['pmenuid']) ? intval($_POST['pmenuid']) : 0;
        $alias =  trim($_POST['alias']) ? trim($_POST['alias']) : "";
        $sql_menu = "update oa_menu set menu='$menu',pmenuid='$pmenuid',alias='$alias' where id='$id'";
        $ob_menu = $this -> db -> query($sql_menu);
        //判断是否修改成功
        if($ob_menu){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=menu&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=menu&m=index';</script>";
        }
    }

    //菜单信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_menu ="delete from oa_menu where id='$id'";
        $ob_menu = $this -> db ->query($sql_menu);
        //判断是否删除成功
        if($ob_menu){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=menu&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=menu&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_menu where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //菜单添加页表单验证
    public function checkmenu(){
        //验证添加的菜单名称是否已存在
        $menu = trim($_GET['menu']) ? trim($_GET['menu']) : "";
        $sql_menu = "select * from oa_menu where menu='$menu'";
        $menu_ob = $this -> db -> query($sql_menu);
        $menus = $menu_ob -> row_array();
        //判断菜单名称是否合法
        if(empty($menus)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //菜单修改页表单验证
    public function checkeditemenu(){
        //验证表单中菜单名称是否被更改
        $menu = trim($_POST['menu']) ? trim($_POST['menu']) : "";
        $oldmenu = trim($_POST['oldmenu']) ? trim($_POST['oldmenu']) : "";
        //菜单名称未被更改时
        if($menu == $oldmenu){
            echo "true";exit;
        }else{ //菜单名称改变时
            $sql_menu = "select * from oa_menu where menu='$menu';";
            $menu_ob = $this -> db -> query($sql_menu);
            $menus = $menu_ob -> row_array();
            //判断菜单名称是否合法
            if(empty($menus)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}