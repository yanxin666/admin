<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class question extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //更多问题浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '更多问题管理';
    	$data['navshow'] = 'question';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>更多问题管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=question">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=question">更多问题管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>更多问题列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkquestion();
        $this -> load -> view('showquestion', $data);
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
        $sql_question_total = "select count(id) as memTotal from oa_question";
        $memTotal_ob = $this -> db -> query($sql_question_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_question = "select id, title, createtime from oa_question";
        //查询条件
        if($search){
            $sql_question .= " where id like '%{$search}%' or title like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_question .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_question .= " order by title {$sortdir} ";
                break;

            case '3':
                $sql_question .= " order by createtime {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_question .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_question);
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=question&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=question&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//更多问题信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '更多问题添加';
        $data['navshow'] = 'question';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>更多问题管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=question">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=question">更多问题管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>更多问题添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkquestion();
        $this -> load -> view('addquestion',$data);
    }

    //执行更多问题信息添加
    public function insert(){
        //获取表单提交信息
        $content = trim($_POST['content']) ? trim($_POST['content']) : '';
		$title = trim($_POST['title']) ? trim($_POST['title']) : '';
        $createtime = date("Y-m-d H:i:s",time());
        $sql_question = "insert into oa_question(title, content, createtime) values('$title', '$content', '$createtime')";
        $obj_question = $this -> db -> query($sql_question);
        //判断添加是否成功
        if($obj_question){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=question&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=question&m=index';</script>";
        }
    }
    
    //更多问题信息修改页
    public function edit(){
        //状态栏控制
        $data['title'] = '更多问题修改';
        $data['navshow'] = 'question';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>更多问题管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=question">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=question">更多问题管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>更多问题修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkquestion();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_question = "select id, title, content from oa_question where id={$id};";
        $question_ob = $this -> db -> query($sql_question);
        $question = $question_ob -> row_array();
        $data['question'] = $question;
        $this -> load -> view('editquestion',$data);  
    }

    //执行更多问题信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $content = trim($_POST['content']) ? trim($_POST['content']) : "";
        $title = trim($_POST['title']) ? trim($_POST['title']) : "";
        $createtime = date("Y-m-d H:i:s",time());
        $sql_question = "update oa_question set content='$content',title='$title',createtime='$createtime' where id='$id'";
        $ob_question = $this -> db -> query($sql_question);
        //判断是否修改成功
        if($ob_question){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=question&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=question&m=index';</script>";
        }
    }

    //更多问题信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_question ="delete from oa_question where id='$id'";
        $ob_question = $this -> db ->query($sql_question);
        //判断是否删除成功
        if($ob_question){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=question&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=question&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_question where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
    
    //更多问题添加页表单验证
    public function check(){
    	//验证添加的标题是否已存在
    	$title = trim($_GET['title']) ? trim($_GET['title']) : "";
    	$sql_title = "select * from oa_question where title='$title'";
    	$title_ob = $this -> db -> query($sql_title);
    	$titles = $title_ob -> row_array();
    	//判断标题是否合法
    	if(empty($titles)){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
    }
    
    //更多问题修改页表单验证
    public function checkedit(){
    	//验证表单中标题是否被更改
    	$newtitle = trim($_POST['newtitle']) ? trim($_POST['newtitle']) : "";
    	$oldtitle = trim($_POST['oldtitle']) ? trim($_POST['oldtitle']) : "";
    	//标题被更改时
    	if($newtitle == $oldtitle){
    		echo "true";exit;
    	}else{ //标题改变时
    		$sql_question = "select * from oa_question where title='$newtitle';";
    		$question_ob = $this -> db -> query($sql_question);
    		$question = $question_ob -> row_array();
    		//判断标题是否合法
    		if(empty($question)){
    			echo "true";exit;
    		}else{
    			echo "false";exit;
    		}
    	}
    }
}