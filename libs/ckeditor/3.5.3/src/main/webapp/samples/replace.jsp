<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Replace Selected Textarea Elements &mdash; CKEditor Sample</title>
	<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
	<link type="text/css" rel="stylesheet" href="../ckeditor/samples/sample.css" />
</head>
<body>
	<h1 class="samples">
		CKEditor Sample &mdash;  Replace Selected Textarea Elements Using Java Code
	</h1>
	<div class="description">
	<p>
		This sample shows how to replace a selected <code>&lt;textarea&gt;</code> element
		with a CKEditor instance by using Java code.
	</p>
	<p>
		To replace a <code>&lt;textarea&gt;</code> element, place the following call at any point
		after the <code>&lt;textarea&gt;</code> element:
	</p>
	<pre class="samples">
&lt;ckeditor:replace replace="textarea_id" basePath="/ckeditor/" /&gt;</pre>
	<p>
		Note that <code><em>textarea_id</em></code> in the code above is the <code>id</code> attribute of
		the <code>&lt;textarea&gt;</code> element to be replaced.
	</p>
	</div>
	<!-- This <div> holds alert messages to be display in the sample page. -->
	<div id="alerts">
		<noscript>
			<p>
				<strong>CKEditor requires JavaScript to run</strong>. In a browser with no JavaScript
				support, like yours, you should still see the contents (HTML data) and you should
				be able to edit it normally, without a rich editor interface.
			</p>
		</noscript>
	</div>
	<form action="assets/sample_posteddata.jsp" method="post">
		<p>
			<label for="editor1">
				Editor 1:</label>
			<textarea cols="80" id="editor1" name="editor1" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
		</p>
		<p>
			<input type="submit" value="Submit"/>
		</p>
	</form>
	<div id="footer">
		<hr />
		<p>
			CKEditor - The text editor for the Internet - <a class="samples" href="http://ckeditor.com/">http://ckeditor.com</a>
		</p>
		<p id="copy">
			Copyright &copy; 2003-2011, <a class="samples" href="http://cksource.com/">CKSource</a> - Frederico
			Knabben. All rights reserved.
		</p>
	</div>	
	<ckeditor:replace  replace="editor1" basePath="../ckeditor/" />
</body>
</html>
