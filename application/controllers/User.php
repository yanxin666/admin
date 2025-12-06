<?php
ini_set("display_errors", "On"); 
error_reporting(E_ALL);
defined('BASEPATH') OR exit('No direct script access allowed');

class user extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '用户管理';
    	$data['navshow'] = 'user';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=user">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=user">用户管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkusers();
        $this -> load -> view('showuser', $data);
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
        $sql_notify_total = "select count(id) as memTotal from oa_user where id!=1";
        $memTotal_ob = $this -> db -> query($sql_notify_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_notify = "select id, username, sno, fullname, tel, mobile, ctype, status, is_ok from oa_user where userid != '1'";
        //查询条件
        if($search){
            $sql_notify .= " and id like '%{$search}%' or username like '%{$search}%' or sno like '%{$search}%' or fullname like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_notify .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_notify .= " order by username {$sortdir} ";
                break;
            
            case '3':
                $sql_notify .= " order by sno {$sortdir} ";
                break;
            
            case '4':
                $sql_notify .= " order by fullname {$sortdir} ";
                break;
                
            case '5':
                $sql_notify .= " order by tel {$sortdir} ";
                break;
                
            case '6':
                $sql_notify .= " order by mobile {$sortdir} ";
                break;
                
            case '7':
                $sql_notify .= " order by ctype {$sortdir} ";
                break;

            case '8':
                $sql_notify .= " order by status {$sortdir} ";
                break;
                
            case '9':
                $sql_notify .= " order by is_ok {$sortdir} ";
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
        $ctype = $this->config->item('oa_config')['ctype'];
        $status = $this->config->item('oa_config')['status'];
        $is_notify = $this->config->item('oa_config')['is_notify'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
//             $reAjaxData['aaData'][$i][5] = $is_notify[$reAjaxData['aaData'][$i][5]];
            $reAjaxData['aaData'][$i][7] = $ctype[$reAjaxData['aaData'][$i][7]];
            $reAjaxData['aaData'][$i][8] = $status[$reAjaxData['aaData'][$i][8]];
            $reAjaxData['aaData'][$i][9] = $is_notify[$reAjaxData['aaData'][$i][9]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=user&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=user&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//用户信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '用户添加';
        $data['navshow'] = 'user';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=user">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=user">用户管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkusers();
        $this -> load -> view('adduser',$data);
    }

    //执行用户信息添加
    public function insert(){
        //获取表单提交信息
        $username = trim($_POST['username']) ? trim($_POST['username']) : '';
        $lejumail = trim($_POST['lejumail']) ? trim($_POST['lejumail']) : '';
        $sno = trim($_POST['sno']) ? trim($_POST['sno']) : '';
        $fullname = trim($_POST['fullname']) ? trim($_POST['fullname']) : '';
        $city = trim($_POST['city']) ? trim($_POST['city']) : '';
        $dept = is_numeric($_POST['dept']) ? intval($_POST['dept']) : 0;
        $depart_name = trim($_POST['depart_name']) ? trim($_POST['depart_name']) : '';
        $lft = trim($_POST['lft']) ? trim($_POST['lft']) : '';
        $rgt = trim($_POST['rgt']) ? trim($_POST['rgt']) : '';
        $wtype = is_numeric($_POST['wtype']) ? intval($_POST['wtype']) : 0;
        $tel = trim($_POST['tel']) ? trim($_POST['tel']) : '';
        $mobile = trim($_POST['mobile']) ? trim($_POST['mobile']) : '';
        $ctype = is_numeric($_POST['ctype']) ? intval($_POST['ctype']) : 0;
        $position = trim($_POST['position']) ? trim($_POST['position']) : '';
        $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
        $birthday = trim($_POST['birthday']) ? trim($_POST['birthday']) : '';
// 		$entrytime = trim($_POST['entrytime']) ? trim($_POST['entrytime']) : '';
        $work_position = trim($_POST['work_position']) ? trim($_POST['work_position']) : '';
        $city_true = trim($_POST['city_true']) ? trim($_POST['city_true']) : '';
        $mailname = trim($_POST['mailname']) ? trim($_POST['mailname']) : '';
        $role_id = is_numeric($_POST['role_id']) ? intval($_POST['role_id']) : 0;
        $weibo = trim($_POST['weibo']) ? trim($_POST['weibo']) : '';
        $quanxian = array('总裁办','人力资源部','行政部');
        if(in_array($depart_name,$quanxian)){
        	$is_notify = @is_numeric($_POST['is_notify']) ? intval($_POST['is_notify']) : 0;
        }else{
        	$is_notify = 0;
        }
        $is_exists = is_numeric($_POST['is_exists']) ? intval($_POST['is_exists']) : 0;
		$is_ok = is_numeric($_POST['is_ok']) ? intval($_POST['is_ok']) : 0;
        $wmh = trim($_POST['wmh']) ? trim($_POST['wmh']) : '';
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
        if( ! $this->upload->do_upload('pic_path')){
        	echo "<script>alert('图片上传失败');parent.location.href='index.php?c=user&m=add';</script>";exit;
        }else{
        	$pic_paths = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
			$pic_path = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $pic_paths));
        }
        $sql_user = "insert into oa_user(username, lejumail, sno, fullname, city, dept, depart_name, lft, rgt, wtype, tel, mobile, ctype, position, status, birthday, work_position, city_true, mailname, role_id, weibo, is_notify, is_exists, is_ok, wmh, pic_path) values('$username', '$lejumail', '$sno', '$fullname', '$city', '$dept', '$depart_name', '$lft', '$rgt', '$wtype', '$tel', '$mobile', '$ctype', '$position', '$status', '$birthday', '$work_position', '$city_true', '$mailname', '$role_id', '$weibo', '$is_notify', '$is_exists', '$is_ok', '$wmh', '$pic_path')";
        $obj_user = $this -> db -> query($sql_user);
        //判断添加是否成功
        if($obj_user){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=user&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=user&m=index';</script>";
        }
    }
    
    //用户信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '用户修改';
        $data['navshow'] = 'user';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>用户管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=user">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=user">用户管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>用户修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkusers();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改信息
        $sql_user = "select * from oa_user where id=$id";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> row_array();
        $data['user'] = $user;
        $arr = array(1,2);
        $data['arr'] = $arr;
        $this -> load -> view('edituser',$data);
    }

    //执行用户信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
