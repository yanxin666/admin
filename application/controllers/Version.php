<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class version extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '版本管理';
    	$data['navshow'] = 'version';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>版本管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=version">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=version">版本管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>版本列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkversion();
        $this -> load -> view('showversion', $data);
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
        $sql_version_total = "select count(versionid) as memTotal from oa_version";
        $memTotal_ob = $this -> db -> query($sql_version_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_slide = "select versionid, plat_form, version, downloadurl, status, createtime from oa_version";
        //查询条件
        if($search){
            $sql_slide .= " where versionid like '%{$search}%' or plat_form like '%{$search}%' or status like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_slide .= " order by versionid {$sortdir} ";
                break;
            
            case '2':
                $sql_slide .= " order by plat_form {$sortdir} ";
                break;
                
            case '3':
                $sql_slide .= " order by version {$sortdir} ";
                break;
                
            case '4':
                $sql_slide .= " order by downloadurl {$sortdir} ";
                break;
                
            case '5':
                $sql_slide .= " order by status {$sortdir} ";
                break;
                
            case '6':
                $sql_slide .= " order by createtime {$sortdir} ";
                break;
            
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_slide .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_slide);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $num_memData = count($memberData);
        $version_status = $this -> config -> item('oa_config')['version_status'];
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['versionid'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i]['5'] = $version_status[$reAjaxData['aaData'][$i]['5']];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href ="/index.php?c=version&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//版本信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '版本添加';
        $data['navshow'] = 'version';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>版本管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=version">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=version">版本管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>版本添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkversion();
		$plat_form = $this -> config -> item('oa_config')['plat_form'];
		$data['plat_form'] = $plat_form;
        $this -> load -> view('addversion',$data);
    }

    //执行版本信息添加
    public function insert(){
        //获取表单提交信息
    	$plat_form = trim($_POST['plat_form']) ? trim($_POST['plat_form']) : '';
        $version = trim($_POST['version']) ? trim($_POST['version']) : '';
        $downloadurl = trim($_POST['downloadurl']) ? trim($_POST['downloadurl']) : '';
        $status = @trim($_POST['status']) ? trim($_POST['status']) : '';
        $createtime = date('Y-m-d H:i:s',time());
        if(empty($status)){
        	$sql_version = "insert into oa_version(plat_form, version, downloadurl, createtime) values('{$plat_form}', '{$version}', '{$downloadurl}', '{$createtime}')";
        	$ob_version = $this -> db -> query($sql_version);
        	if($ob_version){
        		echo "<script>alert('添加成功!');parent.location.href='index.php?c=version&m=index';</script>";
        	}else{
        		echo "<script>alert('添加失败!');parent.location.href='index.php?c=version&m=index';</script>";
        	}
        }else{
        	$sql_version = "insert into oa_version(plat_form, version, downloadurl, status, createtime) values('{$plat_form}', '{$version}', '{$downloadurl}', '{$status}', '{$createtime}')";
        	$ob_version = $this -> db -> query($sql_version);
        	$insertid = $this -> db -> insert_id();
        	$sql_update = "update oa_version set status='0' where plat_form='{$plat_form}'";
        	$ob_update = $this -> db -> query($sql_update);
        	$sql_edit = "update oa_version set status='1' where versionid='{$insertid}'";
        	$ob_edit = $this -> db -> query($sql_edit);
        	if($ob_version && $ob_update && $ob_edit){
        		//使用推送
        		$pushObj = new Jpush();
        		$sql_lejumail = "select lejumail from oa_user where plat_form='{$plat_form}'";
        		$ob_lejumail = $this -> db -> query($sql_lejumail);
        		$lejumail = $ob_lejumail -> result_array();
        		$senduser ='';
        		foreach($lejumail as $v){
        			$senduser .= $v['lejumail'].',';
        		}
        		$senduser = rtrim($senduser,',');
        		$sendlist = explode(",",$senduser);
        		$sendlist = array_map('trim',$sendlist);
        		$receive = array('alias'=>$sendlist);
        		$content = '乐居通有新版本更新';
        		$m_type = 'http';
        		$m_txt = 'http://www.iqujing.com/';
        		$m_time = '600';        //离线保留时间
        		//调用推送,并处理
        		$result = $pushObj->push($receive,$content,$m_type,$m_txt,$m_time);
        		if($result){
        			echo "<script>alert('添加成功!');parent.location.href='index.php?c=version&m=index';</script>";
        		}else{
        			echo "<script>alert('添加成功,推送失败！');parent.location.href='index.php?c=version&m=index';</script>";
        		}
        	}else{
        		echo "<script>alert('添加失败!');parent.location.href='index.php?c=version&m=index';</script>";
        	}
        }
    }
    
