<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>{block title}What&rsquo;s Going On? &mdash; Philly After-School Programs{/block}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="A database of after school programs in Philly by parents, for parents.">
		<meta name="author" content="Chris Alfano <calfano@codeforamerica.org>">

		{block css}
			{cssmin "bootstrap.css+bootstrap-responsive.css+whatsgoingon.css"}
		{/block}

		{block js}
			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
				{jsmin html5shiv.js}
			<![endif]-->
		{/block}
	</head>

	<body data-spy="scroll" data-target=".navbar">

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="brand" href="/#">What&rsquo;s Going On?</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class="active"><a href="/#about">About</a></li>
							<li><a href="/#find">Find Programs</a></li>
							<li><a href="/#share">Share Programs</a></li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</div>

		{block content-wrapper-open}<div class="container anchor-target" id="top">{/block}
		{block content}{/block}
		{block content-wrapper-close}</div>{/block}

		{block js-bottom}
			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
			{jsmin "jquery.js+bootstrap-scrollspy.js+whatsgoingon.js"}
		{/block}
	</body>
</html>