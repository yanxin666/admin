<?php
ini_set('dispaly_error', 'On');
error_reporting('E_ALL');
include_once('./Aes_encrypt.class.php');

$server   ='10.207.0.222:1433'; 
$username ='lejutong'; 
$password ='lejutong123';


checkSignature();
$db         = mssql_connect($server,$username,$password);
$gz_no      = addslashes($_GET['gz_no']);
$searchtime = explode("-",$_GET['searchtime']);

if($db){
	mssql_select_db('purch_erp');
	$sql='select * from V_LJTPersonExpense where GZ_NO=\''.$gz_no.'\' and BUDGET_YEAR=\''.$searchtime[0].'\' and BUDGET_MONTH=\''.$searchtime[1].'\'';
	$rows=mssql_query($sql);
	$row = mssql_fetch_assoc($rows);
  if($row){
    $row['DRAFT_TIME'] = date('Y-m-d H:i:s',strtotime($row['DRAFT_TIME']));
  	echo json_encode(array(
  		'code'    =>200,
      'message' => 'success',
  		'data'    =>$row
  		));
  }else{
  	echo json_encode(array(
  		'code'=>300,
      'message' =>'empty'
  		));
  }
}else{
  echo json_encode(array(
       'code' => 400,
       'message' => 'connect faild'
    ));
}

/**
**根据约定进行权限检查
*/
function checkSignature() {
    if(getSignature($_GET,getSecret()) != $_GET['sign'] ){
        exit; 
    }
       
}

/**
*获取secret
*@return string 返回secert值
*/
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


/**
  * 签名生成算法
  * @param array $params API调用的请求参数集合的关联数组，不包含sign参数
  * @return string 返回参数签名值 
*/
 function getSignature($params,$secret){
    $str = '';  //待签名字符串
   //先将参数以其参数名的字典序升序进行排序
   krsort($params);
  //遍历排序后的参数数组中的每一个key/value对
   foreach ($params as $k => $v) {
     //为key/value对生成一个key=value格式的字符串，并拼接到待签名字符串后面
     if($k != 'sign'){
     	$str .= "$k=$v";
     }
    }
   //将签名密钥拼接到签名字符串最后面
    $str .= $secret;
   //通过md5算法为签名字符串生成一个md5签名，该签名就是我们要追加的sign参数值
   return strtoupper(md5($str));
 }



/**
*sqlserver取出来的数据中的中文乱码，对其中的中文进行转码。
* @data array 要处理的数组
* 
*/

function td_iconv(&$data, $charset_from, $charset_to) { 
    if(strtolower($charset_from) == "gb2312") { 
        $charset_from = "gbk"; 
    } 
    if(strtolower($charset_from) == strtolower($charset_to)) { 
        return $data; 
    }    
     
    if(is_array($data)) { 
        foreach($data as $k => $v) { 
            if(is_array($v)) { 
                $data[$k] = td_iconv($v,$charset_from,$charset_to); 
            }else { 
                $data[$k] = is_string($v) ? mb_convert_encoding($v, $charset_to, $charset_from) : $v; 
            } 
        } 
    }else { 
    if(is_string($data)) 
          $data = mb_convert_encoding($data, $charset_to, $charset_from); 
    } 
    return $data; 
}
