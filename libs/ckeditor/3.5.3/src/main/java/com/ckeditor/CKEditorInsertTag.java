/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see http://ckeditor.com/license
*/
package com.ckeditor;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

/**
 * <code>&lt;ckeditor:editor&gt;</code> tag code.
 * 
 * <b>Usage:</b>
 * <pre>&lt;ckeditor:editor basePath="/ckeditor/" editor="editor1" /&gt;</pre>
 */
public class CKEditorInsertTag extends CKEditorTag {

	private static final long serialVersionUID = 1316780332328233835L;

	private static final String DEFAULT_TEXTAREA_ROWS = "8";
	private static final String DEFAULT_TEXTAREA_COLS = "60";
	private static final String[] CHARS_FROM  = {"&", "\"", "<", ">"};
	private static final String[] CHARS_TO = {"&amp;", "&quot;", "&lt;", "&gt;"};

	private String editor;
	private String value;
	private Map<String, String> textareaAttributes;
	


	/**
	 * Default constructor.
	 */
	public CKEditorInsertTag() {
		textareaAttributes = new HashMap<String, String>();
		editor = "";
		value = "";
	}
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.write(createTextareaTag());
		} catch (Exception e) {
			try {
				HttpServletResponse resp = (HttpServletResponse) 
														pageContext.getResponse();
				resp.reset();
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
								"Problem with tag creation.");
			} catch (IOException e1) {
				throw new JspException(e1);
			}
		}
		return EVAL_PAGE;
	}
	
	
	@Override
	protected String getTagOutput(final CKEditorConfig config) {
		if (config != null && !config.isEmpty()) {
			return "CKEDITOR.replace('" + editor + "', " 
									+ TagHelper.jsEncode(config) + ");";
		} else {
			return "CKEDITOR.replace('" + editor + "');";
		}
	}

	/**
	 * Creates HTML code to insert a textarea element into the page.
	 * @return textarea code
	 */
	private String createTextareaTag() {
		StringBuilder sb = new StringBuilder();
		sb.append("<textarea name=\"");
		sb.append(editor);
		sb.append("\" ");
		sb.append(createTextareaAttributesText());
		sb.append(" >");
		sb.append(escapeHtml(value));
		sb.append("</textarea>");
		sb.append("\n");
		return sb.toString();
	}

	/**
	 * Convert special characters to HTML entities.
	 * @param text
	 * @return
	 */
	private Object escapeHtml(String text) {
		String result = text;
		if (text.equals(""))
			return "";
		for (int i = 0; i < CHARS_FROM.length; i++) {
			result = result.replaceAll(CHARS_FROM[i], CHARS_TO[i]);
		}
		return result;
	}

	/**
	 * Creates a String object from the textarea attributes map.
	 * @return textarea attributes String object
	 */
	private String createTextareaAttributesText() {
		if (textareaAttributes.isEmpty()) {
			textareaAttributes.put("rows", DEFAULT_TEXTAREA_ROWS);
			textareaAttributes.put("cols", DEFAULT_TEXTAREA_COLS);
		}
		StringBuilder sb = new StringBuilder();
		for (String s : textareaAttributes.keySet()) {
			sb.append(" ");
			sb.append(s + "=\"" + textareaAttributes.get(s) + "\"");
		}
		return sb.toString();
	}

	/**
	 * @param editor the editor to set
	 */
	public final void setEditor(final String editor) {
		this.editor = editor;
	}

	/**
	 * @param value the String value to set
	 */
	public final void setValue(final String value) {
		this.value = value;
	}
	
	/**
	 * @param textareaAttr the textarea attributes to set
	 */
	public final void setTextareaAttributes(final Map<String, String> textareaAttr) {
		this.textareaAttributes = textareaAttr;
	}

	@Override
	protected String getCKEditorName() {
		return this.editor;
	}	

}
