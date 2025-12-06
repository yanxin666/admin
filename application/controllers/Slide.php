<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class slide extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '轮播图管理';
    	$data['navshow'] = 'slide';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>轮播图管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=slide">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=slide">轮播图管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>轮播图列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkslide();
        $this -> load -> view('showslide', $data);
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
        $sql_slide_total = "select count(id) as memTotal from oa_slide";
        $memTotal_ob = $this -> db -> query($sql_slide_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_slide = "select id, title, createtime from oa_slide";
        //查询条件
        if($search){
            $sql_slide .= " where id like '%{$search}%' or title like '%{$search}%' ";
        }
        //按对应字段排序
        $sql_slide .= " order by createtime desc ";
//         switch ($sortcol) {
//             case '1':
//                 $sql_slide .= " order by id {$sortdir} ";
//                 break;
            
//             case '2':
//                 $sql_slide .= " order by title {$sortdir} ";
//                 break;
            
//             case '3':
//                 $sql_slide .= " order by createtime {$sortdir} ";
//                 break;
            
//             default:
//                 break;
//         }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_slide .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_slide);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
//         $status = $this->config->item('oa_config')['status'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            $reAjaxData['aaData'][$i][] = '轮播图'.($i+1);
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
//             $reAjaxData['aaData'][$i][4] = $status[$reAjaxData['aaData'][$i][4]];
            $id = $reAjaxData['aaData'][$i]['2'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=slide&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>';
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

	//轮播图信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '轮播图添加';
        $data['navshow'] = 'slide';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>轮播图管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=slide">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=slide">轮播图管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>轮播图添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkslide();
        $this -> load -> view('addslide',$data);
    }

    //执行轮播图信息添加
    public function insert(){
        //获取表单提交信息
        $title = trim($_POST['title']) ? trim($_POST['title']) : '';
		//图片上传定义上传路径
		$date = date("Ymd",time());
        $string = substr($date,0,6);
        if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
        	mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
        }
        $config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
        //定义文件格式
        $config['allowed_types'] = array('jpg','gif','png');
        //定义文件宽度
        $config['max_width'] = '750';
        //定义文件高度
        $config['max_height'] = '314';
        //定义新的名字
        $config['file_name'] = time().'.jpg';
        //上传
        $this -> load ->library('upload', $config);
        if( ! $this->upload->do_upload('img')){
        	echo "<script>alert('图片尺寸超出750*314或上传失败');parent.location.href='index.php?c=slide&m=add';</script>";exit;
        }else{
        	$imgs = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
			$img = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $imgs));
        }
//         $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
		$content = trim($_POST['content']) ? trim($_POST['content']) : '';
        $viewcount = 0;
        $deptname = $_SESSION['loginInfo']['depart_name'];
        $createtime = date('Y-m-d H:i:s',time());
        $sql_slide = "insert into oa_slide(title, img, content, deptname, viewcount, createtime) values('$title', '$img', '$content', '$deptname', '$viewcount', '$createtime')";
        $obj_slide = $this -> db -> query($sql_slide);
        //判断添加是否成功
        if($obj_slide){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=slide&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=slide&m=index';</script>";
        }
    }
    
    //轮播图信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '轮播图修改';
        $data['navshow'] = 'slide';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>轮播图管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=slide">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=slide">轮播图管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>轮播图修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkslide();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
		//查询修改项
        $sql_slide = "select id, title, img, content from oa_slide where id={$id};";
        $slide_ob = $this -> db -> query($sql_slide);
        $slide = $slide_ob -> row_array();
        $data['slide_data'] = $slide;
        $this -> load -> view('editslide',$data);
    }

    //执行轮播图信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $title = trim($_POST['title']) ? trim($_POST['title']) : "";
        //图片上传定义上传路径
		$date = date("Ymd",time());
        $string = substr($date,0,6);
        if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
        	mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
        }
        $config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
        //定义文件格式
        $config['allowed_types'] = array('jpg','gif','png');
        //定义文件宽度
        $config['max_width'] = '750';
        //定义文件高度
        $config['max_height'] = '314';
        //定义新的名字
        $config['file_name'] = time().'.jpg';
        //上传
        $this -> load ->library('upload', $config);
        if($this->upload->do_upload('img')){
        	$newimgs = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
			$newimg = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $newimgs));
        }
        $oldimg = trim($_POST['oldimg']) ? trim($_POST['oldimg']) : "";
        if(empty($newimg)){
        	$img = $oldimg;
        }else{
        	$img = $newimg;
        }
//         $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
		$content = trim($_POST['content']) ? trim($_POST['content']) : '';
        $viewcount = 0;
        $deptname = $_SESSION['loginInfo']['depart_name'];
        $createtime = date('Y-m-d H:i:s',time());
        $sql_slide = "update oa_slide set title='$title',img='$img',content='$content',deptname='$deptname',viewcount='$viewcount',createtime='$createtime' where id='$id'";
        $ob_slide = $this -> db -> query($sql_slide);
        //判断是否修改成功
        if($ob_slide){
        	if(!empty($newimg)){
    			$img = str_replace("data/", "", $oldimg);
    			@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
    		}
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=slide&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=slide&m=index';</script>";
        }
    }


    //轮播图信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
		$sql_del = "select img from oa_slide where id=$id";
        $ob_del = $this -> db -> query($sql_del);
        $del = $ob_del -> row_array();
        $sql_slide ="delete from oa_slide where id='$id'";
        $ob_slide = $this -> db ->query($sql_slide);
        //判断是否删除成功
        if($ob_slide){
			$img = str_replace("data/", "", $del['img']);
			@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=slide&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=slide&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_img = "select img from oa_slide where id in ($idlist)";
    	$ob_img = $this -> db -> query($sql_img);
    	$imgs = $ob_img -> result_array();
    	$sql_del = "delete from oa_slide where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		foreach($imgs as $pic){
    			$img = str_replace("data/", "", $pic['img']);
    			@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
    		}
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //轮播图添加页表单验证
    public function checktitle(){
        //验证添加的轮播图名称是否已存在
        $title = trim($_GET['title']) ? trim($_GET['title']) : "";
        $sql_title = "select * from oa_slide where title='$title'";
        $title_ob = $this -> db -> query($sql_title);
        $titles = $title_ob -> row_array();
        //判断轮播图名称是否合法
        if(empty($titles)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //轮播图修改页表单验证
    public function checkedittitle(){
        //验证表单中轮播图名称是否被更改
        $newtitle = trim($_POST['newtitle']) ? trim($_POST['newtitle']) : "";
        $oldtitle = trim($_POST['oldtitle']) ? trim($_POST['oldtitle']) : "";
        //轮播图名称未被更改时
        if($newtitle == $oldtitle){
            echo "true";exit;
        }else{ //轮播图名称改变时
            $sql_title = "select * from oa_slide where title='$newtitle';";
            $title_ob = $this -> db -> query($sql_title);
            $title = $title_ob -> row_array();
            //判断轮播图名称是否合法
            if(empty($title)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}