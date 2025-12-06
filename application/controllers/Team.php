<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class team extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '后台联系组管理';
    	$data['navshow'] = 'team';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台联系组管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=team">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=team">后台联系组管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台联系组列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkteam();
        $this -> load -> view('showteam', $data);
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
        $sql_team_total = "select count(id) as memTotal from oa_team where whose='1'";
        $memTotal_ob = $this -> db -> query($sql_team_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_member = "select t.id, t.team_name, u.fullname, t.type, t.creatertime from oa_team as t left join oa_user as u on t.createrid=u.id where t.whose='1' ";
        //查询条件
        if($search){
            $sql_member .= " and t.id like '%{$search}%' or t.team_name like '%{$search}%'";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_member .= " order by t.id {$sortdir} ";
                break;
            
            case '2':
                $sql_member .= " order by t.team_name {$sortdir} ";
                break;
            
            case '3':
                $sql_member .= " order by u.fullname {$sortdir} ";
                break;
            
            case '4':
                $sql_member .= " order by t.type {$sortdir} ";
                break;

            case '5':
                $sql_member .= " order by t.creatertime {$sortdir} ";
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
        $num_memData = count($memberData);
        $type = $this->config->item('oa_config')['type'];
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][4] = $type[$reAjaxData['aaData'][$i][4]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=team&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=team&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//联系组信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '后台联系组添加';
        $data['navshow'] = 'team';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台联系组管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=team">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=team">后台联系组管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台联系组添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkteam();
        //查询所有用户
        $sql_users = "select id, fullname from oa_user where is_ok=1";
        $ob_users = $this -> db -> query($sql_users);
        $users = $ob_users -> result_array();
        $data['users'] = $users;
        //查询部门
        $sql_org = "select depart_name, old_exits_id from oa_org order by old_exits_id";
        $ob_org = $this -> db -> query($sql_org);
        $org = $ob_org -> result_array();
        $data['org'] = $org;
        //查询个人
        $sql_user = "select id, lejumail, fullname from oa_user where userid != '1' order by id";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('addteam',$data);
    }

    //执行联系组信息添加
    public function insert(){
        //获取表单提交信息
        $team_name = trim($_POST['team_name']) ? trim($_POST['team_name']) : '';
//         $team_mails = trim($_POST['team_mails']) ? trim($_POST['team_mails']) : '';
        $createrid = is_numeric($_POST['createrid']) ? intval($_POST['createrid']) : 0;
//      $type = is_numeric($_POST['type']) ? intval($_POST['type']) : 0;
        $creatertime = date('Y-m-d H:i:s',time());
        $dept = @$_POST['dept'] ? $_POST['dept'] : '';
        if(!empty($dept)){
        	$deptlist = '';
        	foreach($dept as $val){
        		$deptlist .= $val.",";
        	}
//         	$deptlist = substr($deptlist,0,strlen($deptlist)-1);
        	$deptlist = trim($deptlist,',');
        	if(strpos($deptlist,',') == true){
        		$sql_user = "select id, lejumail from oa_user where dept in ($deptlist)";
        	}else{
        		$sql_user = "select id, lejumail from oa_user where dept='$deptlist'";
        	}
        	$ob_user = $this -> db -> query($sql_user);
        	$users = $ob_user -> result_array();
        	$emails = '';
        	$list = '';
        	foreach($users as $v){
        		$emails .= $v['lejumail'].",";
        		$list .= $v['id'].",";
        	}
//         	$emails = substr($emails,0,strlen($emails)-1);
//         	$lists = substr($list,0,strlen($list)-1);
        	$emails = trim($emails,',');
        	$lists = trim($list,',');
        }
        $user = @$_POST['user'] ? $_POST['user'] : '';
        if(!empty($user)){
        	$userlist = '';
        	$list_id = '';
        	foreach($user as $value){
        		$userlist .= substr($value,0,strpos($value,'@')).',';
        		$list_id .= substr($value,strpos($value,'@')+1,strlen($value)).',';
        	}
//         	$email = substr($userlist,0,strlen($userlist)-1);
//         	$listids = substr($list_id,0,strlen($list_id)-1);
        	$email = trim($userlist,',');
        	$listids = trim($list_id,',');
        }
        if(empty($dept) && empty($user)){
        	echo "<script>alert('请选择部门或个人!');parent.location.href='index.php?c=team&m=add';</script>";
        }else if(!empty($dept) && empty($user)){
        	$team_man = $emails;
        	$listid = $lists;
        }else if(empty($dept) && !empty($user)){
        	$team_man = $email;
        	$listid = $listids;
        }else{
        	$team_man = $emails.",".$email;
        	$listid = $lists.','.$listids;
        }
        $sql_team = "insert into oa_team(team_name, createrid, listid, team_man, type, whose, is_shoucang, creatertime) values('$team_name', '$createrid', '$listid', '$team_man', '2', '1', '2', '$creatertime')";
        $obj_team = $this -> db -> query($sql_team);
        //判断添加是否成功
        if($obj_team){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=team&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=team&m=index';</script>";
        }
    }
    
    //联系组信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '后台联系组修改';
        $data['navshow'] = 'team';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台联系组管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=team">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=team">后台联系组管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台联系组修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkteam();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改信息
        $sql_team = "select id, team_name, createrid, type from oa_team where id={$id};";
        $team_ob = $this -> db -> query($sql_team);
        $team = $team_ob -> row_array();
        $data['team_data'] = $team;
        //查询所有用户
        $sql_users = "select id, fullname from oa_user where is_ok='1'";
        $ob_users = $this -> db -> query($sql_users);
        $users = $ob_users -> result_array();
        $data['users'] = $users;
        //查询部门
        $sql_org = "select depart_name, old_exits_id from oa_org order by old_exits_id";
        $ob_org = $this -> db -> query($sql_org);
        $org = $ob_org -> result_array();
        $data['org'] = $org;
        //查询个人
        $sql_user = "select id, lejumail, fullname from oa_user where userid != '1' order by id";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('editteam',$data);
    }

    //执行联系组信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $team_name = trim($_POST['team_name']) ? trim($_POST['team_name']) : "";
