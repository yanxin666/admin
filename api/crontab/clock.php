<?php
ini_set("display_errors","On");
error_reporting(E_ALL);
set_time_limit(0);

try {
	$dsn = "mysql:host={$_SERVER['SINASRV_DB_HOST']}:{$_SERVER['SINASRV_DB_PORT']};dbname={$_SERVER['SINASRV_DB_NAME']};charset=UTF8";
	//建立持久化的PDO连接
	$pdo = new PDO($dsn, $_SERVER['SINASRV_DB_USER'], $_SERVER['SINASRV_DB_PASS'], array(PDO::ATTR_PERSISTENT => true));
} catch (Exception $e) {
	die('连接数据库失败!');
}
$rs = $pdo -> query("select id, username, lejumail, sno, fullname, city, dept, depart_name, lft, rgt, wtype, tel, mobile, ctype, position, status, birthday, work_position, city_true, mailname, role_id, weibo, is_exists, wmh, pic_path from oa_user where id!=1");
$row = $rs -> fetchAll();
if(empty($row)){
	echo "mysql select error";
}else{
	foreach($row as $info){
		echo $info['id'];
		$http = "http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords={$info['username']}";
		$users = json_decode(file_get_contents($http),true);
		$users = @$users[0];
		if(!empty($users)){
			@$data['id'] = trim($users['id']);
			@$data['username'] = trim($users['username']);
			@$data['sno'] = trim($users['sno']);
			@$data['fullname'] = trim($users['fullname']);
			@$data['city'] = trim($users['city']);
			@$data['dept'] = trim($users['dept']);
			@$data['lft'] = trim($users['lft']);
			@$data['rgt'] = trim($users['rgt']);
			@$data['wtype'] = trim($users['wtype']);
			@$data['tel'] = trim($users['tel']);
			@$data['mobile'] = trim($users['mobile']);
			@$data['ctype'] = trim($users['ctype']);
			@$data['position'] = trim($users['position']);
			@$data['status'] = trim($users['status']);
			@$data['birthday'] = trim($users['birthday']);
			@$data['work_position'] = trim($users['work_position']);
			@$data['city_true'] = trim($users['city_true']);
			@$data['role_id'] = trim($users['role_id']);
			@$data['weibo'] = trim($users['weibo']);
			@$data['is_exists'] = trim($users['is_exists']);
			@$data['wmh'] = trim($users['wmh']);
			@$data['depart_name'] = trim($users['depart_name']);
			@$data['lejumail'] = trim($users['lejumail']) ? trim($users['lejumail']) : trim($users['username']);
			@$data['mailname'] = trim($users['mailname']);
			if(!empty($users['pic_path'])){
				$file = file_get_contents('http://new.intra.leju.com'.trim($users['pic_path']));
				$string = !empty($info['pic_path']) ? str_replace("data/thumb_img/", "", $info['pic_path']) : time().rand(1000,9999).'.jpg';
				$newfiles = $_SERVER['SINASRV_DATA_DIR'].'thumb_img/'.$string;
				file_put_contents($newfiles, $file);
				$img_pic = 'data/thumb_img/'.$string;
				@$data['pic_path'] = $img_pic;
			}else{
				@$data['pic_path'] = trim($users['pic_path']);
			}
			$sql_update = "update oa_user set id='{$data['id']}', username='{$data['username']}', lejumail='{$data['lejumail']}', sno='{$data['sno']}', fullname='{$data['fullname']}', city='{$data['city']}', dept='{$data['dept']}', depart_name='{$data['depart_name']}', lft='{$data['lft']}', rgt='{$data['rgt']}', wtype='{$data['wtype']}', tel='{$data['tel']}', mobile='{$data['mobile']}', ctype='{$data['ctype']}', position='{$data['position']}', status='{$data['status']}', birthday='{$data['birthday']}', work_position='{$data['work_position']}', city_true='{$data['city_true']}', mailname='{$data['mailname']}', role_id='{$data['role_id']}', weibo='{$data['weibo']}', is_exists='{$data['is_exists']}', wmh='{$data['wmh']}', pic_path='{$data['pic_path']}' where id='{$info['id']}'";
			$ob_update = $pdo -> query($sql_update);
		}else{
			echo "port error";
		}
	}
}
?>