//     //版本信息修改页
//     public function edit(){
//         //加载修改表单的数据
//         //状态栏控制
//         $data['title'] = '版本修改';
//         $data['navshow'] = 'version';
//         //导航栏控制
//         $breadcrumb = '<h3 class="page-title">管理员管理后台<small>版本管理</small></h3>';
//         $breadcrumb .= '<ul class="breadcrumb">';
        
//         $breadcrumb .= '<li>';
//         $breadcrumb .= '<i class="icon-home"></i>';
//         $breadcrumb .= '<a href="/index.php?c=version">首页</a>';
//         $breadcrumb .= '<i class="icon-angle-right"></i>';
//         $breadcrumb .= '</li>';
        
        
//         $breadcrumb .= '<li>';
//         $breadcrumb .= '<a href="/index.php?c=version">版本管理</a>';
//         $breadcrumb .= '<i class="icon-angle-right"></i>';
//         $breadcrumb .= '</li>';
        
//         $breadcrumb .= '<li>版本修改</li>';
//         $breadcrumb .= '</ul>';
//         $data['breadcrumb'] = $breadcrumb;
//         //权限控制
//         $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
// 		$this -> checkuser -> checkversion();
//         $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
//         $sql_version = "select id, name from oa_version where id={$id};";
//         $version_ob = $this -> db -> query($sql_version);
//         $version = $version_ob -> row_array();
//         $data['version'] = $version;
//         $this -> load -> view('editversion',$data);
//     }

//     //执行版本信息修改
//     public function update(){
//         //获取表单提交信息
//         $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
//         $name = trim($_POST['name']) ? trim($_POST['name']) : "";
//         $createtime = date('Y-m-d H:i:s',time());
//         $sql_version = "update oa_version set name='$name',createtime='$createtime' where id='$id'";
//         $ob_version = $this -> db -> query($sql_version);
//         //判断是否修改成功
//         if($ob_version){
//             echo "<script>alert('修改成功!');parent.location.href='index.php?c=version&m=index';</script>";
//         }else{
//             echo "<script>alert('修改失败!');parent.location.href='index.php?c=version&m=index';</script>";
//         }
//     }


    //版本信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : 0;
        $sql_version ="delete from oa_version where versionid='{$id}'";
        $ob_version = $this -> db ->query($sql_version);
        //判断是否删除成功
        if($ob_version){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=version&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=version&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_version where versionid in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //版本添加页表单验证
    public function check(){
        //验证添加的版本是否已存在
        $version = trim($_POST['version']) ? trim($_POST['version']) : "";
        $plat_form = trim($_POST['plat_form']) ? trim($_POST['plat_form']) : 0;
        $sql_version = "select version from oa_version where version='{$version}' and plat_form='{$plat_form}'";
        $version_ob = $this -> db -> query($sql_version);
        $versions = $version_ob -> row_array();
        //判断版本是否合法
        if(empty($versions['version'])){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //版本修改页表单验证
    public function checkedit(){
        //验证表单中版本是否被更改
        $newname = trim($_POST['newname']) ? trim($_POST['newname']) : "";
        $oldname = trim($_POST['oldname']) ? trim($_POST['oldname']) : "";
        //版本未被更改时
        if($newname == $oldname){
            echo "true";exit;
        }else{ //版本改变时
            $sql_name = "select * from oa_version where name='$newname';";
            $name_ob = $this -> db -> query($sql_name);
            $name = $name_ob -> row_array();
            //判断版本是否合法
            if(empty($name)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}