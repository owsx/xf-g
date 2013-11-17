<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<?=C('charset')?>" />
	<title><?=web_title()?></title>
	<link rel="stylesheet" type="text/css" href="<?=_U_R?>theme/<?=C('web.theme')?>/main.css" />
	<script type="text/javascript" src="<?=_U_R?>js/jquery/jquery.js"></script>
	<script type="text/javascript" src="<?=_U_R?>js/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="<?=_U_R?>js/jquery/jquery.ui.datepicker-zh-CN.js" charset="utf-8"></script>
	<link type="text/css" rel="stylesheet" href="<?=_U_R?>js/jquery/jquery-ui.css" />
	<script type="text/javascript" src="<?=_U_R?>js/common.js" charset="utf-8"></script>
</head>
<body>
<div id="body">

<div id="header">
<div class="left"><a href="<?=U('/home')?>">Home</a></div>
<div class="right"><?=$char->name?> <a href="<?=U('/entry/index/logout')?>"><?=L('logout')?></a></div>
<div class="clear"></div>
</div>

<!-- start of index -->
<div id="index">
