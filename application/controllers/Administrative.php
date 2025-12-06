<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class administrative extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '行政联系管理';
    	$data['navshow'] = 'administrative';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>行政联系管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=administrative">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=administrative">行政联系管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>行政联系列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkadministrative();
        $this -> load -> view('show_administrative', $data);
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
        $sql_administrative_total = "select count(id) as memTotal from oa_administrative";
        $memTotal_ob = $this -> db -> query($sql_administrative_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_slide = "select id, number, area, city, name, zjlemail, linkman, tel, address from oa_administrative";
        //查询条件
        if($search){
            $sql_slide .= " where id like '%{$search}%' or name like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_slide .= " order by id {$sortdir} ";
                break;
            
            case '2':
                $sql_slide .= " order by number {$sortdir} ";
                break;
                
            case '3':
                $sql_slide .= " order by area {$sortdir} ";
                break;
                
            case '4':
                $sql_slide .= " order by city {$sortdir} ";
                break;
                
            case '5':
                $sql_slide .= " order by name {$sortdir} ";
                break;
            
            case '6':
                $sql_slide .= " order by zjlemail {$sortdir} ";
                break;
                
            case '7':
                $sql_slide .= " order by linkman {$sortdir} ";
                break;
                
            case '8':
                $sql_slide .= " order by tel {$sortdir} ";
                break;
                
            case '9':
                $sql_slide .= " order by address {$sortdir} ";
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
        $area = $this -> config -> item('oa_config')['area'];
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][3] = $area[$reAjaxData['aaData'][$i][3]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=administrative&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=administrative&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
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

	//行政联系信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '行政联系添加';
        $data['navshow'] = 'administrative';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>行政联系管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=administrative">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=administrative">行政联系管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>行政联系添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkadministrative();
        $this -> load -> view('add_administrative',$data);
    }

    //执行行政联系信息添加
    public function insert(){
        //获取表单提交信息
    	$number = is_numeric($_POST['number']) ? intval($_POST['number']) : 0;
    	$area = is_numeric($_POST['area']) ? intval($_POST['area']) : 0;
        $city = trim($_POST['city']) ? trim($_POST['city']) : '';
        $position = trim($_POST['position']) ? trim($_POST['position']) : '';
        $name = trim($_POST['name']) ? trim($_POST['name']) : '';
        $zjlemail = trim($_POST['zjlemail']) ? trim($_POST['zjlemail']) : '';
        $linkman = trim($_POST['linkman']) ? trim($_POST['linkman']) : '';
        $tel = trim($_POST['tel']) ? trim($_POST['tel']) : '';
        $ipphone = trim($_POST['ipphone']) ? trim($_POST['ipphone']) : '';
        $mobile = trim($_POST['mobile']) ? trim($_POST['mobile']) : 0;
        $xzemail = trim($_POST['xzemail']) ? trim($_POST['xzemail']) : '';
        $address = trim($_POST['address']) ? trim($_POST['address']) : '';
        $code = is_numeric($_POST['code']) ? intval($_POST['code']) : 0;
        $note = trim($_POST['note']) ? trim($_POST['note']) : '';
        $sql_administrative = "insert into oa_administrative(number, area, city, position, name, zjlemail, linkman, tel, ipphone, mobile, xzemail, address, code, note) values('$number', '$area', '$city', '$position', '$name', '$zjlemail', '$linkman', '$tel', '$ipphone', '$mobile', '$xzemail', '$address', '$code', '$note')";
        $obj_administrative = $this -> db -> query($sql_administrative);
        //判断添加是否成功
        if($obj_administrative){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }
    }
    
    //行政联系信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '行政联系修改';
        $data['navshow'] = 'administrative';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>行政联系管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=administrative">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=administrative">行政联系管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>行政联系修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkadministrative();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_administrative = "select * from oa_administrative where id={$id};";
        $administrative_ob = $this -> db -> query($sql_administrative);
        $administrative = $administrative_ob -> row_array();
        $data['administrative'] = $administrative;
        $this -> load -> view('edit_administrative',$data);
    }

    //执行行政联系信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
    	$number = is_numeric($_POST['number']) ? intval($_POST['number']) : 0;
    	$area = is_numeric($_POST['area']) ? intval($_POST['area']) : 0;
        $city = trim($_POST['city']) ? trim($_POST['city']) : '';
        $position = trim($_POST['position']) ? trim($_POST['position']) : '';
        $name = trim($_POST['name']) ? trim($_POST['name']) : '';
        $zjlemail = trim($_POST['zjlemail']) ? trim($_POST['zjlemail']) : '';
        $linkman = trim($_POST['linkman']) ? trim($_POST['linkman']) : '';
        $tel = trim($_POST['tel']) ? trim($_POST['tel']) : '';
        $ipphone = trim($_POST['ipphone']) ? trim($_POST['ipphone']) : '';
        $mobile = trim($_POST['mobile']) ? trim($_POST['mobile']) : 0;
        $xzemail = trim($_POST['xzemail']) ? trim($_POST['xzemail']) : '';
        $address = trim($_POST['address']) ? trim($_POST['address']) : '';
        $code = is_numeric($_POST['code']) ? intval($_POST['code']) : 0;
        $note = trim($_POST['note']) ? trim($_POST['note']) : '';
        $sql_administrative = "update oa_administrative set number='$number', area='$area', city='$city', position='$position', name='$name', zjlemail='$zjlemail', linkman='$linkman', tel='$tel', ipphone='$ipphone', mobile='$mobile', xzemail='$xzemail', address='$address', code='$code', note='$note' where id='$id'";
        $ob_administrative = $this -> db -> query($sql_administrative);
        //判断是否修改成功
        if($ob_administrative){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }
    }


    //行政联系信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_administrative ="delete from oa_administrative where id='$id'";
        $ob_administrative = $this -> db ->query($sql_administrative);
        //判断是否删除成功
        if($ob_administrative){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=administrative&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_administrative where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }
}