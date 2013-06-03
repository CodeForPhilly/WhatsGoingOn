<!DOCTYPE HTML>
<html {if $mode=='production'}manifest="/app/{$App->getName()}/cache.appcache"{/if} lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>{if $title}{$title}{else}{$App->getName()}-{$mode}{/if}</title>
	{if $mode == 'production'}
		<base href="/app/{$App->getName()}/build/{$mode}/">
	{/if}
	<style type="text/css">
		html, body {
			height: 100%;
			background-color: #1985D0;
		}

		#appLoadingIndicator {
			position: absolute;
			top: 50%;
			margin-top: -15px;
			text-align: center;
			width: 100%;
			height: 30px;
			-webkit-animation-name: appLoadingIndicator;
			-webkit-animation-duration: 0.5s;
			-webkit-animation-iteration-count: infinite;
			-webkit-animation-direction: linear;
		}

		#appLoadingIndicator > * {
			background-color: #FFFFFF;
			display: inline-block;
			height: 30px;
			-webkit-border-radius: 15px;
			margin: 0 5px;
			width: 30px;
			opacity: 0.8;
		}

		@-webkit-keyframes appLoadingIndicator{
			0% {
				opacity: 0.8
			}
			50% {
				opacity: 0
			}
			100% {
				opacity: 0.8
			}
		}
	</style>

	{if $mode == 'production'}
		<script type="text/javascript">
			{* This is a modified version of the sencha bootstrapper that supports the page having an existing <base> *}
			{literal}
				(function(i){function s(a){function b(a,j){var c=a.length,b,g;for(b=0;b<c;b++){g=a[b];var e=a,K=b,d=void 0;"string"==typeof g&&(g={path:g});g.shared?(g.version=g.shared,d=g.shared+g.path):(A.href=g.path,d=A.href);g.uri=d;g.key=h+"-"+d;f[d]=g;e[K]=g;g.type=j;g.index=b;g.collection=a;g.ready=!1;g.evaluated=!1}return a}var c;"string"==typeof a?(c=a,a=B(c)):c=JSON.stringify(a);var h=a.id,e=h+"-"+C+o,f={};this.key=e;this.css=b(a.css,"css");this.js=b(a.js,"js");this.assets=this.css.concat(this.js);this.getAsset=
				function(a){return f[a]};this.store=function(){t(e,c)}}function v(a,b){k.write('<meta name="'+a+'" content="'+b+'">')}function p(a,b,c){var h=new XMLHttpRequest,c=c||D,a=a+(-1==a.indexOf("?")?"?":"&")+Date.now();try{h.open("GET",a,!0),h.onreadystatechange=function(){if(4==h.readyState){var a=h.status,d=h.responseText;200<=a&&300>a||304==a||0==a&&0<d.length?b(d):c()}},h.send(null)}catch(d){c()}}function L(a,b){var c=k.createElement("iframe");m.push({iframe:c,callback:b});c.src=a+".html";c.style.cssText=
				"width:0;height:0;border:0;position:absolute;z-index:-999;visibility:hidden";k.body.appendChild(c)}function E(a,b,c){var d=!!a.shared;if(a.remote)b("");else{if(!d)var e=b,f=a.version,l,b=function(j){l=j.substring(0,f.length+4);l!=="/*"+f+"*/"?confirm("Requested: '"+a.uri+"' with checksum: "+f+" but received: "+l.substring(2,f.length)+"instead. Attempt to refresh the application?")&&M():e(j)};(d?L:p)(a.uri,b,c)}}function F(a){var b=a.data,a=a.source.window,c,d,e,f;c=0;for(d=m.length;c<d;c++)if(e=m[c],
				f=e.iframe,f.contentWindow===a){e.callback(b);k.body.removeChild(f);m.splice(c,1);break}}function G(a){"undefined"!=typeof console&&(console.error||console.log).call(console,a)}function t(a,b){try{n.setItem(a,b)}catch(c){if(c.code==c.QUOTA_EXCEEDED_ERR&&q){var d=q.assets.map(function(a){return a.key}),e=0,f=n.length,l=!1,j;for(d.push(q.key);e<=f-1;)j=n.key(e),-1==d.indexOf(j)?(n.removeItem(j),l=!0,f--):e++;l&&t(a,b)}}}function u(a){try{return n.getItem(a)}catch(d){return null}}function M(){H||(H=
				!0,p(o,function(a){(new s(a)).store();i.location.reload()}))}function w(a){function b(a,d){var b=a.collection,g=a.index,f=b.length,e;a.ready=!0;a.content=d;for(e=g-1;0<=e;e--)if(a=b[e],!a.ready||!a.evaluated)return;for(e=g;e<f;e++)if(a=b[e],a.ready)a.evaluated||c(a);else break}function c(a){a.evaluated=!0;if("js"==a.type)try{eval(a.content)}catch(b){G("Error evaluating "+a.uri+" with message: "+b)}else{var d=k.createElement("style"),c,ch='';d.type="text/css";d.textContent=a.content;"id"in a&&(d.id=a.id);
				"disabled"in a&&(d.disabled=a.disabled);c=document.querySelector("base");c?ch=c.href:c=document.createElement("base");c.href=ch+a.path.replace(/\/[^\/]*$/,"/");x.appendChild(c);x.appendChild(d);ch?c.href=ch:x.removeChild(c)}delete a.content;0==--f&&h()}function h(){function b(){k&&c()}function c(){var a=r.onUpdated||D;if("onSetup"in r)r.onSetup(a);else a()}function e(){l.store();h.forEach(function(a){t(a.key,a.content)});c()}function g(a,b){a.content=b;0==--m&&(d.status==d.IDLE?e():i=e)}function f(){I("online",f,!1);p(o,function(c){q=l=new s(c);var e;l.assets.forEach(function(b){e=
				a.getAsset(b.uri);(!e||b.version!==e.version)&&h.push(b)});m=h.length;0==m?d.status==d.IDLE?b():i=b:h.forEach(function(b){function d(){E(b,function(a){g(b,a)})}var c=a.getAsset(b.uri),e=b.path,f=b.update;!c||!f||null===u(b.key)||"delta"!=f?d():p("deltas/"+e+"/"+c.version+".json",function(a){try{var d=b,c;var e=u(b.key),f=B(a),a=[],h,j,i;if(0===f.length)c=e;else{j=0;for(i=f.length;j<i;j++)h=f[j],"number"===typeof h?a.push(e.substring(h,h+f[++j])):a.push(h);c=a.join("")}g(d,c)}catch(k){G("Malformed delta content received for "+
				b.uri)}},d)})})}var h=[],k=!1,i=function(){},n=function(){d.swapCache();k=!0;i()},m;I("message",F,!1);if(d.status==d.UPDATEREADY)n();else if(d.status==d.CHECKING||d.status==d.DOWNLOADING)d.onupdateready=n,d.onnoupdate=d.onobsolete=function(){i()};!1!==navigator.onLine?f():y("online",f,!1)}var e=a.assets,f=e.length,l;q=a;y("message",F,!1);0==f?h():e.forEach(function(a){var c=u(a.key);null===c?E(a,function(c){a.remote||t(a.key,c);b(a,c)},function(){b(a,"")}):b(a,c)})}function J(a){null!==k.readyState.match(/interactive|complete|loaded/)?
				w(a):y("DOMContentLoaded",function(){navigator.standalone?setTimeout(function(){setTimeout(function(){w(a)},1)},1):w(a)},!1)}var D=function(){},m=[],k=i.document,x=k.head,y=i.addEventListener,I=i.removeEventListener,n=i.localStorage,d=i.applicationCache,B=JSON.parse,A=k.createElement("a"),z=k.location,C=z.origin+z.pathname+z.search,o="app.json",H=!1,q;if("undefined"===typeof r)var r=i.Ext={};r.blink=function(a){var b=u(a.id+"-"+C+o);v("viewport","width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no");
				v("apple-mobile-web-app-capable","yes");v("apple-touch-fullscreen","yes");b?(a=new s(b),J(a)):p(o,function(b){a=new s(b);a.store();J(a)})}})(this);
			{/literal}

			Ext.blink({ "id":"{$App->getAppId()}" })
		</script>
	{/if}
