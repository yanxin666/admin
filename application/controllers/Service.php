<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class service extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '服务支持管理';
    	$data['navshow'] = 'service';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>服务支持管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=service">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=service">服务支持管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>服务支持列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkservice();
        $this -> load -> view('showservice', $data);
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
        $sql_service_total = "select count(id) as memTotal from oa_service";
        $memTotal_ob = $this -> db -> query($sql_service_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_service = "select id, city, jstel, xztel, rltel from oa_service";
        //查询条件
        if($search){
            $sql_service .= " where id like '%{$search}%' or city like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_service .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_service .= " order by city {$sortdir} ";
                break;
                
            case '3':
                $sql_service .= " order by jstel {$sortdir} ";
                break;
                
            case '4':
                $sql_service .= " order by xztel {$sortdir} ";
                break;
                
            case '5':
                $sql_service .= " order by rltel {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_service .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_service);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $num_memData = count($memberData);
//         $service = $this -> config -> item('oa_config')['service'];
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
//             $reAjaxData['aaData'][$i]['2'] = $service[$reAjaxData['aaData'][$i]['2']];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=service&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=service&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//服务支持信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '服务支持添加';
        $data['navshow'] = 'service';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>服务支持管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=service">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=service">服务支持管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>服务支持添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkservice();
        $sql_administrative = "select city from oa_administrative";
        $ob_administrative = $this -> db -> query($sql_administrative);
        $administrative = $ob_administrative -> result_array();
        $data['administrative'] = $administrative;
        $this -> load -> view('addservice',$data);
    }

    //执行服务支持信息添加
    public function insert(){
        //获取表单提交信息
        $city = trim($_POST['city']) ? trim($_POST['city']) : '';
		$jstel = trim($_POST['jstel']) ? trim($_POST['jstel']) : '';
		$xztel = trim($_POST['xztel']) ? trim($_POST['xztel']) : '';
		$rltel = trim($_POST['rltel']) ? trim($_POST['rltel']) : '';
        $sql_service = "insert into oa_service(city, jstel, xztel, rltel) values('$city', '$jstel', '$xztel', '$rltel')";
        $obj_service = $this -> db -> query($sql_service);
        //判断添加是否成功
        if($obj_service){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=service&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=service&m=index';</script>";
        }
    }
    
    //服务支持信息修改页
    public function edit(){
        //状态栏控制
        $data['title'] = '服务支持修改';
        $data['navshow'] = 'service';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>服务支持管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=service">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=service">服务支持管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>服务支持修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkservice();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_service = "select id, city, jstel, xztel, rltel from oa_service where id='{$id}'";
        $service_ob = $this -> db -> query($sql_service);
        $service = $service_ob -> row_array();
        $data['service'] = $service;
        $sql_administrative = "select city from oa_administrative";
        $ob_administrative = $this -> db -> query($sql_administrative);
        $administrative = $ob_administrative -> result_array();
        $data['administrative'] = $administrative;
        $this -> load -> view('editservice',$data);  
    }

    //执行服务支持信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $city = trim($_POST['city']) ? trim($_POST['city']) : '';
		$jstel = trim($_POST['jstel']) ? trim($_POST['jstel']) : '';
		$xztel = trim($_POST['xztel']) ? trim($_POST['xztel']) : '';
		$rltel = trim($_POST['rltel']) ? trim($_POST['rltel']) : '';
        $sql_service = "update oa_service set city='{$city}', jstel='{$jstel}', xztel='{$xztel}', rltel='{$rltel}' where id='{$id}'";
        $ob_service = $this -> db -> query($sql_service);
        //判断是否修改成功
        if($ob_service){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=service&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=service&m=index';</script>";
        }
    }

    //服务支持信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_service ="delete from oa_service where id='{$id}'";
        $ob_service = $this -> db ->query($sql_service);
        //判断是否删除成功
        if($ob_service){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=service&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=service&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_service where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
    
    //服务支持添加页表单验证
    public function check(){
    	//验证添加的服务支持是否已存在
    	$city = trim($_GET['city']) ? trim($_GET['city']) : "";
    	$sql_service = "select * from oa_service where city='{$city}'";
    	$service_ob = $this -> db -> query($sql_service);
    	$service = $service_ob -> row_array();
    	//判断服务支持是否合法
    	if(empty($service)){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
    }
    
    //服务支持修改页表单验证
    public function checkedit(){
    	//验证表单中服务支持是否被更改
    	$newcity = trim($_POST['newcity']) ? trim($_POST['newcity']) : "";
    	$oldcity = trim($_POST['oldcity']) ? trim($_POST['oldcity']) : "";
    	//服务支持未被更改时
    	if($newcity == $oldcity){
    		echo "true";exit;
    	}else{ //服务支持改变时
    		$sql_service = "select * from oa_service where city='{$newcity}'";
    		$service_ob = $this -> db -> query($sql_service);
    		$service = $service_ob -> row_array();
    		//判断服务支持是否合法
    		if(empty($service)){
    			echo "true";exit;
    		}else{
    			echo "false";exit;
    		}
    	}
    }
}