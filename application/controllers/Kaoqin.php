<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class kaoqin extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '考勤管理';
    	$data['navshow'] = 'kaoqin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>考勤管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">考勤管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>考勤列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkkaoqin();
        $this -> load -> view('showkaoqin', $data);
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
        $sql_kaoqin_total = "select count(id) as memTotal from oa_kaoqin";
        $memTotal_ob = $this -> db -> query($sql_kaoqin_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_kaoqin = "select k.id, u.fullname, k.address, k.kqtime from oa_kaoqin as k left join oa_user as u on k.lejuid=u.id";
        //查询条件
        if($search){
            $sql_kaoqin .= " where k.id like '%{$search}%' or u.fullname like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_kaoqin .= " order by k.id {$sortdir} ";
                break;
            
            case '2':
                $sql_kaoqin .= " order by u.fullname {$sortdir} ";
                break;

            case '3':
                $sql_kaoqin .= " order by k.address {$sortdir} ";
                break;
            
            case '4':
                $sql_kaoqin .= " order by k.kqtime {$sortdir} ";
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=kaoqin&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=kaoqin&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//考勤信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '考勤添加';
        $data['navshow'] = 'kaoqin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>考勤管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">考勤管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>考勤添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkkaoqin();
        //查询所有用户
        $sql_user = "select id, fullname from oa_user where userid != '1'";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('addkaoqin',$data);
    }

    //执行考勤信息添加
    public function insert(){
        //获取表单提交信息
        $lejuid = is_numeric($_POST['lejuid']) ? intval($_POST['lejuid']) : 0;
//         $latitude = trim($_POST['latitude']) ? trim($_POST['latitude']) : '';
//         $longtitude = trim($_POST['longtitude']) ? trim($_POST['longtitude']) : '';
        $address = trim($_POST['address']) ? trim($_POST['address']) : '';
        $kqtime = trim($_POST['kqtime']) ? trim($_POST['kqtime']) : "";
        $date = date('Ymd',strtotime($kqtime));
        $sql_kaoqin = "insert into oa_kaoqin(lejuid, address, kqtime, date) values('$lejuid', '$address', '$kqtime', '$date')";
        $obj_kaoqin = $this -> db -> query($sql_kaoqin);
        //判断添加是否成功
        if($obj_kaoqin){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }
    }
    
    //考勤信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '考勤修改';
        $data['navshow'] = 'kaoqin';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>考勤管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=kaoqin">考勤管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>考勤修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkkaoqin();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改信息
        $sql_kaoqin = "select id, lejuid, address, kqtime from oa_kaoqin where id={$id};";
        $kaoqin_ob = $this -> db -> query($sql_kaoqin);
        $kaoqin = $kaoqin_ob -> row_array();
        $data['kaoqin_data'] = $kaoqin;
        //查询所有用户
        $sql_user = "select id, fullname from oa_user where userid != '1'";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('editkaoqin',$data);
    }

    //执行考勤信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $lejuid = is_numeric($_POST['lejuid']) ? intval($_POST['lejuid']) : 0;
//         $latitude = trim($_POST['latitude']) ? trim($_POST['latitude']) : "";
//         $longtitude = trim($_POST['longtitude']) ? trim($_POST['longtitude']) : "";
        $address = trim($_POST['address']) ? trim($_POST['address']) : "";
        $kqtime = trim($_POST['kqtime']) ? trim($_POST['kqtime']) : "";
        $date = date('Ymd',strtotime($kqtime));
        $sql_kaoqin = "update oa_kaoqin set lejuid='$lejuid',address='$address',kqtime='$kqtime',date='$date' where id='$id'";
        $ob_kaoqin = $this -> db -> query($sql_kaoqin);
        //判断是否修改成功
        if($ob_kaoqin){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }
    }

    //考勤信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_kaoqin ="delete from oa_kaoqin where id='$id'";
        $ob_kaoqin = $this -> db ->query($sql_kaoqin);
        //判断是否删除成功
        if($ob_kaoqin){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=kaoqin&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_kaoqin where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
}