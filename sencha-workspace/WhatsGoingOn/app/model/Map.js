/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.model.Map', {
	extend: 'Ext.data.Model'
	,requires: [
		'WhatsGoingOn.proxy.LocalWiki'
	]
	
	,config: {
		fields: [{
			name: 'id'
			,type: 'integer'
		},{
			name: 'points'
		}]
		,proxy: {
			type: 'localwiki'
			,reader: 'json'
		}
	}
});