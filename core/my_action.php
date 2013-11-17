<?php

class public_action extends x_action {
	
	function __construct() {
		parent::__construct();

		$this->user =& LC('user');
		$this->_set('user',$this->user);
	}

}

class admin_action extends public_action {

	function __construct() {
		parent::__construct();

		if ( !$this->user->islogin || !$this->user->level ) {
			R(U('/public'));
		}
	}

}

class home_action extends public_action {
	
	function __construct() {
		parent::__construct();

		if ( !$this->user->islogin ) {
			R(U('/public'));
		}
	}

}

class entry_action extends public_action {
	
	function __construct() {
		parent::__construct();

		if ( !$this->user->islogin ) {
			R(U('/public'));
		}
	}

}

class world_action extends public_action {
	
	function __construct() {
		parent::__construct();

		if ( !$this->user->islogin ) {
			R(U('/public'));
		}

		$this->char =& LC('char');
		$this->_set('char',$this->char);

		if ( !$this->char->id ) {
			R(U('/entry'));
		}
	}

}

