/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.view.PageView', {
	extend: 'Ext.Container'
	,xtype: 'pageview'

	,config: {
		page: null
		
		,title: 'Page'
		,scrollable: 'both'
		,items: {
			xtype: 'component'
			,itemId: 'body'
			,styleHtmlContent: true
			,width: '100vw'
			,tpl: [
				'<h1>{name}</h1>'
				,'{content}'
			]
		}
	}
	
	,updatePage: function(page) {
		this.down('#body').setData(page.getData());
	}
});