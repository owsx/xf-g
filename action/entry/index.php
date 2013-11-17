<?php

class index_a extends entry_action {

	function index() {
		R(U('select'));
	}

	function select() {
		$sql = "SELECT * FROM `character` WHERE `del`='0' AND `account`='{$this->user->id}'";
		$rs = $this->base['db']->getall($sql);
		
		$char_limit = 5;
		$this->_set('char_limit',$char_limit);
		$this->_set('rs',$rs);

	}

	function create() {
		
	}

	function logout() {
		unset($_SESSION['char_id']);
		R(U('select'));
	}

	function do_select() {
		$i['char'] = I('post.char');
		
		if ( !$i['char'] ) {
			msg('err.empty_fields');
		}
		
		$sql = "SELECT `id` FROM `character` WHERE `del`='0' AND `account`='{$this->user->id}' AND `id`='{$i['char']}'";
		$rs = $this->base['db']->get($sql);
		if ( $rs['total'] == 0 ) {
			msg('char_not_exist');
		}
		
		$_SESSION['char_id'] = $rs['data']['id'];

		R(U('/world'));
	}

	function do_create() {
		$i['name'] = I('post.name');
		
		if ( !$i['name'] ) {
			msg('err.empty_fields');
		}

		$sql = "SELECT `id` FROM `character` WHERE `del`='0' AND `name`='{$i['name']}'";
		$rs = $this->base['db']->get($sql);
		if ( $rs['total'] ) {
			msg('char_name_exist');
		}

		$level = 1;
		$money = 0;
		$sql = "INSERT INTO `character` (`account`,`name`,`level`,`money`) VALUES ('{$this->user->id}','{$i['name']}','{$level}','{$money}')";
		$this->base['db']->query($sql);

		R(U('index'));
	}

}
