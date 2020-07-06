/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see http://ckeditor.com/license
*/
package com.ckeditor;


/**
 * <code>&lt;ckeditor:replace&gt;</code> tag code.
 * <b>Usage:</b>
 * <pre>&lt;ckeditor:replace replace="editor1" basePath="/ckeditor/" /&gt;</pre>
 */
public class CKEditorReplaceTag extends CKEditorTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1316780332328233835L;
	private String replace;

	/**
	 * Default constructor.
	 */
	public CKEditorReplaceTag() {
		replace = "";
	}
	
	@Override
	protected String getTagOutput(final CKEditorConfig config) {
		if (config != null && !config.isEmpty()) {
			return "CKEDITOR.replace('" + replace + "', " 
									+ TagHelper.jsEncode(config) + ");";
		} else {
			return "CKEDITOR.replace('" + replace + "');";
		}
	}

	/**
	 * @param replace the name of the replaced element to set
	 */
	public final void setReplace(final String replace) {
		this.replace = replace;
	}

	@Override
	protected String getCKEditorName() {
		return this.replace;
	}

}
