<?php
class Response{
	
	private static $_instance;
	const JSON = 'json';
	
	private function __construct(){
		
	}
	
	private function __clone(){
		
	}
	
	public static function getInstance(){
		if ( !self::$_instance instanceof Response ){
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	
	/**
	 * @param integer $code 状态码
	 * @param string $message 提示信息
	 * @param array $data 返回数据
	 * @param string $type 数据类型
	 * return string
	 */
	public function show( $code, $message = '', $data = array(), $type=self::JSON ){
		if ( !is_numeric($code) ){
			exit('The param code must be numeric type');
		}
		
		$type = isset($_GET['format']) ? trim($_GET['format']) : self::JSON;
		
		$result = array(
				'code' => $code,
				'message' => $message,
				'data' => $data,
		);
		
		switch ($type) {
			case 'json':
				self::json($code, $message, $data);
				break;
			case 'array':
				var_dump($result);
				break;
			case 'xml':
				self::xmlEncode($code, $message, $data);
				break;
			default:
				exit('The param must be [json|array|xml]');
		}
		
	}
	
	/**
	 * 输出json类型数据
	 * @param integer $code 状态码
	 * @param string $message 提示信息
	 * @param unknown $data 返回数据
	 */
	private static function json( $code, $message = '', $data = array() ){
		if ( !is_numeric($code) ){
			exit('The param code must be numeric type');
		}
		
		$result = array(
				'code' => $code,
				'message' => $message,
				'data' => $data,
		);
		
		echo json_encode($result);
	}
	
	/**
	 * 输出XML类型数据
	 * @param integer $code 状态码
	 * @param string $message 提示信息
	 * @param unknown $data 返回数据
	 */
	private static function xmlEncode( $code, $message = '', $data = array() ){
		if ( !is_numeric($code) ){
			exit('The param code must be numeric type');
		}
		
		$result = array(
				'code' => $code,
				'message' => $message,
				'data' => $data,
		);
		
		header("Content-Type:text/xml");
		$xml = "<?xml version='1.0' encoding='UTF-8'?>";
		$xml .= "<root>";
		$xml .= '<code>'.$result['code'].'</code>';
		$xml .= '<message>'.$result['message'].'</message>';
		$xml .= "<data>";
		$xml .= self::xmlToEncode($data);
		$xml .= "</data>";
		$xml .= "</root>";
		echo $xml;
	}
	
	private static function xmlToEncode( $data ){
		$xml = $attr = "";
		foreach ( $data as $key => $value ){
			if (is_numeric($key)){
				$attr =  ' id="'.$key.'"';
				$key = 'item';
			}
			$xml .= "<{$key}{$attr}>";
			$xml .= is_array($value) ? self::xmlToEncode($value) : $value;
			$xml .= "</{$key}>";
		}
		return $xml;
	}
	
}