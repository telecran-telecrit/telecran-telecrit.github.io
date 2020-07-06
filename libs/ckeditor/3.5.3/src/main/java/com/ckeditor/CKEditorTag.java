/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see http://ckeditor.com/license
*/
package com.ckeditor;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * Base class for CKEditor tags.
 */
public abstract class CKEditorTag extends TagSupport {
	
	private static final String TIMESTAMP = "B37D54V";
	/**
	 * 
	 */
	private static final long serialVersionUID = -5642419066547779817L;
	private String basePath;
	private String timestamp;
	private boolean initialized;
	private CKEditorConfig config;
	private EventHandler events;
	private GlobalEventHandler globalEvents;
		
	/**
	 * Default constructor.
	 */
	public CKEditorTag() {
		timestamp = "B37D54V";		
		basePath = "";
		initialized = false;
		config = null;
		events = null;
	}
	

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		configureContextParams();
		try {
			String output = "";
			if (!initialized && !isInitializedParam()) {
				out.write(init());
			}
			if (globalEvents != null) {
				output += globalEvents.returnGlobalEvents();
			}
			CKEditorConfig cfg = null;
			if (config != null) {
				cfg = config.configSettings(this.events);
			}
			output += getTagOutput(cfg);
			out.write(TagHelper.script(output));
		} catch (Exception e) {
			try {
				HttpServletResponse resp = (HttpServletResponse) 
														pageContext.getResponse();
				resp.reset();
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
								"Problem with tag creation.");
				e.printStackTrace();
			} catch (IOException e1) {
				throw new JspException(e1);
			}
		}
		return EVAL_PAGE;
	}

	/**
	 * Adds to config params from pageContext. Used in integration with CKFinder.
	 */
	private void configureContextParams() {
		if (pageContext.getAttribute("ckeditor-params") != null) {
			@SuppressWarnings("unchecked")
			Map<String, Map<String, String>> map = 
								(Map<String, Map<String, String>>)
										pageContext.getAttribute("ckeditor-params");
			if (map.get(getCKEditorName()) != null) {
				parseParamsFromContext(map.get(getCKEditorName()));
			} else if (map.get("*") != null) {
				parseParamsFromContext(map.get("*"));
			}
		}		
	}

	/**
	 * Parse params from pageContext attribute.
	 * @param map attributes map
	 */
	private void parseParamsFromContext(final Map<String, String> map) {
		if (!map.isEmpty() && config == null) {
			config = new CKEditorConfig();
		}
		for (String key : map.keySet()) {
			config.addConfigValue(key, map.get(key));
		}
	}

	/**
	 * Check if earlier CKEditor's have initialized ckeditor.js.
	 * @return true if have.
	 */
	private boolean isInitializedParam() {
		if ("initialized".equals(pageContext.getAttribute("ckeditor-initialized"))) {
			return true; 
		} else {
			pageContext.setAttribute("ckeditor-initialized", "initialized");
			return false;
		}
	}

	
	/**
	 * Returns standard tag output.
	 * @param config configuration resolved to a string
	 * @return tag standard output
	 */
	protected abstract String getTagOutput(final CKEditorConfig config);
	
	/**
	 * Initialization method for tags.
	 * @return include ckfinder.js code with attributes and additional code.
	 */
	protected String init() {
		String out = "";
		String args = "";
		String ckeditorPath = getBasePath();
		if (timestamp != null) {
			args += "?t=" + timestamp;
		}
		if (ckeditorPath.contains("..")) {
			out += TagHelper.script("window.CKEDITOR_BASEPATH='" +  ckeditorPath  + "';");
		}
		out += TagHelper.createCKEditorIncJS(ckeditorPath, args);
		
		String extraCode = "";
		if (timestamp != TIMESTAMP) {
			extraCode += (extraCode.length() > 0) ? "\n" : ""
				.concat("CKEDITOR.timestamp = '")
				.concat(timestamp)
				.concat("';");
		}
		if (extraCode.length() > 0) {
			out += TagHelper.script(extraCode);
		}
		return out;
	}	

	/**
	 * Checks if basePath contains "/" at the end and adds it if it does not.	
	 * @return basePath or basePath with "/" added at the end 
	*/
	private String getBasePath() {
		if (basePath.equals("") || basePath.charAt(basePath.length() - 1) != '/') {
			return basePath.concat("/");
		} else {
			return basePath;
		}
	}

	/**
	 * @param basePath the basePath to set
	 */
	public final void setBasePath(final String basePath) {
		this.basePath = basePath;
	}

	/**
	 * @return the timestamp attribute
	 */
	public final String getTimestamp() {
		return timestamp;
	}

	/**
	 * @param timestamp the timestamp attribute to set
	 */
	public final void setTimestamp(final String timestamp) {
		this.timestamp = timestamp;
	}

	/**
	 * @return the initialized attribute
	 */
	public final boolean isInitialized() {
		return initialized;
	}

	/**
	 * @param initialized the initialized attribute to set
	 */
	public final void setInitialized(final boolean initialized) {
		this.initialized = initialized;
	}

	/**
	 * @return the globalEvents attribute
	 */
	public final GlobalEventHandler getGlobalEvents() {
		return globalEvents;
	}

	/**
	 * @param globalEvents the globalEvents attribute to set
	 */
	public final void setGlobalEvents(final GlobalEventHandler globalEvents) {
		this.globalEvents = globalEvents;
	}

	/**
	 * @return the config attribute
	 */
	public final CKEditorConfig getConfig() {
		return config;
	}

	/**
	 * @param config the config attribute to set
	 */
	public final void setConfig(final CKEditorConfig config) {
		this.config = config;
	}
	
	/**
	 * @return the events attribute
	 */
	public final EventHandler getEvents() {
		return events;
	}

	/**
	 * @param events the events attribute to set
	 */
	public final void setEvents(final EventHandler events) {
		this.events = events;
	}

	/**
	 * gets name of the CKEditor instance. 
	 * @return name if CKEditor instance.
	 */
	protected abstract String getCKEditorName();
}
