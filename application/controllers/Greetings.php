<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class greetings extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '问候语管理';
    	$data['navshow'] = 'greetings';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>问候语管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=greetings">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=greetings">问候语管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>问候语列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkgreetings();
        $this -> load -> view('showgreetings', $data);
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
        $sql_greetings_total = "select count(id) as memTotal from oa_greetings";
        $memTotal_ob = $this -> db -> query($sql_greetings_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_menu = "select id, content, color, createtime from oa_greetings";
        //查询条件
        if($search){
            $sql_menu .= " where id like '%{$search}%' or content like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_menu .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_menu .= " order by content {$sortdir} ";
                break;
                
            case '3':
                $sql_menu .= " order by color {$sortdir} ";
                break;

            case '4':
                $sql_menu .= " order by createtime {$sortdir} ";
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=greetings&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>';
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

	//问候语信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '问候语添加';
        $data['navshow'] = 'greetings';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>问候语管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=greetings">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=greetings">问候语管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>问候语添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkgreetings();
        $this -> load -> view('addgreetings',$data);
    }

    //执行问候语信息添加
    public function insert(){
        //获取表单提交信息
    	//图片上传定义上传路径
    	$date = date("Ymd",time());
    	$string = substr($date,0,6);
    	if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
    		mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
    	}
    	$config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
    	//定义文件格式
    	$config['allowed_types'] = array('jpg','gif','png');
    	//定义新的名字
    	$config['file_name'] = time().'.jpg';
    	//上传
    	$this -> load ->library('upload', $config);
    	if( ! $this->upload->do_upload('img')){
    		echo "<script>alert('图片上传失败');parent.location.href='index.php?c=greetings&m=add';</script>";exit;
    	}else{
    		$imgs = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
    		$img = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $imgs));
    	}
        $content = trim($_POST['content']) ? trim($_POST['content']) : '';
		$color = trim($_POST['color']) ? trim($_POST['color']) : '';
        $createtime = date("Y-m-d H:i:s",time());
        $sql_greetings = "insert into oa_greetings(img, content, color, createtime) values('$img', '$content', '$color', '$createtime')";
        $obj_greetings = $this -> db -> query($sql_greetings);
        //判断添加是否成功
        if($obj_greetings){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }
    }
    
    //问候语信息修改页
    public function edit(){
        //状态栏控制
        $data['title'] = '问候语修改';
        $data['navshow'] = 'greetings';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>问候语管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=greetings">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=greetings">问候语管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>问候语修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkgreetings();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_greetings = "select id, img, content, color from oa_greetings where id={$id};";
        $greetings_ob = $this -> db -> query($sql_greetings);
        $greetings = $greetings_ob -> row_array();
        $data['greetings'] = $greetings;
        $this -> load -> view('editgreetings',$data);  
    }

    //执行问候语信息修改
    public function update(){
        //获取表单提交信息
    	//图片上传定义上传路径
    	$date = date("Ymd",time());
    	$string = substr($date,0,6);
    	if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
    		mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
    	}
    	$config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
    	//定义文件格式
    	$config['allowed_types'] = array('jpg','gif','png');
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
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $content = trim($_POST['content']) ? trim($_POST['content']) : "";
        $color = trim($_POST['color']) ? trim($_POST['color']) : "";
        $createtime = date("Y-m-d H:i:s",time());
        $sql_greetings = "update oa_greetings set img='$img', content='$content',color='$color',createtime='$createtime' where id='$id'";
        $ob_greetings = $this -> db -> query($sql_greetings);
        //判断是否修改成功
        if($ob_greetings){
        	if(!empty($newimg)){
        		$img = str_replace("data/", "", $oldimg);
        		@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
        	}
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }
    }

    //问候语信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_del = "select img from oa_greetings where id='{$id}'";
        $ob_del = $this -> db -> query($sql_del);
        $del = $ob_del -> row_array();
        $sql_greetings ="delete from oa_greetings where id='{$id}'";
        $ob_greetings = $this -> db ->query($sql_greetings);
        //判断是否删除成功
        if($ob_greetings){
        	$img = str_replace("data/", "", $del['img']);
        	@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=greetings&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_img = "select img from oa_greetings where id in ($idlist)";
    	$ob_img = $this -> db -> query($sql_img);
    	$imgs = $ob_img -> result_array();
    	$sql_del = "delete from oa_greetings where id in ($idlist)";
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
}