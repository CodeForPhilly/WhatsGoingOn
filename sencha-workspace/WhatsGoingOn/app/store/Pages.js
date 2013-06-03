/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.store.Pages', {
	extend: 'Ext.data.Store'
	,requires: [
		'WhatsGoingOn.model.Page'
		,'WhatsGoingOn.proxy.LocalWiki'
	]
	
	,config: {
		model: 'WhatsGoingOn.model.Page'
		,proxy: {
			type: 'localwiki'
			,url: '/api/page'
		}
	}
});