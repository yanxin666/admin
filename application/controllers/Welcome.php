<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class welcome extends CI_Controller{
	
    //构造函数
	public function __construct(){
		parent::__construct();
		$this -> load -> database();
	}
	
    //浏览页
    public function index(){
    	//状态栏控制
    	$data['title'] = '欢迎页管理';
    	$data['navshow'] = 'welcome';
        //导航栏控制
        $breadcrumb = '<h3 class="page-title">管理员管理后台<small>欢迎页管理</small></h3>';
        $breadcrumb .= '<ul class="breadcrumb">';
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<i class="icon-home"></i>';
        $breadcrumb .= '<a href="/index.php?c=welcome">首页</a>';
        $breadcrumb .= '<i class="icon-angle-right"></i>';
        $breadcrumb .= '</li>';
        
        
        $breadcrumb .= '<li>';
        $breadcrumb .= '<a href="/index.php?c=welcome">欢迎页管理</a>';
        $breadcrumb .= '<i class="icon-angle-slide"></i>';
        $breadcrumb .= '</li>';
        
        $breadcrumb .= '<li>欢迎页</li>';
        $breadcrumb .= '</ul>';
        $data['breadcrumb'] = $breadcrumb;
    	//权限控制
    	$data['shownavlist'] = $this -> checkuser -> system_level($data['navshow']);
        $this -> load -> view('welcome_message', $data);
    }
}