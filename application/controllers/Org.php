<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class org extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '组织机构管理';
    	$data['navshow'] = 'org';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>组织机构管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=org">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=org">组织机构管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>组织机构列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkorg();
        $this -> load -> view('showorg', $data);
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
        $sql_org_total = "select count(id) as memTotal from oa_org";
        $memTotal_ob = $this -> db -> query($sql_org_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select id, parent_id, depart_name, parent_path, order_id, level, old_exits_id from oa_org";
        //查询条件
        if($search){
            $sql_member .= " where id like '%{$search}%' or depart_name like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by parent_id {$sortdir} ";
                break;

            case '3':
                $sql_member .= " order by depart_name {$sortdir} ";
                break;
            
            case '4':
                $sql_member .= " order by parent_path {$sortdir} ";
                break;
                
            case '5':
                $sql_member .= " order by order_id {$sortdir} ";
                break;
                
            case '6':
                $sql_member .= " order by level {$sortdir} ";
                break;
                
            case '7':
                $sql_member .= " order by old_exits_id {$sortdir} ";
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=org&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=org&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//组织机构信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '组织机构添加';
        $data['navshow'] = 'org';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>组织机构管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=org">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=org">组织机构管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>组织机构添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkorg();
        $sql_org = "select depart_name, old_exits_id, level from oa_org where level=0";
        $org_ob = $this -> db -> query($sql_org);
        $org = $org_ob -> result_array();
        $data['org'] = $org;
        $this -> load -> view('addorg',$data);
    }

    //执行组织机构信息添加
    public function insert(){
        //获取表单提交信息
        $parent_id = is_numeric($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        $depart_name = trim($_POST['depart_name']) ? trim($_POST['depart_name']) : '';
        $parent_path = "0".",".$parent_id.",";
        $order_id = is_numeric($_POST['order_id']) ? intval($_POST['order_id']) : 0;
        $level = 1;
        $old_exits_id = is_numeric($_POST['old_exits_id']) ? intval($_POST['old_exits_id']) : 0;
        $sql_org = "insert into oa_org(parent_id, depart_name, parent_path, order_id, level, old_exits_id) values('$parent_id', '$depart_name', '$parent_path', '$order_id', '$level', '$old_exits_id')";
        $obj_org = $this -> db -> query($sql_org);
        //判断添加是否成功
        if($obj_org){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=org&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=org&m=index';</script>";
        }
    }
    
    //组织机构信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '组织机构修改';
        $data['navshow'] = 'org';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>组织机构管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=org">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=org">组织机构管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>组织机构修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkorg();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_org = "select id, parent_id, depart_name, order_id, old_exits_id from oa_org where id={$id};";
        $org_ob = $this -> db -> query($sql_org);
        $org = $org_ob -> row_array();
        $data['org'] = $org;
        $sql_orgs = "select depart_name, old_exits_id from oa_org where level=0";
        $orgs_ob = $this -> db -> query($sql_orgs);
        $orgs = $orgs_ob -> result_array();
        $data['orgs'] = $orgs;
        $this -> load -> view('editorg',$data);
    }

    //执行组织机构信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $parent_id = is_numeric($_POST['parent_id']) ? intval($_POST['parent_id']) : 0;
        $depart_name = trim($_POST['depart_name']) ? trim($_POST['depart_name']) : '';
        $parent_path = "0".",".$parent_id.",";
        $order_id = is_numeric($_POST['order_id']) ? intval($_POST['order_id']) : 0;
        $level = 1;
        $old_exits_id = is_numeric($_POST['old_exits_id']) ? intval($_POST['old_exits_id']) : 0;
        $sql_org = "update oa_org set parent_id='$parent_id', depart_name='$depart_name', parent_path='$parent_path', order_id='$order_id', level='$level', old_exits_id='$old_exits_id' where id='$id'";
        $ob_org = $this -> db -> query($sql_org);
        //判断是否修改成功
        if($ob_org){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=org&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=org&m=index';</script>";
        }
    }

    //组织机构信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_org ="delete from oa_org where id='$id'";
        $ob_org = $this -> db ->query($sql_org);
        //判断是否删除成功
        if($ob_org){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=org&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=org&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_org where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //组织机构添加页表单验证
    public function checkname(){
        //验证添加的部门信息名称是否已存在
        $depart_name = trim($_GET['depart_name']) ? trim($_GET['depart_name']) : "";
        $sql_org = "select * from oa_org where depart_name='$depart_name'";
        $org_ob = $this -> db -> query($sql_org);
        $org = $org_ob -> row_array();
        //判断部门信息名称是否合法
        if(empty($org)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //组织机构修改页表单验证
    public function checkeditname(){
        //验证表单中部门信息名称是否被更改
        $newname = trim($_POST['newname']) ? trim($_POST['newname']) : "";
        $oldname = trim($_POST['oldname']) ? trim($_POST['oldname']) : "";
        //部门信息名称未被更改时
        if($newname == $oldname){
            echo "true";exit;
        }else{ //部门信息名称改变时
            $sql_org = "select * from oa_org where depart_name='$newname';";
            $org_ob = $this -> db -> query($sql_org);
            $org = $org_ob -> row_array();
            //判断部门信息名称是否合法
            if(empty($org)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}