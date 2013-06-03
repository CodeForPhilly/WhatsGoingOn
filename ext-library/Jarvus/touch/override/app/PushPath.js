/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/

/**
 * Provides {@link #method-pushPath} for controllers
 */
Ext.define('Jarvus.touch.override.app.PushPath', {
	override: 'Ext.app.Controller'
	,requires: [
		'Ext.app.Action'
		,'Jarvus.touch.override.app.EncodedPaths'
	],
	
	/**
	 * Silently push a given path to the address bar without triggering a routing event.
	 * This is useful to call after a user has _already_ entered a UI state and the current address
	 * _may_ need to be synchronized. If the given path was already in the address bar this method
	 * has no effect.
	 * 
	 * @param {String/String[]/Ext.data.Model} url The url path to push 
	 */
	pushPath: function(url) {
		var app = this.getApplication();
		
		if(Ext.isArray(url)) {
			url = Ext.Array.map(url, app.encodeRouteComponent).join('/');
		}
		else if(Ext.data && Ext.data.Model && url instanceof Ext.data.Model) {
			url = url.toUrl();
		}
		
		app.getHistory().add(Ext.create('Ext.app.Action', {url: url}), true);
	}
	
	/**
	 * @deprecated
	 */
	,pushUrl: function(url) {
		console.warn('app.pushUrl is deprecated, use Controller.pushPath instead');
		this.pushPath(url);
	}
});