//         $team_mails = trim($_POST['team_mails']) ? trim($_POST['team_mails']) : "";
        $createrid = is_numeric($_POST['createrid']) ? intval($_POST['createrid']) : 0;
//         $type = is_numeric($_POST['type']) ? intval($_POST['type']) : 0;
        $creatertime = date('Y-m-d H:i:s',time());
        $dept = @$_POST['dept'] ? $_POST['dept'] : '';
        if(!empty($dept)){
        	$deptlist = '';
        	foreach($dept as $val){
        		$deptlist .= $val.",";
        	}
//         	$deptlist = substr($deptlist,0,strlen($deptlist)-1);
        	$deptlist = trim($deptlist,',');
        	if(strpos($deptlist,',') == true){
        		$sql_user = "select id, lejumail from oa_user where dept in ($deptlist)";
        	}else{
        		$sql_user = "select id, lejumail from oa_user where dept='$deptlist'";
        	}
        	$ob_user = $this -> db -> query($sql_user);
        	$users = $ob_user -> result_array();
        	$emails = '';
        	$list = '';
        	foreach($users as $v){
        		$emails .= $v['lejumail'].",";
        		$list .= $v['id'].",";
        	}
//         	$emails = substr($emails,0,strlen($emails)-1);
//         	$lists = substr($list,0,strlen($list)-1);
        	$emails = trim($emails,',');
        	$lists = trim($list,',');
        }
        $user = @$_POST['user'] ? $_POST['user'] : '';
        if(!empty($user)){
        	$userlist = '';
        	$list_id = '';
        	foreach($user as $value){
//         		$userlist .= $value.",";
        		$userlist .= substr($value,0,strpos($value,'@')).',';
        		$list_id .= substr($value,strpos($value,'@')+1,strlen($value)).',';
        	}
//         	$email = substr($userlist,0,strlen($userlist)-1);
//         	$listids = substr($list_id,0,strlen($list_id)-1);
        	$email = trim($userlist,',');
        	$listids = trim($list_id,',');
        }
        if(empty($dept) && empty($user)){
        	echo "<script>alert('请选择部门或个人!');parent.location.href='index.php?c=team&m=edit&id=$id';</script>";
        }else if(!empty($dept) && empty($user)){
        	$team_man = $emails;
        	$listid = $lists;
        }else if(empty($dept) && !empty($user)){
        	$team_man = $email;
        	$listid = $listids;
        }else{
        	$team_man = $emails.",".$email;
        	$listid = $lists.','.$listids;
        }
        $sql_team = "update oa_team set team_name='$team_name',createrid='$createrid',listid='$listid',team_man='$team_man',type='2',whose='1',is_shoucang='2',creatertime='$creatertime' where id='$id'";
        $ob_team = $this -> db -> query($sql_team);
        //判断是否修改成功
        if($ob_team){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=team&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=team&m=index';</script>";
        }
    }

    //联系组信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_team ="delete from oa_team where id='$id'";
        $ob_team = $this -> db ->query($sql_team);
        //判断是否删除成功
        if($ob_team){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=team&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=team&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_team where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //联系组添加页表单验证
    public function checkename(){
        //验证添加的组名称是否已存在
        $team_name = trim($_GET['team_name']) ? trim($_GET['team_name']) : "";
        $sql_team = "select * from oa_team where team_name='$team_name' and whose='1' and type='2'";
        $team_ob = $this -> db -> query($sql_team);
        $team = $team_ob -> row_array();
        //判断组名称是否合法
        if(empty($team)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //联系组修改页表单验证
    public function checkeditname(){
        //验证表单中组名称是否被更改
        $newname = trim($_POST['newname']) ? trim($_POST['newname']) : "";
        $oldname = trim($_POST['oldname']) ? trim($_POST['oldname']) : "";
        //组名称未被更改时
        if($newname == $oldname){
            echo "true";exit;
        }else{ //组名称改变时
            $sql_team = "select * from oa_team where team_name='$newname' and whose='1' and type='2';";
            $team_ob = $this -> db -> query($sql_team);
            $team = $team_ob -> row_array();
            //判断组名称是否合法
            if(empty($team)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}