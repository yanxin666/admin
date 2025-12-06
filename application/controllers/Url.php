<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class url extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '网址推荐管理';
    	$data['navshow'] = 'url';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>网址推荐管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=url">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=url">网址推荐管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>网址推荐列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkurl();
        $this -> load -> view('showurl', $data);
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
        $sql_url_total = "select count(id) as memTotal from oa_url";
        $memTotal_ob = $this -> db -> query($sql_url_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select id, url, status, createtime from oa_url";
        //查询条件
        if($search){
            $sql_member .= " where id like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by url {$sortdir} ";
                break;

            case '3':
                $sql_member .= " order by status {$sortdir} ";
                break;
            
            case '4':
                $sql_member .= " order by createtime {$sortdir} ";
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
        $status = $this->config->item('oa_config')['status'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][3] = $status[$reAjaxData['aaData'][$i][3]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=url&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=url&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//网址推荐信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '网址推荐添加';
        $data['navshow'] = 'url';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>网址推荐管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=url">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=url">网址推荐管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>网址推荐添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkurl();
        $this -> load -> view('addurl',$data);
    }

    //执行网址推荐信息添加
    public function insert(){
        //获取表单提交信息
        $url = trim($_POST['url']) ? trim($_POST['url']) : '';
        $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
        $createtime = date('Y-m-d H:i:s',time());
        $sql_url = "insert into oa_url(url, status, createtime) values('$url', '$status', '$createtime')";
        $obj_url = $this -> db -> query($sql_url);
        //判断添加是否成功
        if($obj_url){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=url&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=url&m=index';</script>";
        }
    }
    
    //网址推荐信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '网址推荐修改';
        $data['navshow'] = 'url';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>网址推荐管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=url">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=url">网址推荐管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>网址推荐修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkurl();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_url = "select id, url, status from oa_url where id={$id};";
        $url_ob = $this -> db -> query($sql_url);
        $url = $url_ob -> row_array();
        $data['url'] = $url;
        $this -> load -> view('editurl',$data);
    }

    //执行网址推荐信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $url = trim($_POST['url']) ? trim($_POST['url']) : "";
        $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
        $createtime = date('Y-m-d H:i:s',time());
        $sql_url = "update oa_url set url='$url',status='$status',createtime='$createtime' where id='$id'";
        $ob_url = $this -> db -> query($sql_url);
        //判断是否修改成功
        if($ob_url){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=url&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=url&m=index';</script>";
        }
    }

    //网址推荐信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_url ="delete from oa_url where id='$id'";
        $ob_url = $this -> db ->query($sql_url);
        //判断是否删除成功
        if($ob_url){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=url&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=url&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_url where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //网址推荐添加页表单验证
    public function check(){
        //验证添加的网址是否已存在
        $url = trim($_GET['url']) ? trim($_GET['url']) : "";
        $sql_url = "select * from oa_url where url='$url'";
        $url_ob = $this -> db -> query($sql_url);
        $urls = $url_ob -> row_array();
        //判断网址是否合法
        if(empty($urls)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //网址推荐修改页表单验证
    public function checkedit(){
        //验证表单中网址是否被更改
        $newurl = trim($_POST['newurl']) ? trim($_POST['newurl']) : "";
        $oldurl = trim($_POST['oldurl']) ? trim($_POST['oldurl']) : "";
        //网址未被更改时
        if($newurl == $oldurl){
            echo "true";exit;
        }else{ //网址改变时
            $sql_url = "select * from oa_url where url='$newurl';";
            $url_ob = $this -> db -> query($sql_url);
            $url = $url_ob -> row_array();
            //判断网址是否合法
            if(empty($url)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}