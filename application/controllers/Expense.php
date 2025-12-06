<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class expense extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '报销管理';
    	$data['navshow'] = 'expense';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>报销管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=expense">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=expense">报销管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>报销列表</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkexpense();
        $this -> load -> view('showexpense', $data);
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
        $sql_expense_total = "select count(id) as memTotal from oa_expense";
        $memTotal_ob = $this -> db -> query($sql_expense_total);
        $memTotal = $memTotal_ob -> row_array();
        
        $reAjaxData['iTotalRecords'] = $memTotal['memTotal'];
        $reAjaxData['iTotalDisplayRecords'] = $memTotal['memTotal'];
        
        //查询数据
        $sql_expense = "select e.id, e.expense_code, u.fullname, o.depart_name, e.draft_time, e.total_expense, e.had_act_user, e.budget_year, e.budget_month, e.activityos, e.islk, e.gz_no from oa_expense as e left join oa_user as u on e.author_user=u.id left join oa_org as o on e.author_dept=o.id";
        //查询条件
        if($search){
            $sql_expense .= " where e.id like '%{$search}%' or e.expense_code like '%{$search}%' or e.author_user like '%{$search}%' ";
        }
        //按对应字段排序
        switch ($sortcol) {
            case '1':
                $sql_expense .= " order by e.id {$sortdir} ";
                break;
            
            case '2':
                $sql_expense .= " order by e.expense_code {$sortdir} ";
                break;

            case '3':
                $sql_expense .= " order by u.fullname {$sortdir} ";
                break;
            
            case '4':
                $sql_expense .= " order by o.depart_name {$sortdir} ";
                break;
			case '5' :
				$sql_expense .= " order by e.draft_time {$sortdir} ";
				break;
			
			case '6' :
				$sql_expense .= " order by e.total_expense {$sortdir} ";
				break;
			
			case '7' :
				$sql_expense .= " order by e.had_act_user {$sortdir} ";
				break;
			
			case '8' :
				$sql_expense .= " order by e.budget_year {$sortdir} ";
				break;
                	
            case '9' :
				$sql_expense .= " order by e.budget_month {$sortdir} ";
				break;
			
			case '10' :
				$sql_expense .= " order by e.activityos {$sortdir} ";
				break;
			
			case '11' :
				$sql_expense .= " order by e.islk {$sortdir} ";
				break;
			
			case '12' :
				$sql_expense .= " order by e.gz_no {$sortdir} ";
				break;
                	
            default:
                break;
        }
        //限定查询数据范围
        if($pagesize != -1){
            $sql_expense .= " limit {$offset}, {$pagesize}";
        }
        $memberData_ob = $this -> db -> query($sql_expense);
        $memberData = $memberData_ob -> result_array();
        //拼接表格中的数据
        $num_memData = count($memberData);
        $activityos = $this->config->item('oa_config')['activityos'];
        $islk = $this->config->item('oa_config')['islk'];
        for ($i=0; $i < $num_memData; $i++){
            $idlist = $memberData[$i]['id'];
        	$reAjaxData['aaData'][$i][] = "<input name=\"checkList\" class=\"checkboxes\" type=\"checkbox\" value="."$idlist".">";
            foreach ($memberData[$i] as $mkey => $member){
                $reAjaxData['aaData'][$i][] = $member;
            }
            $reAjaxData['aaData'][$i][10] = $activityos[$reAjaxData['aaData'][$i][10]];
            $reAjaxData['aaData'][$i][11] = $islk[$reAjaxData['aaData'][$i][11]];
            $id = $reAjaxData['aaData'][$i]['1'];
            $reAjaxData['aaData'][$i][] = '<a href="/index.php?c=expense&m=edit&id='.$id.'"><span class="label label-success">修改</span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="/index.php?c=expense&m=del&id='.$id.'" onclick="javascript:return confirm(\'删除后无法恢复,确定要删除吗?\')"."><span class="label label-success">删除</span></a>';
        }
        if(strlen(json_encode($reAjaxData)) < 80){
        	$reAjaxData['aaData'][0][0] = "没有数据";
        	for($i=1;$i<14;$i++){
        		$reAjaxData['aaData'][0][$i] = "";
        	}
        	echo json_encode($reAjaxData);
        }else{
        	echo json_encode($reAjaxData);
        }
        exit;
    } 

	//报销信息添加页
    public function add(){
        //状态栏控制
        $data['title'] = '报销添加';
        $data['navshow'] = 'expense';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>报销管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=expense">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=expense">报销管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>报销添加</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkexpense();
        //查询用户
        $sql_user = "select id, fullname from oa_user where id!=1";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        //查询部门
        $sql_org = "select id, depart_name from oa_org";
        $ob_org = $this -> db -> query($sql_org);
        $org = $ob_org -> result_array();
        $data['org'] = $org;
        $this -> load -> view('addexpense',$data);
    }

    //执行报销信息添加
    public function insert(){
        //获取表单提交信息
        $expense_code = trim($_POST['expense_code']) ? trim($_POST['expense_code']) : '';
        $author_user = is_numeric($_POST['author_user']) ? intval($_POST['author_user']) : 0;
        $author_dept = is_numeric($_POST['author_dept']) ? intval($_POST['author_dept']) : 0;
        $draft_time = trim($_POST['draft_time']) ? trim($_POST['draft_time']) : '';
        $total_expense = trim($_POST['total_expense']) ? trim($_POST['total_expense']) : '';
        $had_act_user = trim($_POST['had_act_user']) ? trim($_POST['had_act_user']) : '';
        $budget_year = trim($_POST['budget_year']) ? trim($_POST['budget_year']) : '';
        $budget_month = trim($_POST['budget_month']) ? trim($_POST['budget_month']) : '';
        $activityos = is_numeric($_POST['activityos']) ? intval($_POST['activityos']) : 0;
        $islk = is_numeric($_POST['islk']) ? intval($_POST['islk']) : 0;
        $gz_no = trim($_POST['gz_no']) ? trim($_POST['gz_no']) : '';
        $sql_expense = "insert into oa_expense(expense_code, author_user, author_dept, draft_time, total_expense, had_act_user, budget_year, budget_month, activityos, islk, gz_no) values('$expense_code', '$author_user', '$author_dept', '$draft_time', '$total_expense', '$had_act_user', '$budget_year', '$budget_month', '$activityos', '$islk', '$gz_no')";
        $obj_expense = $this -> db -> query($sql_expense);
        //判断添加是否成功
        if($obj_expense){
            echo "<script>alert('添加成功!');parent.location.href='index.php?c=expense&m=index';</script>";
        }else{
            echo "<script>alert('添加失败!');parent.location.href='index.php?c=expense&m=index';</script>";
        }
    }
    
    //报销信息修改页
    public function edit(){
        //加载修改表单的数据
        //状态栏控制
        $data['title'] = '报销修改';
        $data['navshow'] = 'expense';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>报销管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=expense">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=expense">报销管理</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>报销修改</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
        //权限控制
        $data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
		$this -> checkuser -> checkexpense();
        //查询修改数据
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : '';
        $sql_expense = "select id, expense_code, author_user, author_dept, draft_time, total_expense, had_act_user, budget_year, budget_month, activityos, islk, gz_no from oa_expense where id={$id};";
        $expense_ob = $this -> db -> query($sql_expense);
        $expense = $expense_ob -> row_array();
        $data['expense'] = $expense;
        //查询用户
        $sql_user = "select id, fullname from oa_user where id!=1";
        $ob_user = $this -> db -> query($sql_user);
        $user = $ob_user -> result_array();
        $data['user'] = $user;
        //查询部门
        $sql_org = "select id, depart_name from oa_org";
        $ob_org = $this -> db -> query($sql_org);
        $org = $ob_org -> result_array();
        $data['org'] = $org;
        $this -> load -> view('editexpense',$data);
    }

    //执行报销信息修改
    public function update(){
        //获取表单提交信息
        $id = is_numeric($_POST['id']) ? intval($_POST['id']) : "";
        $expense_code = trim($_POST['expense_code']) ? trim($_POST['expense_code']) : '';
        $author_user = is_numeric($_POST['author_user']) ? intval($_POST['author_user']) : 0;
        $author_dept = is_numeric($_POST['author_dept']) ? intval($_POST['author_dept']) : 0;
        $draft_time = trim($_POST['draft_time']) ? trim($_POST['draft_time']) : '';
        $total_expense = trim($_POST['total_expense']) ? trim($_POST['total_expense']) : '';
        $had_act_user = trim($_POST['had_act_user']) ? trim($_POST['had_act_user']) : '';
        $budget_year = trim($_POST['budget_year']) ? trim($_POST['budget_year']) : '';
        $budget_month = trim($_POST['budget_month']) ? trim($_POST['budget_month']) : '';
        $activityos = is_numeric($_POST['activityos']) ? intval($_POST['activityos']) : 0;
        $islk = is_numeric($_POST['islk']) ? intval($_POST['islk']) : 0;
        $gz_no = trim($_POST['gz_no']) ? trim($_POST['gz_no']) : '';
        $sql_expense = "update oa_expense set expense_code='$expense_code', author_user='$author_user', author_dept='$author_dept', draft_time='$draft_time', total_expense='$total_expense', had_act_user='$had_act_user', budget_year='$budget_year', budget_month='$budget_month', activityos='$activityos', islk='$islk', gz_no='$gz_no' where id='$id'";
        $ob_expense = $this -> db -> query($sql_expense);
        //判断是否修改成功
        if($ob_expense){
            echo "<script>alert('修改成功!');parent.location.href='index.php?c=expense&m=index';</script>";
        }else{
            echo "<script>alert('修改失败!');parent.location.href='index.php?c=expense&m=index';</script>";
        }
    }

    //报销信息删除
    public function del(){
        $id = is_numeric($_GET['id']) ? intval($_GET['id']) : "";
        $sql_expense ="delete from oa_expense where id='$id'";
        $ob_expense = $this -> db ->query($sql_expense);
        //判断是否删除成功
        if($ob_expense){
            echo "<script>alert('删除成功!');parent.location.href='index.php?c=expense&m=index';</script>";
        }else{
            echo "<script>alert('删除失败!');parent.location.href='index.php?c=expense&m=index';</script>";
        }
    }
    
    //批量删除
    function dellist(){
    	$idlist = trim($_POST['idlist']) ? trim($_POST['idlist']) : '';
    	$sql_del = "delete from oa_expense where id in ($idlist)";
    	$ob_del = $this -> db -> query($sql_del);
    	//判断是否删除成功
    	if($ob_del){
    		echo 1;
    	}else{
    		echo 2;
    	}
    }

    //报销添加页表单验证
    public function check(){
        //验证添加的报销单号是否已存在
        $expense_code = trim($_GET['expense_code']) ? trim($_GET['expense_code']) : "";
        $sql_expense = "select * from oa_expense where expense_code='$expense_code'";
        $expense_ob = $this -> db -> query($sql_expense);
        $expense = $expense_ob -> row_array();
        //判断报销单号是否合法
        if(empty($expense)){
            echo "true";exit;
        }else{
            echo "false";exit;
        }
    }

    //报销修改页表单验证
    public function checkedit(){
        //验证表单中报销单号是否被更改
        $newcode = trim($_POST['newcode']) ? trim($_POST['newcode']) : "";
        $oldcode = trim($_POST['oldcode']) ? trim($_POST['oldcode']) : "";
        //报销单号未被更改时
        if($newcode == $oldcode){
            echo "true";exit;
        }else{ //报销单号改变时
            $sql_expense = "select * from oa_expense where expense_code='$newcode';";
            $expense_ob = $this -> db -> query($sql_expense);
            $expense = $expense_ob -> row_array();
            //判断报销单号是否合法
            if(empty($expense)){
                echo "true";exit;
            }else{
                echo "false";exit;
            }
        }
    }
}