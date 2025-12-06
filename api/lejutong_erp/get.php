<?php
$_GET['gz_no']="57804";
$_GET['request_time']=date("Y-m-d H:i:s");
$_GET['version'] = 1;
$_GET['platform']="ios";
$_GET['sign']     ="iiii";
if(getSignature($_GET,getSecret()) != $_GET['sign'] ){
        exit; 
    }
print_r($_GET);

 function getSignature($params,$secret){
    $str = '';  //待签名字符串
   //先将参数以其参数名的字典序升序进行排序
   ksort($params);
  //遍历排序后的参数数组中的每一个key/value对
   foreach ($params as $k => $v) {
     //为key/value对生成一个key=value格式的字符串，并拼接到待签名字符串后面
     $str .= "$k=$v";
    }
   //将签名密钥拼接到签名字符串最后面
    $str .= $secret;
   //通过md5算法为签名字符串生成一个md5签名，该签名就是我们要追加的sign参数值
   return md5($str);
 }
function getSecret(){
    // $curl = "http://lejutong.leju.com/api/v1/getkey_erp.php";
    // $ch = curl_init(); 
    // curl_setopt($ch, CURLOPT_URL, $curl); 
    // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    // $json = curl_exec($ch);

    // if(empty($json)){
        //出错不执行
        // echo 'Curl error: ' . curl_error($ch);
        // exit;
    // }
    // curl_close($ch);
    // $data = json_decode($json, true);
    // if( 200 != $data['code']){
       // exit;
    // }
     // return   Aes_encrypt::getInstance()->decode($data['data']);
	 return 'lejuchoujiangerp';
}
