/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.proxy.LocalWiki', {
	extend: 'Jarvus.touch.proxy.TastyPie'
	,alias: 'proxy.localwiki'

	,config: {
		baseUrl: '/localwiki'
	}
});