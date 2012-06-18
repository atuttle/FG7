<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>

	<div class="post">
		<h1>Error!</h1>
		<h3><mango:Message title /></h3>
		<p><mango:Message text /></p>
		<p><mango:Message data /></p>
	</div>

</template:layout>
