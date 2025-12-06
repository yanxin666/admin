<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class bank extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '发卡行管理';
    	$data['navshow'] = 'bank';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>发卡行管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bank">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bank">发卡行管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>发卡行列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkbank();
        $this -> load -> view('showbank', $data);
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
        $sql_bank_total = "select count(id) as memTotal from oa_bank";
        $memTotal_ob = $this -> db -> query($sql_bank_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_slide = "select id, name, createtime from oa_bank";
        //查询条件
        if($search){
            $sql_slide .= " where id like '%{$search}%' or name like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_slide .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_slide .= " order by name {$sortdir} ";
                break;
                
            case '3':
                $sql_slide .= " order by createtime {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_slide .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_slide);
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=bank&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=bank&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//发卡行信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '发卡行添加';
        $data['navshow'] = 'bank';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>发卡行管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bank">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bank">发卡行管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>发卡行添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkbank();
        $this -> load -> view('addbank',$data);
    }

    //执行发卡行信息添加
    public function insert(){
        //获取表单提交信息
        $name = trim($_POST['name']) ? trim($_POST['name']) : '';
        $createtime = date('Y-m-d H:i:s',time());
        $sql_bank = "insert into oa_bank(name, createtime) values('$name', '$createtime')";
        $obj_bank = $this -> db -> query($sql_bank);
        //判断添加是否成功
        if($obj_bank){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=bank&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=bank&m=index';</script>";
        }
    }
    
    //发卡行信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '发卡行修改';
        $data['navshow'] = 'bank';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>发卡行管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bank">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bank">发卡行管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>发卡行修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkbank();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_bank = "select id, name from oa_bank where id={$id};";
        $bank_ob = $this -> db -> query($sql_bank);
        $bank = $bank_ob -> row_array();
        $data['bank'] = $bank;
        $this -> load -> view('editbank',$data);
    }

    //执行发卡行信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $name = trim($_POST['name']) ? trim($_POST['name']) : "";
        $createtime = date('Y-m-d H:i:s',time());
        $sql_bank = "update oa_bank set name='$name',createtime='$createtime' where id='$id'";
        $ob_bank = $this -> db -> query($sql_bank);
        //判断是否修改成功
        if($ob_bank){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=bank&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=bank&m=index';</script>";
        }
    }


    //发卡行信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_bank ="delete from oa_bank where id='$id'";
        $ob_bank = $this -> db ->query($sql_bank);
        //判断是否删除成功
        if($ob_bank){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=bank&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=bank&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_bank where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //发卡行添加页表单验证
    public function check(){
        //验证添加的发卡行是否已存在
        $name = trim($_GET['name']) ? trim($_GET['name']) : "";
        $sql_name = "select * from oa_bank where name='$name'";
        $name_ob = $this -> db -> query($sql_name);
        $names = $name_ob -> row_array();
        //判断发卡行是否合法
        if(empty($names)){
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
            $sql_name = "select * from oa_bank where name='$newname';";
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