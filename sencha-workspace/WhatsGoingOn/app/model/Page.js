/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.model.Page', {
	extend: 'Ext.data.Model'
	,requires: [
		'WhatsGoingOn.proxy.LocalWiki'
	]
	
	,config: {
		idProperty: 'uriSlug'
		,fields: [{
			name: 'id'
			,type: 'integer'
		},{
			name: 'name'
			,type: 'string'
		},{
			name: 'resource_uri'
			,type: 'string'
		},{
			name: 'slug'
			,type: 'string'
		},{
			name: 'page_tags'
			,type: 'string'
		},{
			name: 'map'
			,type: 'string'
		},{
			name: 'content'
			,type: 'string'
		},{
			name: 'uriSlug'
			,convert: function(v, r) {
				var matches = r.get('resource_uri').match(/^\/api\/page\/(.*)$/);
				
				return matches[1]||null;
			}
		}]
		,proxy: {
			type: 'localwiki'
			,reader: 'json'
		}
	}
});