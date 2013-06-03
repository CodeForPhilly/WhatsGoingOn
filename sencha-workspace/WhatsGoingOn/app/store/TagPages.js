/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.store.TagPages', {
	extend: 'Ext.data.Store'
	,requires: [
		'WhatsGoingOn.model.TagPage'
		,'WhatsGoingOn.proxy.LocalWiki'
	]
	
	,config: {
		model: 'WhatsGoingOn.model.TagPage'
		,proxy: {
			type: 'tastypie'
			,url: '/api/page_tags'
		}
	}
});