//         $username = trim($_POST['username']) ? trim($_POST['username']) : '';
//         $lejumail = trim($_POST['lejumail']) ? trim($_POST['lejumail']) : '';
//         $sno = trim($_POST['sno']) ? trim($_POST['sno']) : '';
//         $fullname = trim($_POST['fullname']) ? trim($_POST['fullname']) : '';
//         $city = trim($_POST['city']) ? trim($_POST['city']) : '';
//         $dept = is_numeric($_POST['dept']) ? intval($_POST['dept']) : 0;
//         $depart_name = trim($_POST['depart_name']) ? trim($_POST['depart_name']) : '';
//         $lft = trim($_POST['lft']) ? trim($_POST['lft']) : '';
//         $rgt = trim($_POST['rgt']) ? trim($_POST['rgt']) : '';
//         $wtype = is_numeric($_POST['wtype']) ? intval($_POST['wtype']) : 0;
        $tel = trim($_POST['tel']) ? trim($_POST['tel']) : '';
        $mobile = trim($_POST['mobile']) ? trim($_POST['mobile']) : '';
//         $ctype = is_numeric($_POST['ctype']) ? intval($_POST['ctype']) : 0;
//         $position = trim($_POST['position']) ? trim($_POST['position']) : '';
//         $status = is_numeric($_POST['status']) ? intval($_POST['status']) : 0;
//         $birthday = trim($_POST['birthday']) ? trim($_POST['birthday']) : '';
// 		$entrytime = trim($_POST['entrytime']) ? trim($_POST['entrytime']) : '';
//         $work_position = trim($_POST['work_position']) ? trim($_POST['work_position']) : '';
//         $city_true = trim($_POST['city_true']) ? trim($_POST['city_true']) : '';
//         $mailname = trim($_POST['mailname']) ? trim($_POST['mailname']) : '';
//         $role_id = is_numeric($_POST['role_id']) ? intval($_POST['role_id']) : 0;
//         $weibo = trim($_POST['weibo']) ? trim($_POST['weibo']) : '';
//         $quanxian = array('总裁办','人力资源部','行政部');
//         if(in_array($depart_name,$quanxian)){
//         	$is_notify = @is_numeric($_POST['is_notify']) ? intval($_POST['is_notify']) : 0;
//         }else{
//         	$is_notify = 0;
//         }
//         $is_exists = is_numeric($_POST['is_exists']) ? intval($_POST['is_exists']) : 0;
		$is_ok = is_numeric($_POST['is_ok']) ? intval($_POST['is_ok']) : 0;
