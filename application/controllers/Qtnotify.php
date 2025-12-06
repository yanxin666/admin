<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class qtnotify extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '前端通知管理';
    	$data['navshow'] = 'qtnotify';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>前端通知管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=qtnotify">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=qtnotify">前端通知管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>前端通知列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkqtnotify();
        $this -> load -> view('showqtnotify', $data);
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
        $sql_notify_total = "select count(id) as memTotal from oa_notify where whose='2'";
        $memTotal_ob = $this -> db -> query($sql_notify_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据sender_address, send_dept, notify_type, notify_man, title, content, time, state
        $sql_notify = "select id, sender_address, send_dept, title, time, state from oa_notify where whose='2' ";
        //查询条件
        if($search){
            $sql_notify .= " and id like '%{$search}%' or sender_address like '%{$search}%' or send_dept like '%{$search}%' or title like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_notify .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_notify .= " order by sender_address {$sortdir} ";
                break;

            case '3':
                $sql_notify .= " order by send_dept {$sortdir} ";
                break;
                
            case '4':
                $sql_notify .= " order by title {$sortdir} ";
                break;
            
            case '5':
                $sql_notify .= " order by time {$sortdir} ";
                break;
                
            case '6':
                $sql_notify .= " order by state {$sortdir} ";
                break;
                
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_notify .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_notify);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $state = $this->config->item('oa_config')['state'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][6] = $state[$reAjaxData['aaData'][$i][6]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href ="/index.php?c=qtnotify&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<8;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        }
        exit;
    } 

    //通知信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_notify ="delete from oa_notify where id='$id'";
        $ob_notify = $this -> db ->query($sql_notify);
        //判断是否删除成功
        if($ob_notify){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=qtnotify&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=qtnotify&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_notify where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
}