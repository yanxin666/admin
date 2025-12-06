<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$config['oa_config'] = array(
		
		'state' => array(
			'0' => '未发送',
			'1' => '已发送'			
		),
		'notify_status' => array(
			'0' => '未发送',
			'1' => '已发送',
			'2' => '已送达',
			'3' => '发送失败',
			'4' => '未登录,未发送'
		),
		'read_status' => array(
				'0' => '未读',
				'1' => '已读'
		),
		'plat_form' => array(
			'Android' => 'Android ',
			'IOS' => 'IOS'
		),
		'version_status' => array(
				'0' => '历史版本',
				'1' => '当前版本'
		),
		'ctype' => array(
			'0' => '未知',
			'1' => '员工',
			'2' => '主管',
			'3' => '经理',
		),
		'type' => array(
				'1' => '收藏组',
				'2' => '邮件组',
				'3' => '自定义组'
		),
		'status' => array(
			'0' => '待定',
			'1' => '显示',
			'2' => '隐藏'
		),
		'activityos' => array(
			'1' => '待审核',
			'2' => '已审核'
		),
		'islk' => array(
				'1' => '未领取',
				'2' => '已领取'
		),
		'is_notify' => array(
			'0' => '待定',
			'1' => '有权限',
			'2' => '无权限'
		),
		'area' => array(
			'1' => '北方区',
			'2' => '华北区',
			'3' => '东北区',
			'4' => '华南区',
			'5' => '浙闽区',
			'6' => '苏南区',
			'7' => '东部区',
			'8' => '联合区',
			'9' => '单列市'
		),
		
		'email' => array(
			'smtp_server' => 'smtp.leju.com',
			'username' => 'hr@leju.com',
			'password' => 'nb8630',
			'port' => '25',
			'sitename' => '乐居通'
		),
		
		'service' => array(
				'0' => '待定',
				'1' => '技术支持电话',
				'2' => '行政支持电话',
				'3' => '人力支持电话'
		),
		
		'role' => array(
				'0' => '销售',
				'1' => '主管'
		)
);