//         $wmh = trim($_POST['wmh']) ? trim($_POST['wmh']) : '';
        $oldpic = trim($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
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
        if($this->upload->do_upload('pic_path')){
        	$newpics = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
			$newpic = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $newpics));
        }
        if(empty($newpic)){
        	$pic_path = $oldpic;
        }else{
        	$pic_path = $newpic;
        }
//         $sql_user = "update oa_user set username='$username', lejumail='$lejumail', sno='$sno', fullname='$fullname', city='$city', dept='$dept', depart_name='$depart_name', lft='$lft', rgt='$rgt', wtype='$wtype', tel='$tel', mobile='$mobile', ctype='$ctype', position='$position', status='$status', birthday='$birthday', work_position='$work_position', city_true='$city_true', mailname='$mailname', role_id='$role_id', weibo='$weibo', is_notify='$is_notify', is_exists='$is_exists', is_ok='$is_ok', wmh='$wmh', pic_path='$pic_path' where id='$id'";
        $sql_user = "update oa_user set tel='$tel', mobile='$mobile', is_ok='$is_ok', pic_path='$pic_path' where id='$id'";
        $ob_user = $this -> db -> query($sql_user);
        //判断是否修改成功
        if($ob_user){
        	if(!empty($newpic)){
        		$img = str_replace("data/", "", $oldpic);
        		@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
        	}
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=user&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=user&m=index';</script>";
        }
    }

    //用户信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_pic = "select lejumail, pic_path from oa_user where id='{$id}'";
        $ob_pic = $this -> db -> query($sql_pic);
        $pic = $ob_pic -> row_array();
        $email = $pic['lejumail'];
        $sql_user ="delete from oa_user where id='{$id}'";
        $ob_user = $this -> db ->query($sql_user);
		$sql_linkman = "delete from oa_linkman where userid='{$id}'";
		@$ob_linkman  = $this -> db ->query($sql_linkman);
		$sql_payment = "delete from oa_payment where email='{$email}'";
		@$ob_payment  = $this -> db ->query($sql_payment);
        //判断是否删除成功
        if($ob_user){
        	$img = str_replace("data/", "", $pic['pic_path']);
        	@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=user&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=user&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_pic = "select lejumail, pic_path from oa_user where id in ($idlist)";
    	$ob_pic = $this -> db -> query($sql_pic);
    	$imgs = $ob_pic -> result_array();
    	$email = '';
    	foreach ($imgs as $k=>$v){
    		$email .= $v['lejumail'].',';
    	}
    	$email = rtrim($email,',');
    	$sql_del = "delete from oa_user where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	$sql_linkman = "delete from oa_linkman where userid in ($idlist)";
    	@$ob_linkman  = $this -> db ->query($sql_linkman);
    	$sql_payment = "delete from oa_payment where email in ($email)";
    	@$ob_payment  = $this -> db ->query($sql_payment);
    	//判断是否删除成功
    	if($ob_del){
    		foreach($imgs as $pic){
    			$img = str_replace("data/", "", $pic['pic_path']);
    			@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
    		}
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
    
    //用户添加页表单验证
    public function checkuser(){
    	//验证添加的用户名是否已存在
    	$username = trim($_GET['username']) ? trim($_GET['username']) : "";
    	$sql_user = "select * from oa_user where username='$username'";
    	$user_ob = $this -> db -> query($sql_user);
    	$user = $user_ob -> row_array();
    	//判断用户名是否合法
    	if(empty($user)){
    		echo "true";exit;
    	}else{
    		echo "false";exit;
    	}
    }
    
    //用户修改页表单验证
    public function checkeditname(){
    	//验证表单中用户名是否被更改
    	$newname = trim($_POST['newname']) ? trim($_POST['newname']) : "";
    	$oldname = trim($_POST['oldname']) ? trim($_POST['oldname']) : "";
    	//用户名被更改时
    	if($newname == $oldname){
    		echo "true";exit;
    	}else{ //用户名改变时
    		$sql_user = "select * from oa_user where username='$newname';";
    		$user_ob = $this -> db -> query($sql_user);
    		$user = $user_ob -> row_array();
    		//判断用户名是否合法
    		if(empty($user)){
    			echo "true";exit;
    		}else{
    			echo "false";exit;
    		}
    	}
    }
    
    //判断是否显示权限控制
    function checkdept(){
    	$dept = $_POST['dept'] ? $_POST['dept'] : "";
    	$arr = array("总裁办","人力资源部","行政部");
    	if(in_array($dept,$arr)){
    		echo "1";exit;
    	}else{
    		echo "2";exit;
    	}
    }
}