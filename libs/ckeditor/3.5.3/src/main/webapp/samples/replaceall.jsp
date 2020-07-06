<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Replace All Textarea Elements &mdash; CKEditor Sample</title>
	<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
	<link type="text/css" rel="stylesheet" href="../ckeditor/samples/sample.css" />
</head>
<body>
	<h1 class="samples">
		CKEditor Sample &mdash; Replace All Textarea Elements Using JSP tag
	</h1>
	<div class="description">
	<p>
		This sample shows how to replace all <code>&lt;textarea&gt;</code> elements
		with CKEditor by using JSP tag.
	</p>
	<p>
		To replace all <code>&lt;textarea&gt;</code> elements, place the following call at any point
		after the last <code>&lt;textarea&gt;</code> element:
	</p>	
	<pre class="samples">
&lt;ckeditor:replaceAll basePath="/ckeditor/" /&gt;</pre>
	</div>
	<!-- This <div> holds alert messages to be displayed in the sample page. -->
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
			<label for="editor2">
				Editor 2:</label>
			<textarea cols="80" id="editor2" name="editor2" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
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
	<ckeditor:replaceAll basePath="../ckeditor/" />
</body>
</html>
