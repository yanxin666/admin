<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class zhaopin extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '招聘职位管理';
    	$data['navshow'] = 'zhaopin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>招聘职位管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">招聘职位管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>招聘职位列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkzhaopin();
        $this -> load -> view('showzhaopin', $data);
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
        $sql_zhaopin_total = "select count(id) as memTotal from oa_zhaopin";
        $memTotal_ob = $this -> db -> query($sql_zhaopin_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select id, position, num, address, time, limittime, edu, bonus, status from oa_zhaopin";
        //查询条件
        if($search){
            $sql_member .= " where id like '%{$search}%' or position like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by position {$sortdir} ";
                break;

            case '3':
                $sql_member .= " order by num {$sortdir} ";
                break;
                
            case '4':
                $sql_member .= " order by address {$sortdir} ";
                break;
            
            case '5':
                $sql_member .= " order by time {$sortdir} ";
                break;
                
            case '6':
                $sql_member .= " order by limittime {$sortdir} ";
                break;
                
            case '7':
                $sql_member .= " order by edu {$sortdir} ";
                break;
				
			case '8':
                $sql_member .= " order by bonus {$sortdir} ";
                break;
                
            case '9':
                $sql_member .= " order by status {$sortdir} ";
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
            $reAjaxData['aaData'][$i][9] = $status[$reAjaxData['aaData'][$i][9]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=zhaopin&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=zhaopin&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<11;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        } 
        exit;
    } 

	//招聘职位信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '招聘职位添加';
        $data['navshow'] = 'zhaopin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>招聘职位管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">招聘职位管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>招聘职位添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkzhaopin();
        $this -> load -> view('addzhaopin',$data);
    }

    //执行招聘职位信息添加
    public function insert(){
        //获取表单提交信息
        $position = trim($_POST['position']) ? trim($_POST['position']) : '';
        $num = is_numeric($_POST['num']) ? intval($_POST['num']) : 0;
        $address = trim($_POST['address']) ? trim($_POST['address']) : '';
// 		$time = trim($_POST['time']) ? trim($_POST['time']) : '';
        $time = date("Y-m-d",time());
		$limittime = trim($_POST['limittime']) ? trim($_POST['limittime']) : '';
		$edu = trim($_POST['edu']) ? trim($_POST['edu']) : '';
        $bonus = is_numeric($_POST['bonus']) ? intval($_POST['bonus']) : 0;
        $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
        $jobduty = $_POST['jobduty'] ? $_POST['jobduty'] : '';
		$jobneed = $_POST['jobneed'] ? $_POST['jobneed'] : '';
        $sql_zhaopin = "insert into oa_zhaopin(position, num, address, time, limittime, edu, bonus, status, jobduty, jobneed) values('$position', '$num', '$address', '$time', '$limittime', '$edu', '$bonus', '$status', '$jobduty', '$jobneed')";
        $obj_zhaopin = $this -> db -> query($sql_zhaopin);
        //判断添加是否成功
        if($obj_zhaopin){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }
    }
    
    //招聘职位信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '招聘职位修改';
        $data['navshow'] = 'zhaopin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>招聘职位管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=zhaopin">招聘职位管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>招聘职位修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkzhaopin();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_zhaopin = "select * from oa_zhaopin where id={$id};";
        $zhaopin_ob = $this -> db -> query($sql_zhaopin);
        $zhaopin = $zhaopin_ob -> row_array();
        $data['zhaopin'] = $zhaopin;
        $this -> load -> view('editzhaopin',$data);
    }

    //执行招聘职位信息修改
    public function update(){
        //获取表单提交信息
		$id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $position = trim($_POST['position']) ? trim($_POST['position']) : '';
        $num = is_numeric($_POST['num']) ? intval($_POST['num']) : 0;
        $address = trim($_POST['address']) ? trim($_POST['address']) : '';
// 		$time = trim($_POST['time']) ? trim($_POST['time']) : '';
		$time = date("Y-m-d",time());
		$limittime = trim($_POST['limittime']) ? trim($_POST['limittime']) : '';
		$edu = trim($_POST['edu']) ? trim($_POST['edu']) : '';
        $bonus = is_numeric($_POST['bonus']) ? intval($_POST['bonus']) : 0;
        $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
        $jobduty = $_POST['jobduty'] ? $_POST['jobduty'] : '';
		$jobneed = $_POST['jobneed'] ? $_POST['jobneed'] : '';
        $sql_zhaopin = "update oa_zhaopin set position='$position',num='$num',address='$address',time='$time',limittime='$limittime',edu='$edu',bonus='$bonus',status='$status',jobduty='$jobduty',jobneed='$jobneed' where id='$id'";
        $ob_zhaopin = $this -> db -> query($sql_zhaopin);
        //判断是否修改成功
        if($ob_zhaopin){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }
    }

    //招聘职位信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_zhaopin ="delete from oa_zhaopin where id='$id'";
        $ob_zhaopin = $this -> db ->query($sql_zhaopin);
        //判断是否删除成功
        if($ob_zhaopin){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=zhaopin&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_zhaopin where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //招聘职位添加页表单验证
    public function check(){
        //验证添加的招聘职位是否已存在
        $position = trim($_GET['position']) ? trim($_GET['position']) : "";
        $sql_zhaopin = "select * from oa_zhaopin where position='$position'";
        $zhaopin_ob = $this -> db -> query($sql_zhaopin);
        $zhaopin = $zhaopin_ob -> row_array();
        //判断招聘职位是否合法
        if(empty($zhaopin)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //招聘职位修改页表单验证
    public function checkedit(){
        //验证表单中招聘职位是否被更改
        $newposition = trim($_POST['newposition']) ? trim($_POST['newposition']) : "";
        $oldposition = trim($_POST['oldposition']) ? trim($_POST['oldposition']) : "";
        //招聘职位未被更改时
        if($newposition == $oldposition){
            echo "true";exit;
        }else{ //招聘职位改变时
            $sql_position = "select * from oa_zhaopin where position='$newposition';";
            $position_ob = $this -> db -> query($sql_position);
            $position = $position_ob -> row_array();
            //判断招聘职位是否合法
            if(empty($position)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}