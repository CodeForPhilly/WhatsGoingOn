/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.view.ResultsList', {
	extend: 'Ext.dataview.List'
	,xtype: 'resultslist'
	,requires: [
		'WhatsGoingOn.store.Pages'
		,'Ext.plugin.ListPaging'
	]

	,config: {
		emptyText: '<p>No results found.</p><p>Try going back and adjusting your search parameters.</p>'
		,itemTpl: '{name}'
		,onItemDisclosure: true
		,store: {
			xclass: 'WhatsGoingOn.store.Pages'
		}
		,plugins: [{
			xclass: 'Ext.plugin.ListPaging'
			,autoPaging: true
		}]
	}
});