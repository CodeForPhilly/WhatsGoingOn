/*jslint browser: true, undef: true, white: false, laxbreak: true *//*global google,Ext,WhatsGoingOn*/
Ext.define('WhatsGoingOn.controller.Main', {
	extend: 'Ext.app.Controller'
	
	,config: {
		views: [
			'Main'
			,'ResultsView'
			,'PageView'
		]
		,models: [
			'Map'
			,'Page'
		]
		
		,routes: {
			'home': 'showHome'
			,'search/:params': {
				action: 'showSearch'
				,conditions: {
					':params': '.*'
				}
			}
			,'page/:slug': {
				action: 'showPage'
				,conditions: {
					':slug': '.*'
				}
			}
		}

		,refs: {
			mainView: {
				selector: 'mainview'
				,autoCreate: true
				
				,xtype: 'mainview'
			}
			,searchForm: 'mainview formpanel'
			,resultsView: {
				selector: 'resultsview'
				,autoCreate: true
				
				,xtype: 'resultsview'
			}
			,resultsList: 'resultslist'
			,resultsMap: 'resultsview map'
			,pageView: {
				selector: 'pageview'
				,autoCreate: true
				
				,xtype: 'pageview'
			}
		}
		
		,control: {
			mainView:{
				activeitemchange: 'onMainViewChange'
			}
			,resultsView: {
				enterscreen: 'onResultsViewEnterScreen'
			}
			,resultsList: {
				select: 'onResultsListSelect'
				,disclose: 'onResultsListDisclose'
			}
			,'button[action=search]': {
				tap: 'onSearchBtnTap'
			}
		}
	}
	
	
	// controller template methods
	,init: function() {
		if(!location.hash) {
			location.hash = 'home';
		}
	}
	
	,launch: function() {
		Ext.Viewport.add(this.getMainView());
	}
	
	
	// route handlers
	,showHome: function() {
		this.getMainView().pop(this.getSearchForm());
	}
	
	,showSearch: function(params) {
		var me = this
			,mainView = me.getMainView()
			,resultsView = me.getResultsView()
			,store = me.getResultsList().getStore()
			,proxy = store.getProxy();
		
		params = Ext.Array.clean(me.decodeRouteComponent(params).split(/\s/));

		proxy.setExtraParam('page_tags__tags__slug', params.length ? params : 'afterschoolprogram');

		if(mainView.getActiveItem() == resultsView) {
			if(proxy.isExtraParamsDirty()) {
				store.load();
			}
		}
		else if(!mainView.pop(resultsView)) {
			mainView.push(resultsView);
		}
	}
	
	,showPage: function(slug) {
		var me = this
			,resultsList = me.getResultsList()
			,loadedPageRecord = resultsList && resultsList.getStore().getById(slug)
			,doShowPage = function(pageRecord) {
				var mainView = me.getMainView()
					,pageView = me.getPageView();
					
				pageView.setPage(pageRecord);
				
				if(mainView.getActiveItem() !== pageView) {
					mainView.push(pageView);
				}
			};
		
		if(loadedPageRecord) {
			doShowPage(loadedPageRecord);
		}
		else {
			Ext.Viewport.setMasked({
				xtype: 'loadmask'
				,message: 'Loading page&hellip;'
			});
			
			WhatsGoingOn.model.Page.load(null, {
				url: '/api/page/' + slug
				,success: function(record) {
					Ext.Viewport.setMasked(false);
					doShowPage(record);
				}
			});
		}
	}
	
	
	// event handlers
	,onMainViewChange: function(mainView, newCard, oldCard) {
		// overwrite URL if arriving from another card
		if(newCard === this.getSearchForm()) {
			this.pushPath('home');
		}
	}
	
	,onResultsViewEnterScreen: function(resultsView) {
		var store = this.getResultsList().getStore()
			,proxy = store.getProxy();
			
		this.getResultsMap().setMapCenter(new google.maps.LatLng(39.9529, -75.1602)); //Philly
			
		if((!store.isLoaded() && !store.isLoading()) || proxy.isExtraParamsDirty()) {
			store.load();
		}
	}
	
	,onSearchBtnTap: function() {
		var tags = Ext.Object.getValues(this.getSearchForm().getValues());
		this.redirectTo(['search', Ext.Array.clean(tags).join(' ')]);
	}
	
	,onResultsListSelect: function(resultsList, record) {
		var resultsMap = this.getResultsMap()
			,gMap = resultsMap.getMap()
			,markers = resultsMap.markers = resultsMap.markers || []
			,mapUrl = record.get('map');
		
		// clear map
		while(markers.length) {
			markers.pop().setMap(null);
		}
		
		if(!mapUrl) {
			resultsMap.setMasked({xtype: 'mask'});
			return;
		}
		
		resultsMap.setMasked({xtype: 'loadmask', message: 'Loading&hellip;'});
		
		WhatsGoingOn.model.Map.load(null, {
			url: mapUrl
			,success: function(mapRecord) {
				resultsMap.setMasked(false);
				var points = mapRecord.get('points')
					,pointsCoords = (points && points.coordinates) || []
					,i = 0, coords, gLatLng;

				for(; i < pointsCoords.length; i++) {
					coords = pointsCoords[i];
					gLatLng = new google.maps.LatLng(coords[1], coords[0]);
					markers.push(new google.maps.Marker({
						map: gMap
						,position: gLatLng
					}));
					gMap.panTo(gLatLng);
				}
			}
		});
	}
	
	,onResultsListDisclose: function(resultsList, record) {
		this.redirectTo(record);
	}
});