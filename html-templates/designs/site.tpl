<!DOCTYPE HTML>
<html lang="en">
    <head>
	    <meta charset="utf-8">
	    <title>{block title}What's Going On?{/block}</title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="A campaign to collect and organize a searchable database of activities available for Philadelphia students">

		{*
		<!-- Favicon -->
	    <link rel="shortcut icon" href="/img/favicon.ico">
		*}

		{block css}
		    <!-- Styles -->
			{cssmin bootstrap.css+style.css+fontello.css+bootstrap-responsive.css}
		    <!--[if lt IE 7]>
		            <link href="/css/fontello-ie7.css" type="text/css" rel="stylesheet">  
		        <![endif]-->
		    <style>
		    body {
		        padding-top: 77px; /* 60px to make the container go all the way to the bottom of the topbar */
		    }
		    </style>
		{/block}

		{block fonts}
		    <!-- Google Web fonts -->
		    <link href='http://fonts.googleapis.com/css?family=Quattrocento:400,700' rel='stylesheet' type='text/css'>
		    <link href='http://fonts.googleapis.com/css?family=Patua+One' rel='stylesheet' type='text/css'>
		    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		{/block}

		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		{block js}
			{jsmin "jquery.js+jquery.scrollTo-1.4.2-min.js+jquery.localscroll-1.2.7-min.js"}
		{/block}
    </head>
    <body>

		{block "nav"}
			<!--******************** NAVBAR ********************-->
			<div class="navbar-wrapper">
			  <div class="navbar navbar-inverse navbar-fixed-top">
			    <div class="navbar-inner">
			      <div class="container">
			        <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
			        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
			        <h1 class="brand"><a href="/#top">What's Going On!</a></h1>
			        <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
			        <nav class="pull-right nav-collapse collapse">
			          <ul id="menu-main" class="nav">
			            <li><a title="Submit a Program" href="/#contact">Submit a Program</a></li>
			            <li><a title="Launch" href="/mobile" target="_blank">Mobile Program Browser</a></li>
			            <li><a title="Launch" href="http://beta.wikidelphia.org/After-school_Programs" target="_blank">The Wiki</a></li>
			          </ul>
			        </nav>
			      </div>
			      <!-- /.container -->
			    </div>
			    <!-- /.navbar-inner -->
			  </div>
			  <!-- /.navbar -->
			</div>
			<!-- /.navbar-wrapper -->
		{/block}

	    <div id="top"></div>

	    {block "content"}{/block}
	
		{block footer}
		    <div class="footer-wrapper">
		      <div class="container">
		        <footer>
		          <small>A <a href="http://codeforphilly.org/projects/What-s_Going_On">Code for Philly project</a></small>
		        </footer>
		      </div>
		      <!-- ./container -->
		    </div>
		{/block}

		{block js-bottom}
		    <!-- Loading the javaScript at the end of the page -->
			{jsmin "bootstrap.js+site.js"}
		{/block}

		{block js-analytics}
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
		{/block}
    </body>
</html>