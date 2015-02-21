/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global Ext*/
Ext.define('WhatsGoingOn.view.Main', {
	extend: 'Ext.navigation.View'
	,xtype: 'mainview'
	,requires: [
		'Ext.Button'
		,'Ext.field.Select'
	]

	,config: {
		items: [{
			xtype: 'formpanel'
			,title: 'Search Programs'
			
			,items: [{
				xtype: 'component'
				,styleHtmlContent: true
				,html: 'Search WikiDelphia for after-school programs'
			},{
				xtype: 'selectfield'
				,name: 'ageGroup'
				,label: 'Age'
				,options: [
					{ text: 'Any', value: null }
					,{ text: 'High school', value: 'afterschoolprogramhighschool' }
					,{ text: 'Middle school', value: 'afterschoolprogrammiddleschool' }
					,{ text: 'Elementary school', value: 'afterschoolprogramelementaryschool' }
				]
			},{
				xtype: 'selectfield'
				,name: 'season'
				,label: 'Season'
				,options: [
					{ text: 'Any', value: null }
					,{ text: 'Summer', value: 'afterschoolprogramsummer' }
					,{ text: 'School-year', value: 'afterschoolprogramschoolyear' }
					,{ text: 'Year-round', value: 'afterschoolprogramyearround' }
				]
			},{
				xtype: 'selectfield'
				,name: 'subject'
				,label: 'Subject'
				,options: [
					{ text: 'Any', value: null }
					,{ text: 'Art', value: 'afterschoolprogramart' }
					,{ text: 'Athletics', value: 'afterschoolprogramathletics' }
					,{ text: 'Writing', value: 'afterschoolprogramwriting' }
					,{ text: 'Reading', value: 'afterschoolprogramreading' }
					,{ text: 'Science', value: 'afterschoolprogramscience' }
					,{ text: 'Technology', value: 'afterschoolprogramtechnology' }
					,{ text: 'Engineering', value: 'afterschoolprogramengineering' }
					,{ text: 'Math', value: 'afterschoolprogrammath' }
				]
			},{
				xtype: 'button'
				,text: 'Search'
				,ui: 'action'
				,action: 'search'
			}]
		}]
	}
});