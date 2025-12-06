<?php
// $keywords = trim($_REQUEST['keywords']) ? trim($_REQUEST['keywords']) : '';
// $http = 'http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords='.$keywords;
$http = 'http://new.intra.leju.com/index.php?m=addressBook&c=api&a=get_userinfo_json&keywords=xinlei6';
$data = json_decode(file_get_contents($http),true);
var_dump($data);exit;
echo $data."\/n";
$string = time().rand(1000,9999).'.jpg';
$newfile = $_SERVER['SINASRV_DATA_DIR'].$string;
echo $newfile."\/n";
file_put_contents($newfile,$data);
$sql_update = "update oa_user set pic_path='{$newfile}' where sno='{$keywords}'";
$ob_update = $this -> db -> query($sql_update);
if($ob_update){
	echo "ok";
}else{
	echo "false";
}