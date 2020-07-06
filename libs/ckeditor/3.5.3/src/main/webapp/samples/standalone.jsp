<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Creating CKEditor Instances &mdash; CKEditor Sample</title>
	<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
	<link type="text/css" rel="stylesheet" href="../ckeditor/samples/sample.css" />
</head>
<body>
	<h1 class="samples">
		CKEditor Sample &mdash; Creating CKEditor Instances
	</h1>
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
	<div class="description">
	<p>
		This sample shows how to create a CKEditor instance with Java.
	</p>
	<pre class="samples">
&lt;% 
String value = "My first &lt;strong&gt;CKEditor&lt;/strong&gt; Java tag";

CKEditorConfig settings = new CKEditorConfig();
settings.addConfigValue("width", "500");
settings.addConfigValue("toolbar", "Basic");
%&gt;

&lt;ckeditor:editor basePath="/ckeditor/" config="&lt;%=settings %&gt;" editor="textarea_id" value="&lt;%= value %&gt;"/&gt;</pre>
	<p>
		Note that <code><em>textarea_id</em></code> in the code above is the <code>id</code> and <code>name</code> attribute of
		the <code>&lt;textarea&gt;</code> element that will be created.
	</p>
	</div>
	<!-- This <fieldset> holds the HTML code that you will usually find in your pages. -->
	<form action="assets/sample_posteddata.jsp" method="post">
		<p>
			<label for="editor1">
				Editor 1:</label>
		</p>
		<p>
			<% 
				String value = "My first <strong>CKEditor</strong> Java tag";
				Map<String, String> attr = new HashMap<String, String>();
				attr.put("rows", "8");
				attr.put("cols", "50");
				CKEditorConfig settings = new CKEditorConfig();
				settings.addConfigValue("width", "500");
				settings.addConfigValue("toolbar", "Basic");
			%>
			<ckeditor:editor textareaAttributes="<%=attr %>"
				basePath="../ckeditor/" config="<%=settings %>"
				editor="editor1" value="<%= value %>"/>
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
</body>
</html>
