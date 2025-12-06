<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class view extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //意见反馈浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '意见反馈管理';
    	$data['navshow'] = 'view';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>意见反馈管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=view">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=view">意见反馈管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>意见反馈列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkview();
        $this -> load -> view('showview', $data);
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
        $sql_kaoqin_total = "select count(id) as memTotal from oa_view";
        $memTotal_ob = $this -> db -> query($sql_kaoqin_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_kaoqin = "select id, email, content, createtime from oa_view";
        //查询条件
        if($search){
            $sql_kaoqin .= " where id like '%{$search}%' or email like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_kaoqin .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_kaoqin .= " order by email {$sortdir} ";
                break;
            
            case '3':
                $sql_kaoqin .= " order by createtime {$sortdir} ";
                break;
                
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_kaoqin .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_kaoqin);
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
            $reAjaxData['aaData'][$i][] = '<a href ="/index.php?c=view&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

    //意见反馈信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_view ="delete from oa_view where id='$id'";
        $ob_view = $this -> db ->query($sql_view);
        //判断是否删除成功
        if($ob_view){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=view&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=view&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_view where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
}