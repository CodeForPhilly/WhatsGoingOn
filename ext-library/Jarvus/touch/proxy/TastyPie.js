/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('Jarvus.touch.proxy.TastyPie', {
	extend: 'Ext.data.proxy.Ajax'
	,alias: 'proxy.tastypie'

	,config: {
		baseUrl: ''
		
		,pageParam: false
		,startParam: 'offset'
		,limitParam: 'limit'
		,extraParams: {
			format: 'json'
		}
		,reader: {
			type: 'json'
			,rootProperty: 'objects'
			,totalProperty: 'meta.total_count'
		}
	}
	
	,getUrl: function() {
		return this.getBaseUrl() + this.callParent(arguments);
	}
});