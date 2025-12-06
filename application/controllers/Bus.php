<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class bus extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '班车线路管理';
    	$data['navshow'] = 'bus';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>班车线路管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bus">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bus">班车线路管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>班车线路列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
    	$this -> checkuser -> checkbus();
        $this -> load -> view('showbus', $data);
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
        $sql_bus_total = "select count(lineid) as memTotal from oa_busline";
        $memTotal_ob = $this -> db -> query($sql_bus_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_busline = "select lineid, linename, line, linetime, driver, dmobile, busnumber, teamer, tmobile, temail from oa_busline";
        //查询条件
        if($search){
            $sql_busline .= " where lineid like '%{$search}%' or linename like '%{$search}%' or line like '%{$search}%' or teamer like '%{$search}%' or driver like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_busline .= " order by lineid {$sortdir} ";
                break;
			
            case '2':
                $sql_busline .= " order by linename {$sortdir} ";
                break;
				
			case '3':
				$sql_busline .= " order by line {$sortdir} ";
				break;
            
            case '4':
                $sql_busline .= " order by linetime {$sortdir} ";
                break;

            case '5':
                $sql_busline .= " order by driver {$sortdir} ";
                break;
            
            case '6':
                $sql_busline .= " order by dmobile {$sortdir} ";
                break;
                
            case '7':
                $sql_busline .= " order by busnumber {$sortdir} ";
                break;
                
            case '8':
                $sql_busline .= " order by teamer {$sortdir} ";
                break;
                
            case '9':
                $sql_busline .= " order by tmobile {$sortdir} ";
                break;
                
            case '10':
                $sql_busline .= " order by temail {$sortdir} ";
                break;
                	
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_busline .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_busline);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $num_memData = count($memberData);
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['lineid'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=bus&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=bus&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<12;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        }
        exit;
    } 

	//班车线路信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '班车线路添加';
        $data['navshow'] = 'bus';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>班车线路管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bus">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bus">班车线路管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>班车线路添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkbus();
        $this -> load -> view('addbus',$data);
    }

    //执行班车线路信息添加
    public function insert(){
        //获取表单提交信息
    	$linename = trim($_POST['linename']) ? trim($_POST['linename']) : '';
		$sno = is_numeric($_POST['sno']) ? intval($_POST['sno']) : 0;
        $line = trim($_POST['line']) ? trim($_POST['line']) : '';
        $linetime = trim($_POST['linetime']) ? trim($_POST['linetime']) : '';
        $driver = trim($_POST['driver']) ? trim($_POST['driver']) : '';
        $dmobile = trim($_POST['dmobile']) ? trim($_POST['dmobile']) : '';
        $busnumber = trim($_POST['busnumber']) ? trim($_POST['busnumber']) : '';
        $teamer = trim($_POST['teamer']) ? trim($_POST['teamer']) : '';
        $tmobile = trim($_POST['tmobile']) ? trim($_POST['tmobile']) : '';
        $temail = trim($_POST['temail']) ? trim($_POST['temail']) : '';
        $get_station = @$_POST['get_station'] ? $_POST['get_station'] : '';
        $send_time = @$_POST['send_time'] ? $_POST['send_time'] : '';
        $stop_address = @$_POST['stop_address'] ? $_POST['stop_address'] : '';
		$nightstart = trim($_POST['nightstart']) ? trim($_POST['nightstart']) : '';
        $nighttime = trim($_POST['nighttime']) ? trim($_POST['nighttime']) : '';
        $nightadd = trim($_POST['nightadd']) ? trim($_POST['nightadd']) : '';
        $createtime = date("Y-m-d H:i:s",time());
        $sql_bus = "insert into oa_busline(linename, sno, line, linetime, driver, dmobile, busnumber, teamer, tmobile, temail, nightstart, nighttime, nightadd, createtime) values('$linename', '$sno', '$line', '$linetime', '$driver', '$dmobile', '$busnumber', '$teamer', '$tmobile', '$temail', '$nightstart', '$nighttime', '$nightadd', '$createtime')";
        $obj_bus = $this -> db -> query($sql_bus);
        $insertid = $this -> db -> insert_id();
        if($obj_bus){
        	$sql_station = "insert into oa_busline_station(lineid, get_station, send_time, stop_address, createtime) values";
        	$count = count($get_station);
        	for($i=0;$i<$count;$i++){
        		$sql_station .= "("."'{$insertid}'".","."'{$get_station[$i]}'".","."'{$send_time[$i]}'".","."'{$stop_address[$i]}'".","."'{$createtime}'"."),";
        	}
        	$sql_station = rtrim($sql_station,',');
        	$obj_station = $this -> db -> query($sql_station);
        	if($obj_station){
        		echo "<script>alert('添加成功!');parent.location.href='index.php?c=bus&m=index';</script>";
        	}else{
        		echo "<script>alert('添加失败!');parent.location.href='index.php?c=bus&m=index';</script>";
        	}
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=bus&m=index';</script>";
        }
    }
    
    //班车线路信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '班车线路修改';
        $data['navshow'] = 'bus';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>班车线路管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=bus">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=bus">班车线路管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>班车线路修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> checkuser -> checkbus();
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_bus = "select * from oa_busline where lineid='{$id}'";
        $bus_ob = $this -> db -> query($sql_bus);
        $bus = $bus_ob -> row_array();
        $data['bus'] = $bus;
        $sql_station = "select * from oa_busline_station where lineid='{$id}'";
        $station_ob = $this -> db -> query($sql_station);
        $station = $station_ob -> result_array();
        $data['station'] = $station;
        $this -> load -> view('editbus',$data);
    }

    //执行班车线路信息修改
    public function update(){
    //获取表单提交信息
    	$id = is_numeric($_POST['id']) ? intval($_POST['id']) : 0;
		$linename = trim($_POST['linename']) ? trim($_POST['linename']) : '';
		$sno = is_numeric($_POST['sno']) ? intval($_POST['sno']) : 0;
        $line = trim($_POST['line']) ? trim($_POST['line']) : '';
        $linetime = trim($_POST['linetime']) ? trim($_POST['linetime']) : '';
        $driver = trim($_POST['driver']) ? trim($_POST['driver']) : '';
        $dmobile = trim($_POST['dmobile']) ? trim($_POST['dmobile']) : '';
        $busnumber = trim($_POST['busnumber']) ? trim($_POST['busnumber']) : '';
        $teamer = trim($_POST['teamer']) ? trim($_POST['teamer']) : '';
        $tmobile = trim($_POST['tmobile']) ? trim($_POST['tmobile']) : '';
        $temail = trim($_POST['temail']) ? trim($_POST['temail']) : '';
        $stationid = @$_POST['stationid'] ? $_POST['stationid'] : '';
        $get_station = @$_POST['get_station'] ? $_POST['get_station'] : '';
        $send_time = @$_POST['send_time'] ? $_POST['send_time'] : '';
        $stop_address = @$_POST['stop_address'] ? $_POST['stop_address'] : '';
		$nightstart = trim($_POST['nightstart']) ? trim($_POST['nightstart']) : '';
        $nighttime = trim($_POST['nighttime']) ? trim($_POST['nighttime']) : '';
        $nightadd = trim($_POST['nightadd']) ? trim($_POST['nightadd']) : '';
        $createtime = date("Y-m-d H:i:s",time());
        $sql_bus = "update oa_busline set linename='$linename', sno='$sno', line='$line', linetime='$linetime', driver='$driver', dmobile='$dmobile', busnumber='$busnumber', teamer='$teamer', tmobile='$tmobile', temail='$temail', nightstart='$nightstart', nighttime='$nighttime', nightadd='$nightadd', createtime='$createtime' where lineid='{$id}'";
        $obj_bus = $this -> db -> query($sql_bus);
        if($obj_bus){
        	$count = count($get_station);
        	$num = 0;
        	for($i=0;$i<$count;$i++){
        		if(!empty($stationid[$i])){
        			$sql_station = "update oa_busline_station set get_station='{$get_station[$i]}', send_time='{$send_time[$i]}', stop_address='{$stop_address[$i]}', createtime='$createtime' where stationid='{$stationid[$i]}'";
        			$ob_station = $this -> db -> query($sql_station);
        			if($ob_station){
        				$num++;
        			}
        		}else{
        			$sql_station = "insert into oa_busline_station(lineid, get_station, send_time, stop_address, createtime) values('{$id}', '{$get_station[$i]}', '{$send_time[$i]}', '{$stop_address[$i]}', '{$createtime}')";
        			$ob_station = $this -> db -> query($sql_station);
        			if($ob_station){
        				$num++;
        			}
        		}
        	}
        	if($count == $num){
        		echo "<script>alert('修改成功!');parent.location.href='index.php?c=bus&m=index';</script>";
        	}else{
        		echo "<script>alert('修改失败!');parent.location.href='index.php?c=bus&m=edit&id={$id}';</script>";
        	}
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=bus&m=edit&id={$id}';</script>";
        }
    }

    //班车线路信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_bus ="delete from oa_busline where lineid='$id'";
        $ob_bus = $this -> db ->query($sql_bus);
        $sql_station = "delete from oa_busline_station where lineid='{$id}'";
        $ob_station = $this -> db -> query($sql_station);
        //判断是否删除成功
        if($ob_bus && $ob_station){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=bus&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=bus&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_busline where lineid in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	$sql_station = "delete from oa_busline_station where lineid in ($idlist)";
    	$ob_station = $this -> db -> query($sql_station);
    	//判断是否删除成功
    	if($ob_del && $ob_station){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //班车线路添加页表单验证
    public function check(){
        //验证添加的班车线路名称是否已存在
        $linename = trim($_GET['linename']) ? trim($_GET['linename']) : "";
        $sql_bus = "select * from oa_busline where linename='$linename'";
        $bus_ob = $this -> db -> query($sql_bus);
        $bus = $bus_ob -> row_array();
        //判断班车线路名称是否合法
        if(empty($bus)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //班车线路修改页表单验证
    public function checkedit(){
        //验证表单中部门班车线路是否被更改
        $newlinename = trim($_POST['newlinename']) ? trim($_POST['newlinename']) : "";
        $oldlinename = trim($_POST['oldlinename']) ? trim($_POST['oldlinename']) : "";
        //班车线路名称未被更改时
        if($newlinename == $oldlinename){
            echo "true";exit;
        }else{ //班车线路名称改变时
            $sql_bus = "select * from oa_busline where linename='$newlinename';";
            $bus_ob = $this -> db -> query($sql_bus);
            $bus = $bus_ob -> row_array();
            //判断班车线路名称是否合法
            if(empty($bus)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}