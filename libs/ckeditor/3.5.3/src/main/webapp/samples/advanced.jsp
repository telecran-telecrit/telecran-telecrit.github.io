<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
-->
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="com.ckeditor.CKEditorConfig"%>
<%@page import="com.ckeditor.EventHandler"%>
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
	<div class="description">
	<p>
		This sample shows how to add event handlers to CKEditor with Java.
	</p>
	<p>
		A snippet of the configuration code can be seen below; check the source code of this page for
		the full definition:
	</p>
	<pre class="samples">
&lt;%
CKEditorConfig settings = new CKEditorConfig();
settings.addConfigValue("skin", "office2003");
EventHandler eventHandler = new EventHandler();
eventHandler.addEventHandler("instanceReady", "function (ev) { alert(\"Loaded: \" + ev.editor.name); }");
String value = "Initial value";
%&gt;

&lt;ckeditor:editor basePath="/ckeditor/" value="&lt;%=value %&gt;" config="&lt;%=settings %&gt;" editor="editor1" events="&lt;%=eventHandler %&gt;"/&gt;

&lt;%
settings.removeConfigValue("skin");
settings.addConfigValue("uiColor", "#ADE82E");
settings.addConfigValue("toolbar", "[['Format'],['Bold','Italic','Underline','Strike','-','Subscript','Superscript']]");
%&gt;

&lt;ckeditor:replace basePath="/ckeditor/" config="&lt;%=settings %&gt;" replace="editor2" /&gt;
	</pre>
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
	<!-- This <fieldset> holds the HTML code that you will usually find in your pages. -->
	<form action="assets/sample_posteddata.jsp" method="post">
		<p>
			<label for="editor1">
				Editor 1:</label>
		</p>
		<p>
			<% 
				String value = "<p>This is some <strong>sample text</strong>. You are using <a href=\"http://ckeditor.com/\">CKEditor</a>.</p>";
				CKEditorConfig settings = new CKEditorConfig();
				settings.addConfigValue("skin", "office2003");
				EventHandler eventHandler = new EventHandler();
				eventHandler.addEventHandler("instanceReady", "function (ev) { alert(\"Loaded: \" + ev.editor.name); }");
			%>
			<ckeditor:editor basePath="../ckeditor/" config="<%=settings %>"
				 editor="editor1" value="<%= value %>"
				 events="<%=eventHandler %>"/>
		</p>
		<p>
			<label for="editor2">
				Editor 2:</label>
			<textarea cols="80" id="editor2" name="editor2" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
		</p>
		<%
			settings.removeConfigValue("skin");
			settings.addConfigValue("uiColor", "#ADE82E");
			settings.addConfigValue("toolbar", "[['Format'],['Bold','Italic','Underline','Strike','-','Subscript','Superscript']]");
		%>
		<ckeditor:replace basePath="../ckeditor/" config="<%=settings %>" replace="editor2" />
		<input type="submit" value="Submit"/>
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