</head>
<body>
	<div id="appLoadingIndicator">
		<div></div>
		<div></div>
		<div></div>
	</div>

	{if $mode != 'production'}
		{if !$App->getAsset('build/production/resources/css/app.css')}
			<link rel="stylesheet" href="{$App->getVersionedPath('sdk/resources/css/sencha-touch.css')}">
		{else}
			<link rel="stylesheet" href="{$App->getVersionedPath('build/production/resources/css/app.css')}">
		{/if}
	
		{if $mode == 'development' || !$App->getAsset('build/production/app.js')}
			{capture assign=frameworkPath}sdk/sencha-touch{tif $.get.frameworkBuild!=core ? '-all'}{tif $mode == 'development' && $.get.frameworkBuild != allmin ? '-debug'}.js{/capture}
			<script type="text/javascript" src="{$App->getVersionedPath($frameworkPath)}"></script>
			<script type="text/javascript">
				Ext.Loader.setPath({
					'Ext': 'sdk/src'
					,'Jarvus': 'x/Jarvus'
				});
			</script>
	
			{sencha_preloader}
			
			<script type="text/javascript" src="{$App->getVersionedPath('app.js')}"></script>
		{else}
			<script type="text/javascript" src="{$App->getVersionedPath('build/production/app.js')}"></script>
		{/if}
	{/if}

    {* Google Maps API *}
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>

	{* Clicky Analytics *}
	<script type="text/javascript">
	var clicky_site_ids = clicky_site_ids || [];
	clicky_site_ids.push(100620193);
	(function() {
	  var s = document.createElement('script');
	  s.type = 'text/javascript';
	  s.async = true;
	  s.src = '//static.getclicky.com/js';
	  ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
	})();
	</script>
	<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100620193ns.gif" /></p></noscript>
</body>
</html>