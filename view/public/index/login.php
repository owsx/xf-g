<?=$this->load('/header')?>

<script>
function check_form() {
	var f = document.form1;
	if ( !f.uname.value ) {
		alert("<?=L('err.username_blank')?>");
		f.uname.focus();
		return false;
	}
	if ( !f.upass.value ) {
		alert("<?=L('err.userpass_blank')?>");
		f.upass.focus();
		return false;
	}
	return true;
}
</script>

<fieldset>
<legend><?=L('login')?></legend>
<form name="form1" method="post" action="<?=U('do_login')?>" onsubmit="return check_form()">
<table>
<tbody>
<tr>
	<th><?=L('username')?>:</th>
	<td><input type="text" name="uname" maxlength="32"  placeholder="请输入账号" /></td>
</tr>
<tr>
	<th><?=L('userpass')?>:</th>
	<td><input type="password" name="upass" maxlength="32" required="required" placeholder="请输入密码" /></td>
</tr>
<tr>
	<th></th>
	<td><label><input type="checkbox" name="autologin" value="1" checked="checked" /><?=L('autologin')?></label></td>
</tr>
</tbody>
<tfoot>
<tr>
	<th></th>
	<td><button type="submit"><?=L('login')?></button></td>
</tr>
</tfoot>
</table>
</form>
</fieldset>

<?=$this->load('/footer')?>
