/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.view.ResultsView', {
	extend: 'Ext.Container'
	,xtype: 'resultsview'
	,requires: [
		'WhatsGoingOn.view.ResultsList'
		,'Ext.Map'
	]

	,config: {
		title: 'Results'
		,layout: 'vbox'
		,items: [{
			xtype: 'map'
			,flex: 2
//			,useCurrentLocation: true
			,masked: {
				xtype: 'mask'
			}
			,mapOptions: {
				zoom: 13
				// doesn't work, see: http://www.sencha.com/forum/showthread.php?265033-Ext.Map-forces-center-to-Palo-Alto&p=971080#post971080
//				,center: { latitude: 39.9529, longitude: -75.1602 }
//				,zoomControl: false
//				,panControl: false
//				,rotateControl: false
//				,streetViewControl: false
//				,mapTypeControl: false
			}
		},{
			xtype: 'resultslist'
			,flex: 3
		}]
	}
});