/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.model.TagPage', {
	extend: 'Ext.data.Model'
	
	,config: {
		fields: [{
			name: 'id'
			,type: 'integer'
		},{
			name: 'page'
			,type: 'string'
		},{
			name: 'resource_uri'
			,type: 'string'
		},{
			name: 'tags'
		}]
	}
});