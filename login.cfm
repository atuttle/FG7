<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout tabs="false" sidebar="false" title="Login &bull; FusionGrokker">
	<h1>Super Secret Administration Area!</h1>
	<h3>Keep out!</h3>
	<h4>No girls allowed!</h4>
	<div class="post">
		<mango:RequestVar ifExists="errormsg">
			<p class="error"><mango:RequestVar name="errormsg" /></p>
		</mango:RequestVar>
		<form action="<mangox:Environment selfUrl />" method="post" id="login_form">
			<p><input name="username" id="username" value="" placeholder="Username" size="22" type="text" class="text_input" /></p>
			<p><input name="password" id="password" value="" size="22" type="password" placeholder="Password" class="text_input" /></p>
			<p><button name="login" class="form_submit" type="submit" id="submit">Login</button></p>
		</form>
	</div>
</template:layout>
