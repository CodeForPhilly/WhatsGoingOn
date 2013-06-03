/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.application({
	name: 'WhatsGoingOn'
	,requires: [
		'Ext.MessageBox'
		,'Jarvus.touch.override.app.PushPath'
		,'Jarvus.override.proxy.DirtyParams'
		,'Jarvus.override.nav.CardAnimation'
	]

	,controllers: ['Main']
	
	,viewport: {
		autoMaximize: true
	}

	,launch: function() {
		// Destroy the #appLoadingIndicator element
		Ext.fly('appLoadingIndicator').destroy();
	}

	,onUpdated: function() {
		Ext.Msg.confirm(
			"Application Update"
			,"This application has just successfully been updated to the latest version. Reload now?"
			,function(buttonId) {
				if (buttonId === 'yes') {
					window.location.reload();
				}
			}
		);
	}
});