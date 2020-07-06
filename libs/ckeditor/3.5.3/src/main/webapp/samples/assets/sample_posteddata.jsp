<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@page import="com.ckeditor.SamplePostData"%>
<%@page import="java.util.Enumeration"%>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Sample &mdash; CKEditor</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="../../ckeditor/samples/sample.css" />
</head>
<body>
	<h1 class="samples">
		CKEditor &mdash; Posted Data
	</h1>
	<table border="1" cellspacing="0" id="outputSample">
		<colgroup><col width="100" /></colgroup>
		<thead>
			<tr>
				<th>Field&nbsp;Name</th>
				<th>Value</th>
			</tr>
		</thead>
	<%
		out.write(new SamplePostData(request).getAllFormFieldsAndValues());
	%>
	</table>
	<div id="footer">
		<hr />
		<p>
			CKEditor - The text editor for the Internet - <a class="samples" href="http://ckeditor.com/">http://ckeditor.com</a>
		</p>
		<p id="copy">
			Copyright &copy; 2003-2011, <a class="samples" href="http://cksource.com/">CKSource</a> - Frederico Knabben. All rights reserved.
		</p>
	</div>
</body>
</html>
