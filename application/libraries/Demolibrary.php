<?php
class demolibrary{
	
	private $CI;
	
	public function __construct()
	{
		$this -> CI = & get_instance();
	}
	
	public function test(){
		echo 'dddd'; exit;
	}
	
 	public function foo()
    {
        $this -> CI -> load -> helper('url');
        redirect();
    }

    public function bar()
    {
        echo $this -> CI -> config -> item('base_url');
    }
    
    public function sessiondata(){
    	print_r($_SESSION);
    }
	
}