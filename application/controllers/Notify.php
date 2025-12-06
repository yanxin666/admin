<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class notify extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '后台通知管理';
    	$data['navshow'] = 'notify';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台通知管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=notify">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=notify">后台通知管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台通知列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checknotify();
        $this -> load -> view('shownotify', $data);
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
        $sql_notify_total = "select count(id) as memTotal from oa_notify where whose='1'";
        $memTotal_ob = $this -> db -> query($sql_notify_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_notify = "select n.id, u.fullname, n.send_dept, n.title, n.time, n.state from oa_notify as n left join oa_user as u on n.sender_id=u.id";
        //查询条件
        $sql_notify .= " where n.whose='1' "; 
        if($search){
            $sql_notify .= " and (n.whose='1' and n.id like '%{$search}%' or u.fullname like '%{$search}%' or n.send_dept like '%{$search}%' or n.title like '%{$search}%') ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_notify .= " order by n.id {$sortdir} ";
                break;
                
            case '2':
                $sql_notify .= " order by u.fullname {$sortdir} ";
                break;
                
            case '3':
                $sql_notify .= " order by n.send_dept {$sortdir} ";
                break;
            
            case '4':
                $sql_notify .= " order by n.title {$sortdir} ";
                break;
                
            case '5':
                $sql_notify .= " order by n.time {$sortdir} ";
                break;
                
            case '6':
                $sql_notify .= " order by n.state {$sortdir} ";
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
            if($reAjaxData['aaData'][$i][6] == '未发送'){
            	$reAjaxData['aaData'][$i][] = '<a href="/index.php?c=notify&m=details&id='.$id.'"><span class="label label-success">查看详情</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=notify&m=send&id='.$id.'" onclick="javascript:return confirm(\'确定要发送吗?\')"."><span class="label label-success">发送通知</span></a>';
            }else{
            	$reAjaxData['aaData'][$i][] = '<a href="/index.php?c=notify&m=details&id='.$id.'"><span class="label label-success">查看详情</span></a>';
            }
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

	//通知信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '后台通知添加';
        $data['navshow'] = 'notify';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台通知管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=notify">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=notify">后台通知管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台通知添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checknotify();
        //查询发通知人
//         $sql_users = "select id, fullname, depart_name from oa_user where is_ok=1";
//         $ob_users = $this -> db -> query($sql_users);
//         $users = $ob_users -> result_array();
//         $data['users'] = $users;
        //查询联系组
        $sql_team = "select team_name, listid, team_man from oa_team";
        $ob_team = $this -> db -> query($sql_team);
        $team = $ob_team -> result_array();
        $data['team'] = $team;
        //查询个人
        $sql_user = "select id, lejumail, fullname from oa_user where userid != '1'";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('addnotify',$data);
    }

    //执行通知信息添加
    public function insert(){
        //获取表单提交信息
//         $sender = trim($_POST['sender_id']) ? trim($_POST['sender_id']) : '';
        $sender_id = $_SESSION['loginInfo']['loginid'];
        $send_dept = $_SESSION['loginInfo']['depart_name'];
        $notify_type = is_numeric($_POST['notify_type']) ? intval($_POST['notify_type']) : 0;
        $team = @$_POST['team'] ? $_POST['team'] : '';
        $user = @$_POST['user'] ? $_POST['user'] : '';
        if($notify_type == 1){
        	$notify_man = '';
        	$listid = '';
        	if(!empty($team) && empty($user)){
        		foreach($team as $v){
        			$notify_man .= substr($v,0,strpos($v,'@')).',';
        			$listid .= substr($v,strpos($v,'@')+1,strlen($v)).',';
        		}
        		$notify_man = trim($notify_man,',');
        		$listid = trim($listid,',');
        	}else if(empty($team) && !empty($user)){
        		foreach($user as $va){
        			$notify_man .= substr($va,0,strpos($va,'@')).',';
        			$listid .= substr($va,strpos($va,'@')+1,strlen($va)).',';
        		}
        		$notify_man = trim($notify_man,',');
        		$listid = trim($listid,',');
        	}else if(!empty($team) && !empty($user)){
        		$notify_mans = '';
        		$listids = '';
        		foreach($team as $val){
        			$notify_mans .= substr($val,0,strpos($val,'@')).',';
        			$listids .= substr($val,strpos($val,'@')+1,strlen($val)).',';
        		}
        		$notify_mans = trim($notify_mans,',');
        		$listids = trim($listids,',');
        		$users = '';
        		$usersid = '';
        		foreach($user as $vals){
        			$users .= substr($vals,0,strpos($vals,'@')).',';
        			$usersid .= substr($vals,strpos($vals,'@')+1,strlen($vals)).',';
        		}
        		$users = trim($users,',');
        		$usersid = trim($usersid,',');
        		$notify_man = $notify_mans.",".$users;
        		$listid = $listids.",".$usersid;
        	}else{
        		echo "<script>alert('请填写通知联系组或个人');parent.location.href='index.php?c=notify&m=add';</script>";exit;
        	}
        }
        $title = trim($_POST['title']) ? trim($_POST['title']) : '';
        $contents = trim($_POST['content']) ? trim($_POST['content']) : '';
		$time = date('Y-m-d H:i:s',time());
        //图片上传定义上传路径
		if(!empty($_FILES['img']['tmp_name'])){
			$date = date("Ymd",time());
			$string = substr($date,0,6);
			if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
				mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
			}
			$config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
			//定义文件格式
			$config['allowed_types'] = array('jpg','gif','png');
			//定义上传文件大小的最大值
			$config['max_size'] = '5120';
			//定义新的名字
			$config['file_name'] = time().'.jpg';
			//上传
			$this -> load ->library('upload', $config);
			if( ! $this->upload->do_upload('img')){
				echo "<script>alert('图片大小超出5M或上传失败');parent.location.href='index.php?c=notify&m=add';</script>";exit;
			}else{
				$imgs = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
				$img = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $imgs));
			}
		}else{
			$img = '';
		}
        //组装需要的参数
        if($notify_type == 1){
        	$notify_man = explode(",",$notify_man);
        	foreach( $notify_man as $k=>$v){
        		if( !$v )
        			unset( $notify_man[$k] );
        	}
        	$notify_man = array_unique($notify_man);
        	$notify_man = array_map('trim',$notify_man);
        	$notify_man = implode(',',$notify_man);
        	$listid = explode(",",$listid);
        	foreach( $listid as $k=>$v){
        		if( !$v )
        			unset( $listid[$k] );
        	}
        	$listid = array_unique($listid);
        	$listid = array_map('trim',$listid);
        	$listidstr = implode(',', $listid);
        	$sql_notify = "insert into oa_notify(sender_id, send_dept, notify_type, notify_man, listid, title, content, time, img, whose) values('$sender_id', '$send_dept', '$notify_type', '$notify_man', '$listidstr', '$title', '$contents', '$time', '$img', '1')";
        	$obj_notify = $this -> db -> query($sql_notify);
        	$insertid = $this -> db -> insert_id();
        	$sql_notify_senduser = "insert into oa_notify_senduser(notify_id, user_id, createtime) values ";
        	foreach($listid as $v){
        		$sql_notify_senduser .= "(" . "'{$insertid}'" . "," . "'{$v}'" . "," . "'{$time}'" . "),";
        	}
        	$sql_notify_senduser = rtrim($sql_notify_senduser,',');
        	$ob_notify_senduser = $this -> db -> query($sql_notify_senduser);
        	if($obj_notify && $ob_notify_senduser){
        		echo "<script>alert('通知添加成功!');parent.location.href='index.php?c=notify&m=index';</script>";
        	}else{
        		echo "<script>alert('通知添加失败!');parent.location.href='index.php?c=notify&m=index';</script>";
        	}
        }else{
        	$sql_user = "select id, lejumail from oa_user where userid != '1'";
        	$ob_user = $this -> db -> query($sql_user);
        	$userinfo = $ob_user -> result_array();
        	$notify_man = '';
        	$listid = '';
        	foreach($userinfo as $mail){
        		$notify_man .= $mail['lejumail'].",";
        		$listid .= $mail['id'].",";
        	}
        	$notify_man = substr($notify_man,0,strlen($notify_man)-1);
        	$listid = substr($listid,0,strlen($listid)-1);
        	$notify_man = trim($notify_man,',');
        	$listid = trim($listid,',');
        	$notify_man = explode(",",$notify_man);
        	foreach( $notify_man as $k=>$v){
        		if( !$v )
        			unset( $notify_man[$k] );
        	}
        	$notify_man = array_unique($notify_man);
        	$notify_man = implode(',',$notify_man);
        	$notify_man = '';  //置空
        	$listid = explode(",",$listid);
        	foreach( $listid as $k=>$v){
        		if( !$v )
        			unset( $listid[$k] );
        	}
        	$listid = array_unique($listid);
        	$listidstr = implode(',', $listid);
        	$sql_notify = "insert into oa_notify(sender_id, send_dept, notify_type, notify_man, listid, title, content, time, img, whose) values('$sender_id', '$send_dept', '$notify_type', '$notify_man', '$listidstr', '$title', '$contents', '$time', '$img', '1')";
        	$obj_notify = $this -> db -> query($sql_notify);
        	$insertid = $this -> db -> insert_id();
        	$sql_notify_senduser = "insert into oa_notify_senduser(notify_id, user_id, createtime) values";
        	foreach($listid as $v){
        		$sql_notify_senduser .= "(" . "'{$insertid}'" . "," . "'{$v}'" . "," . "'{$time}'" . "),";
        	}
        	$sql_notify_senduser = rtrim($sql_notify_senduser,',');
        	$ob_notify_senduser = $this -> db -> query($sql_notify_senduser);
        	if($obj_notify && $ob_notify_senduser){
        		echo "<script>alert('通知添加成功!');parent.location.href='index.php?c=notify&m=index';</script>";
        	}else{
        		echo "<script>alert('通知添加失败!');parent.location.href='index.php?c=notify&m=index';</script>";
        	}
        }
    }
    
    //通知信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '后台通知修改';
        $data['navshow'] = 'notify';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台通知管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=notify">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=notify">后台通知管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>后台通知修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checknotify();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        //查询修改信息
        $sql_notify = "select id, sender_id, notify_type, notify_man, listid, title, content, time, img from oa_notify where id=$id";
        $ob_notify = $this -> db -> query($sql_notify);
        $notify = $ob_notify -> row_array();
        $data['notify'] = $notify;
        //查询发件人
        //查询发通知人
        $sql_users = "select id, fullname from oa_user where is_ok=1";
        $ob_users = $this -> db -> query($sql_users);
        $users = $ob_users -> result_array();
        $data['users'] = $users;
        //查询联系组
        $sql_team = "select team_name, listid, team_man from oa_team";
        $ob_team = $this -> db -> query($sql_team);
        $team = $ob_team -> result_array();
        $data['team'] = $team;
        //查询个人
        $sql_user = "select id, lejumail, fullname from oa_user where userid != '1'";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        $this -> load -> view('editnotify',$data);
    }

    //执行通知信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
        $sender_id = is_numeric($_POST['sender_id']) ? intval($_POST['sender_id']) : 0;
        $notify_type = is_numeric($_POST['notify_type']) ? intval($_POST['notify_type']) : 0;
        $team = @$_POST['team'] ? $_POST['team'] : '';
        $user = @$_POST['user'] ? $_POST['user'] : '';
        if($notify_type == 1){
        	$notify_man = '';
        	$listid = '';
        	if(!empty($team) && empty($user)){
        		foreach($team as $v){
        			$notify_man .= substr($v,0,strpos($v,'@')).',';
        			$listid .= substr($v,strpos($v,'@')+1,strlen($v)).',';
        		}
        		$notify_man = trim($notify_man,',');
        		$listid = trim($listid,',');
        	}else if(empty($team) && !empty($user)){
        		foreach($user as $va){
        			$notify_man .= substr($va,0,strpos($va,'@')).',';
        			$listid .= substr($va,strpos($va,'@')+1,strlen($va)).',';
        		}
        		$notify_man = trim($notify_man,',');
        		$listid = trim($listid,',');
        	}else if(!empty($team) && !empty($user)){
        		$notify_mans = '';
        		$listids = '';
        		foreach($team as $val){
        			$notify_mans .= substr($val,0,strpos($val,'@')).',';
        			$listids .= substr($val,strpos($val,'@')+1,strlen($val)).',';
        		}
        		$notify_mans = trim($notify_mans,',');
        		$listids = trim($listids,',');
        		$users = '';
        		$usersid = '';
        		foreach($user as $vals){
        			$users .= substr($vals,0,strpos($vals,'@')).',';
        			$usersid .= substr($vals,strpos($vals,'@')+1,strlen($vals)).',';
        		}
        		$users = trim($users,',');
        		$usersid = trim($usersid,',');
        		$notify_man = $notify_mans.",".$users;
        		$listid = $listids.",".$usersid;
        	}else{
        		echo "<script>alert('请填写通知联系组或个人');parent.location.href='index.php?c=notify&m=edit&id=$id';</script>";exit;
        	}
        }
        $title = trim($_POST['title']) ? trim($_POST['title']) : "";
        $contents = trim($_POST['content']) ? trim($_POST['content']) : "";
		$time = date('Y-m-d H:i:s',time());
        $oldimg = trim($_POST['oldimg']) ? trim($_POST['oldimg']) : "";
    	//图片上传定义上传路径
		$date = date("Ymd",time());
        $string = substr($date,0,6);
        if(!is_dir($_SERVER['SINASRV_DATA_DIR'].$string)){
        	mkdir($_SERVER['SINASRV_DATA_DIR'].$string); //原图路径
        }
        $config['upload_path'] = $_SERVER['SINASRV_DATA_DIR'].$string;
        //定义文件格式
        $config['allowed_types'] = array('jpg','gif','png');
        //定义上传文件大小的最大值
        $config['max_size'] = '5120';
        //定义新的名字
        $config['file_name'] = time().'.jpg';
        //上传
        $this -> load ->library('upload', $config);
        if($this->upload->do_upload('img')){
        	$newimgs = $_SERVER['SINASRV_DATA_DIR'].$string.'/'.$config['file_name'];
			$newimg = str_replace("lejutong.leju.com/", "", str_replace("/data1/www/", "", $newimgs));
        }
        if(empty($newimg)){
        	$img = $oldimg;
        }else{
        	$img = $newimg;
        }
        	//使用示例
        	$pushObj = new Jpush();
    		//组装需要的参数
        	if($notify_type == 1){
        		$sendlist = explode(",",$notify_man);
        		foreach( $sendlist as $k=>$v){
        			if( !$v )
        				unset( $sendlist[$k] );
        		}
        		$sendlists = array_unique($sendlist);
        		$receive = array('alias'=>$sendlists);
        	}else{
        		$receive = 'all';     //全部
        		$notify_man = 'all';
        		$listid = 'all';
        	}
        	$content = $title;
        	$m_type = 'http';
        	$m_txt = 'http://www.iqujing.com/';
        	$m_time = '600';        //离线保留时间
        	//调用推送,并处理
        	$result = $pushObj->push($receive,$content,$m_type,$m_txt,$m_time);
        	if($result){
        		$res_arr = json_decode($result, true);
        		if(isset($res_arr['error'])){                       //如果返回了error则证明失败
//         			echo $res_arr['error']['message'];          //错误信息
//         			echo $res_arr['error']['code'];             //错误码
//         			return false;
        			$res = $res_arr['error']['message'];
        			echo "<script>alert('".$res."');parent.location.href='index.php?c=notify&m=edit&id=$id';</script>";
        		}else{
        			//处理成功的推送
        			$sql_notify = "update oa_notify set sender_id='$sender_id', notify_type='$notify_type', notify_man='$notify_man', listid='$listid', title='$title', content='$contents', time='$time', img='$img', state='2', whose='1' where id='$id'";
					$obj_notify = $this -> db -> query($sql_notify);
        			if($obj_notify){
        				if(!empty($newimg)){
        					$img = str_replace("data/", "", $oldimg);
        					@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
        				}
        				echo "<script>alert('通知成功!');parent.location.href='index.php?c=notify&m=index';</script>";
        			}else{
        				echo "<script>alert('通知成功,写入数据库失败!');parent.location.href='index.php?c=notify&m=index';</script>";
        			}
        			
        		}
        	}else{      //接口调用失败或无响应
        		echo "<script>alert('通知失败!');parent.location.href='index.php?c=notify&m=edit&id=$id';</script>";
        		return false;
        	}
    }

    //通知信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_del = "select img from oa_notify where id=$id";
        $ob_del = $this -> db -> query($sql_del);
        $del = $ob_del -> row_array();
        $sql_notify ="delete from oa_notify where id='$id'";
        $ob_notify = $this -> db ->query($sql_notify);
        //判断是否删除成功
        if($ob_notify){
        	$img = str_replace("data/", "", $del['img']);
        	@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=notify&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=notify&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_img = "select img from oa_notify where id in ($idlist)";
    	$ob_img = $this -> db -> query($sql_img);
    	$imgs = $ob_img -> result_array();
    	$sql_del = "delete from oa_notify where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	$sql_delsenduser = "delete from oa_notify_senduser where notify_id in ($idlist)";
    	$ob_delsenduser = $this -> db -> query($sql_delsenduser);
    	//判断是否删除成功
    	if($ob_del && $ob_delsenduser){
    		foreach($imgs as $pic){
    			$img = str_replace("data/", "", $pic['img']);
    			@unlink($_SERVER['SINASRV_DATA_DIR'].$img);
    		}
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
	
	//通知查看详情
    public function details(){
    	$_SESSION['notify_id'] = is_numeric($_GET['id']) ? intval($_GET['id']) : 0;
    	//状态栏控制
    	$data['title'] = '后台通知管理';
    	$data['navshow'] = 'notify';
    	//导航栏控制
    	$breadcrumb = '<h3 class="page-title">管理员管理后台<small>后台通知管理</small></h3>';
    	$breadcrumb .= '<ul class="breadcrumb">';
    
    	$breadcrumb .= '<li>';
    	$breadcrumb .= '<i class="icon-home"></i>';
    	$breadcrumb .= '<a href="/index.php?c=notify">首页</a>';
    	$breadcrumb .= '<i class="icon-angle-right"></i>';
    	$breadcrumb .= '</li>';
    
    
    	$breadcrumb .= '<li>';
    	$breadcrumb .= '<a href="/index.php?c=notify">后台通知管理</a>';
    	$breadcrumb .= '<i class="icon-angle-right"></i>';
    	$breadcrumb .= '</li>';
    
    	$breadcrumb .= '<li>后台通知详情列表</li>';
    	$breadcrumb .= '</ul>';
    	$data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checknotify();
    	$this -> load -> view('shownotify_details', $data);
    }
    
    //处理表格ajax传输的数据
    public function ajax_data_details(){
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
    	$notify_id = $_SESSION['notify_id'] ? $_SESSION['notify_id'] : 0;
    	$sql_notify_total = "select count(notifysendid) as memTotal from oa_notify_senduser where notify_id='{$notify_id}'";
    	$memTotal_ob = $this -> db -> query($sql_notify_total);
    	$memTotal = $memTotal_ob -> row_array();
    
    	$reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
    	$reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
    
    	//查询数据
    	$sql_notify = "select ns.notifysendid, n.title, u.fullname, ns.notify_status, ns.read_status, ns.sendtime, ns.createtime from oa_notify_senduser as ns left join oa_notify as n on ns.notify_id = n.id left join oa_user as u on ns.user_id = u.id";
    	//查询条件
    	$sql_notify .= " where ns.notify_id='{$notify_id}' ";
    	if($search){
    		$sql_notify .= " and ns.notifysendid like '%{$search}%' or u.fullname like '%{$search}%'  ";
    	}
    	//按对应字段排序
    	switch ($sortcol) {
    		case '1':
    			$sql_notify .= " order by ns.notifysendid {$sortdir} ";
    			break;
    
    		case '2':
    			$sql_notify .= " order by n.title {$sortdir} ";
    			break;
    
    		case '3':
    			$sql_notify .= " order by u.fullname {$sortdir} ";
    			break;
    
    		case '4':
    			$sql_notify .= " order by ns.notify_status {$sortdir} ";
    			break;
    
    		case '5':
    			$sql_notify .= " order by ns.read_status {$sortdir} ";
    			break;
    
    		case '6':
    			$sql_notify .= " order by ns.sendtime {$sortdir} ";
    			break;
    			
    		case '7':
    			$sql_notify .= " order by ns.createtime {$sortdir} ";
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
    	$notify_status = $this->config->item('oa_config')['notify_status'];
    	$read_status = $this->config->item('oa_config')['read_status'];
    	$num_memData = count($memberData);
    	for ($i=0; $i < $num_memData; $i++){
    		$idlist = $memberData[$i]['notifysendid'];
    		$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
    		foreach ($memberData[$i] as $mkey => $member){
    			$reAjaxData['aaData'][$i][] = $member;
    		}
    		$reAjaxData['aaData'][$i][4] = $notify_status[$reAjaxData['aaData'][$i][4]];
    		$reAjaxData['aaData'][$i][5] = $read_status[$reAjaxData['aaData'][$i][5]];
    		if($reAjaxData['aaData'][$i][6] == '0000-00-00 00:00:00'){
    			$reAjaxData['aaData'][$i][6] = '未发送';
    		}else{
    			$reAjaxData['aaData'][$i][6] = $reAjaxData['aaData'][$i][6];
    		}
    
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
    
	//发送通知
    function send(){
    	$notify_id = is_numeric($_GET['id']) ? intval($_GET['id']) : 0;
    	if($notify_id){
    		$sql_notify = "select notify_type, notify_man, listid, title from oa_notify where id='{$notify_id}'";
    		$ob_notify = $this -> db -> query($sql_notify);
    		$notify = $ob_notify -> row_array();
    		if(!empty($notify)){
    			$notify_type = $notify['notify_type'];
    			$notify_man = $notify['notify_man'];
    			$notify_listid = $notify['listid'];
    			$title = $notify['title'];
    			//查询在线用户
    			$sql_loginuser = "select id, lejumail from oa_user where is_login='1'";
    			$ob_loginuser = $this -> db -> query($sql_loginuser);
    			$loginuser = $ob_loginuser -> result_array();
    			$loginuser_id = '';
    			$loginuser_man = '';
    			foreach ($loginuser as $v){
    				$loginuser_id .= $v['id'].',';
    				$loginuser_man .= $v['lejumail'].',';
    			}
    			$loginuser_id = rtrim($loginuser_id,',');
    			$loginuser_id = explode(',',$loginuser_id);
    			$notify_listid = explode(',',$notify_listid);
    			$notify_listid = array_map('trim',$notify_listid);
    			$sendlistid = array_intersect($notify_listid,$loginuser_id);
    			$sendlistid = array_map('trim',$sendlistid);
    			$sendlistid = implode(',',$sendlistid);
    			$loginuser_man = rtrim($loginuser_man,',');
    			$loginuser_man = explode(',',$loginuser_man);
    			$loginuser_man = array_map('trim',$loginuser_man);
    			//组装需要的参数
    			if($notify_type == 1){
    				$notify_man = preg_replace("/\s|　/","",$notify_man);
    				$sendlist_bak = explode(",",$notify_man);
    				$sendlist_bak = array_map('trim',$sendlist_bak);
    				$sendlist = array_intersect ($sendlist_bak,$loginuser_man);
    				sort($sendlist);
    				$sendlist = array_map('trim',$sendlist);
    				$receive = array('alias'=>$sendlist);
    			}else{
//     				$receive = 'all';     //全部
    				$sendlist = array_map('trim',$loginuser_man);
    				$receive = array('alias'=>$sendlist);
    			}
    			if(empty($sendlist)){
    				//处理成功的推送
    				$sendtime = date("Y-m-d H:i:s",time());
    				$sql_state = "update oa_notify set state='1' where id='{$notify_id}'";
    				$ob_state = $this -> db -> query($sql_state);
    				$sql_notify = "update oa_notify_senduser set notify_status='4', sendtime='{$sendtime}' where notify_id='{$notify_id}'";
    				$ob_notify = $this -> db -> query($sql_notify);
    				if($ob_state && $ob_notify){
    					echo "<script>alert('通知成功!');parent.location.href='index.php?c=notify&m=index';</script>";
    				}else{
    					echo "<script>alert('通知成功,数据库写入失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    				}
    			}else{
    				//使用推送
    				$pushObj = new Jpush();
    				$content = $title;
    				$m_type = 'http';
    				$m_txt = 'http://www.iqujing.com/';
    				$m_time = '600';        //离线保留时间
    				$sendtype = '1';
    				//调用推送,并处理
    				$result = $pushObj->push($receive,$content,$m_type,$m_txt,$m_time,$sendtype);
    				if($result){
    					$res_arr = json_decode($result, true);
    					if(isset($res_arr['error'])){                       //如果返回了error则证明失败
//     						echo $res_arr['error']['message'];          //错误信息
//     						echo $res_arr['error']['code'];             //错误码
//     						return false;
    						$sql_notify = "update oa_notify_senduser set notify_status='3' where notify_id='{$notify_id}'";
    						$ob_notify = $this -> db -> query($sql_notify);
    						if($ob_notify){
    							echo "<script>alert('通知失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    						}else{
    							echo "<script>alert('通知失败,数据库写入失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    						}
    						//     					$res = $res_arr['error']['message'];
    						//     					echo "<script>alert('".$res."');parent.location.href='index.php?c=notify&m=add';</script>";
    					}else{
    						//处理成功的推送
    						$sendtime = date("Y-m-d H:i:s",time());
    						$sql_state = "update oa_notify set state='1' where id='{$notify_id}'";
    						$ob_state = $this -> db -> query($sql_state);
    						$sql_notifyfail = "update oa_notify_senduser set notify_status='4', sendtime='{$sendtime}' where notify_id='{$notify_id}'";
    						$ob_notifyfail = $this -> db -> query($sql_notifyfail);
    						$sql_notify = "update oa_notify_senduser set notify_status='1' where notify_id='{$notify_id}' and user_id in ($sendlistid)";
    						$ob_notify = $this -> db -> query($sql_notify);
    						if($ob_state && $ob_notifyfail && $ob_notify){
    							echo "<script>alert('通知成功!');parent.location.href='index.php?c=notify&m=index';</script>";
    						}else{
    							echo "<script>alert('通知成功,数据库写入失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    						}
    					}
    				}else{      //接口调用失败或无响应
    					echo "<script>alert('通知推送失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    				}
    			}
    		}else{
    			echo "<script>alert('获取通知信息失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    		}
    		
    	}else{
    		echo "<script>alert('获取通知id失败!');parent.location.href='index.php?c=notify&m=index';</script>";
    	}        	
    }
}