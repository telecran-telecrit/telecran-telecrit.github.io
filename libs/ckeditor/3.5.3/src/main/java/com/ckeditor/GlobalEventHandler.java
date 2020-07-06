/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see http://ckeditor.com/license
*/
package com.ckeditor;

import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

/**
 * CKEditor global events class.
 * <b>Usage:</b>
 * <pre>
 	GlobalEventHandler globalEventHandler = new GlobalEventHandler();
	globalEventHandler.addEventHandler("dialogDefinition","function (ev) {
							alert(\"Loading dialog window: \" + ev.data.name); }");
	</pre>
 */
public class GlobalEventHandler extends EventHandler {

	
	private static Map<String, Set<String>> returndEvents;
	
	/**
	 * Resolves global events to a String.
	 * @return global events resolved to a String
	 */
	String returnGlobalEvents() {
		String out = "";
		if (returndEvents == null) {
			returndEvents = new HashMap<String, Set<String>>();
		}
		for (String event : events.keySet()) {
			for (String code : events.get(event)) {
				if (returndEvents.get(event) == null) {
					returndEvents.put(event, new LinkedHashSet<String>());
				}
				out += (!code.equals("") ? "\n" : "") 
							+ "CKEDITOR.on('" + event + "', " + code + ");";
				returndEvents.get(event).add(code);
				
			}
		}
		return out;
	}
	
}
