<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class userauth extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '用户权限管理';
    	$data['navshow'] = 'userauth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=userauth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=userauth">用户权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户权限列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkpermissions();
        $this -> load -> view('showuserauth', $data);
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
        $sql_userauth_total = "select count(id) as memTotal from oa_userauth";
        $memTotal_ob = $this -> db -> query($sql_userauth_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_userauth = "select ua.id, u.fullname, ua.auth from oa_userauth as ua left join oa_user as u on ua.userid=u.id";
        //查询条件
        if($search){
            $sql_userauth .= " where ua.id like '%{$search}%' or u.fullname like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_userauth .= " order by ua.id {$sortdir} ";
                break;
            
            case '2':
                $sql_userauth .= " order by u.fullname {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_userauth .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_userauth);
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
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=userauth&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=userauth&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//用户权限信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '用户权限添加';
        $data['navshow'] = 'userauth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=userauth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=userauth">用户权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户权限添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        //查询权限
        $sql_auth = "select cname from oa_auth";
        $ob_auth = $this -> db -> query($sql_auth);
        $auth = $ob_auth -> result_array();
        $data['auth'] = $auth;
        //查询用户
        $sql_user = "select id, fullname from oa_user where userid != '1' and is_ok=1";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('adduserauth',$data);
    }

    //执行用户权限信息添加
    public function insert(){
        //获取表单提交信息
        $userid = is_numeric($_POST['userid']) ? intval($_POST['userid']) : '';
        $auth = $_POST['auth'] ? $_POST['auth'] : '';
        $auths = '';
        if(!empty($auth)){
        	for($i=0;$i<count($auth);$i++){
        		$auths .= $auth[$i].',';
        	}
        	$auths = substr($auths,0,strlen($auths)-1);
        }else{
        	$auths = '';
        }
        $sql_userauth = "insert into oa_userauth(userid, auth) values('$userid', '$auths')";
        $obj_userauth = $this -> db -> query($sql_userauth);
        //判断添加是否成功
        if($obj_userauth){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }
    }
    
    //用户权限信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '用户权限修改';
        $data['navshow'] = 'userauth';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户权限管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=userauth">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=userauth">用户权限管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户权限修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkpermissions();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改项
        $sql_userauth = "select id, userid, auth from oa_userauth where id={$id};";
        $userauth_ob = $this -> db -> query($sql_userauth);
        $userauth = $userauth_ob -> row_array();
        if(!empty($userauth)){
        	@$datas['id'] = $userauth['id'];
        	@$datas['userid'] = $userauth['userid'];
        	if(strpos($userauth['auth'],',')){
        		@$datas['auth'] = explode(",",$userauth['auth']);
        	}else{
        		$pop = "pop";
        		$string = $userauth['auth'].",".$pop;
        		@$datas['auth'] = explode(",",$string);
        	}
        }
        $data['userauth'] = $datas;
        //查询权限
        $sql_auth = "select cname from oa_auth";
        $ob_auth = $this -> db -> query($sql_auth);
        $auth = $ob_auth -> result_array();
        $data['auth'] = $auth;
        //查询用户
        $sql_user = "select id, fullname from oa_user where userid != '1' and is_ok=1";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('edituserauth',$data);
    }

    //执行用户权限信息修改
    public function update(){
    	//获取表单提交信息
    	$id = is_numeric($_POST['id']) ? intval($_POST['id']) : '';
        $userid = is_numeric($_POST['userid']) ? intval($_POST['userid']) : '';
        $auth = $_POST['auth'] ? $_POST['auth'] : '';
        $auths = '';
        if(!empty($auth)){
        	for($i=0;$i<count($auth);$i++){
        		$auths .= $auth[$i].',';
        	}
        	$auths = substr($auths,0,strlen($auths)-1);
        }else{
        	$auths = '';
        }
        $sql_userauth = "update oa_userauth set userid='$userid',auth='$auths' where id='$id'";
        $ob_userauth = $this -> db -> query($sql_userauth);
        //判断是否修改成功
        if($ob_userauth){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }
    }


    //用户权限信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_userauth ="delete from oa_userauth where id='$id'";
        $ob_userauth = $this -> db ->query($sql_userauth);
        //判断是否删除成功
        if($ob_userauth){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=userauth&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_userauth where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
    
    //用户权限添加页表单验证
    public function check(){
    	//验证添加的用户是否已存在
    	$userid = is_numeric($_GET['userid']) ? intval($_GET['userid']) : 0;
    	$sql_userauth = "select * from oa_userauth where userid='{$userid}'";
    	$userauth_ob = $this -> db -> query($sql_userauth);
    	$userauth = $userauth_ob -> row_array();
    	//判断用户权限是否合法
    	if(empty($userauth)){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
    }
    
    //用户权限修改页表单验证
    public function checkedit(){
    	//验证表单中用户是否被更改
    	$newuserid = is_numeric($_POST['newuserid']) ? intval($_POST['newuserid']) : 0;
    	$olduserid = is_numeric($_POST['olduserid']) ? intval($_POST['olduserid']) : 0;
    	//用户权限未被更改时
    	if($newuserid == $olduserid){
    		echo "true";exit;
    	}else{ //用户改变时
    		$sql_userauth = "select * from oa_userauth where userid='{$newuserid}'";
    		$userauth_ob = $this -> db -> query($sql_userauth);
    		$userauth = $userauth_ob -> row_array();
    		//判断用户权限是否合法
    		if(empty($userauth)){
    			echo "true";exit;
    		}else{
    			echo "false";exit;
    		}
    	}
    }
}