<?php
class Aes_encrypt {
    
	private static $_instance;
	
	private $_secret_key = 'ljt_default_secret_key';
    
    private function __construct(){
    	
    }
    
    private function __clone(){
    	
    }
    
    public function setKey($key) {
    	$this -> _secret_key = $key;
    }
    
    public static function getInstance(){
    	if (!(self::$_instance instanceof Aes_encrypt) ){
    		self::$_instance = new self();
    	}
    	return self::$_instance;
    }
     
    public function encode($data) {
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC,'');
        $iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td), MCRYPT_RAND);
        mcrypt_generic_init($td, $this -> _secret_key,$iv);
        $encrypted = mcrypt_generic($td, $data);
        mcrypt_generic_deinit($td);
        return base64_encode($iv . $encrypted);
    }

    public function decode($data) {
    	$data = base64_decode($data);
        $td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');
        $iv = mb_substr($data, 0, mcrypt_enc_get_iv_size($td), 'latin1');
        mcrypt_generic_init($td, $this -> _secret_key, $iv);
        $data = mb_substr($data, mcrypt_enc_get_iv_size($td), mb_strlen($data, 'latin1'), 'latin1');
        $data = mdecrypt_generic($td, $data);
        mcrypt_generic_deinit($td);
        mcrypt_module_close($td);
        return trim($data);
    }
}

?>