/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see http://ckeditor.com/license
*/
package com.ckeditor;

/**
 * <code>&lt;ckeditor:replaceAll&gt;</code> tag code.
 * <b>Usage:</b>
 * <pre>&lt;ckeditor:replaceAll basePath="/ckeditor/" /&gt;</pre>
 */
public class CKEditorReplaceAllTag extends CKEditorTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7331873466295495480L;
	private String className;

	/**
	 * Default constructor.
	 */
	public CKEditorReplaceAllTag() {
		this.className = "";
	}
	
	@Override
	protected String getTagOutput(final CKEditorConfig config) {
		if (config == null || config.isEmpty()) {
			if (className == null || "".equals(className)) {
				return "CKEDITOR.replaceAll();";
			} else {
				return "CKEDITOR.replaceAll('" + className + "');";
			}
		} else {
			StringBuilder sb = new StringBuilder(
					"CKEDITOR.replaceAll( function(textarea, config) {\n");
			if (className != null && !"".equals(className)) {
				sb.append("	var classRegex = new RegExp('(?:^| )' + '");
				sb.append(className);
				sb.append("' + '(?:$| )');\n");
				sb.append("	if (!classRegex.test(textarea.className))\n");
				sb.append("		return false;\n");
			}
			sb.append("	CKEDITOR.tools.extend(config, ");
			sb.append(TagHelper.jsEncode(config));
			sb.append(", true);} );");
			return sb.toString();
		}
	}


	/**
	 * @param className the class name to set
	 */
	public final void setClassName(final String className) {
		this.className = className;
	}

	@Override
	protected String getCKEditorName() {
		return "";
	}

	
}
