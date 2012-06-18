<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfif thisTag.executionMode eq "start">

	<cfparam name="attributes.tabs" default="true" />
	<cfparam name="attributes.sidebar" default="true" />

	<cfsavecontent variable="variables.skinurl"><mango:Blog skinurl /></cfsavecontent>
	<cfset variables.skinurl = trim(variables.skinurl) />

	<cfsavecontent variable="variables.defaultTitle"><mango:Blog title /> &bull; <mango:Blog tagline /></cfsavecontent>
	<cfparam name="attributes.title" default="#variables.defaultTitle#" />

	<cfsavecontent variable="variables.rssurl"><mango:Blog rssurl /></cfsavecontent>
	<cfset variables.rssurl = trim(variables.rssurl) />

	<cfsavecontent variable="variables.atomurl"><mango:Blog atomurl /></cfsavecontent>
	<cfset variables.atomurl = trim(variables.atomurl) />

	<cfsavecontent variable="variables.apiurl"><mango:Blog apiurl /></cfsavecontent>
	<cfset variables.apiurl = trim(variables.apiurl) />

	<cfsavecontent variable="variables.tmpsearch"><mango:Blog searchUrl /></cfsavecontent>
	<cfset variables.tmpsearch = trim(variables.tmpsearch) />

<cfoutput>
	<cfcontent reset="true" />
	<!DOCTYPE html>
	<html>
	<head>
		<title>#attributes.title#</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width; initial-scale=1.0" />
		<meta name="generator" content="Mango <mango:Blog version />" />
		<meta name="description" content="<mango:Blog description />" />
		<meta name="robots" content="index, follow">
		<link rel="stylesheet" type="text/css" href="#variables.skinurl#assets/css/styles.css" />
		<link rel="stylesheet" type="text/css" href="#variables.skinurl#assets/css/mobile.css"/>
		<link rel="stylesheet" type="text/css" href="#variables.skinurl#assets/css/prettify.css" />
		<link rel="stylesheet" type="text/css" href="#variables.skinurl#assets/shadowbox/shadowbox.css" />
		<link href='http://fonts.googleapis.com/css?family=Signika:400,700' rel='stylesheet' type='text/css'>
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="#variables.rssurl#" />
		<link rel="alternate" type="application/atom+xml" title="Atom" href="#variables.atomurl#" />
		<link rel="EditURI" type="application/rsd+xml" title="RSD" href="#variables.apiurl#" />
		<mango:Event name="beforeHtmlHeadEnd" />
	</head>

	<body id="top">
	<mango:Event name="beforeHtmlBodyStart" />

		<div id="container">
	    	<div id="header">
	        	<h1><a href="/">fusiongrokker.com</a></h1>
	            <h2>Adam Tuttle on web development and&hellip; stuff.</h2>
				<cfif attributes.sidebar>
					<div id="face"><a rel="shadowbox" title="Adam Tuttle" href="#variables.skinurl#assets/img/headshot.jpg"><img src="#variables.skinurl#assets/img/headshot_tn.jpg" width="115" height="115" /></a></div>
					<!-- fork me on github! -->
					<a href="http://github.com/atuttle" title="&lt;3 open source!"><img id="forkme" alt="Fork me on Github!" width="149" height="149" src="https://a248.e.akamai.net/camo.github.com/71eeaab9d563c2b3c590319b398dd35683265e85/687474703a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677261795f3664366436642e706e67"></a>
				</cfif>
	            <div id="nav">
	                <ul>
	                	<li><a href="<mango:Blog url />">Home</a></li>
						<cfif attributes.tabs>
							<mango:Pages><mango:Page>
								<cfsavecontent variable="variables.tmplink"><mango:PageProperty link></cfsavecontent>
								<cfset variables.tmplink = trim(variables.tmplink) />
								<cfsavecontent variable="variables.tmptitle"><mango:PageProperty title /></cfsavecontent>
								<cfset variables.tmptitle = trim(variables.tmptitle) />
								<li class="#variables.tmptitle#">
									<a href="#tmplink#" title="#variables.tmptitle#" <mango:PageProperty ifiscurrentpage>class="active"</mango:PageProperty>
									>#variables.tmptitle#</a>
								</li>
							</mango:Page></mango:Pages>
						</cfif>
	                </ul>
	            </div>

	        </div>

	        <div id="content">
				<section id="right"><cfif attributes.sidebar>

					<p class="pod">
						<form id="searchForm" method="get" action="#variables.tmpsearch#">
							<fieldset id="search">
								<label for="term">Search:</label>
								<input type="text" name="term" id="term" value="" placeholder="Search for..." title="Press return to search">
							</fieldset>
						</form>
					</p>
					<p class="pod">
						<form id="subscribeForm" method="get" action="/generic.cfm">
							<fieldset id="subscribe">
								<label for="subscribeemail">Subscribe:</label>
								<input name="email" id="subscribeemail" type="text" value="" placeholder="Your email" title="Press return to subscribe">
							</fieldset>
							<input name="event" value="scribe-subscribe" type="hidden">
						</form>
					</p>

					<!--- dynamic pods! --->
					<mangox:PodGroup locationId="sidebar" template="index">

						<mangox:TemplatePod id="archivesLink" title="Archives Link">
							<mango:Archive>
						        <p><a id="navArchivesLink" href="/page/archives">Browse older entries</a></p>
							</mango:Archive>
						</mangox:TemplatePod>

						<mangox:TemplatePod id="serviceLinks" title="Services">
							<ul id="elsewhere">
								<li id="feed"><a href="http://feeds2.feedburner.com/FusionGrokker/" title="Subscribe via RSS"></a></li>
								<li id="lastfm"><a href="http://www.last.fm/user/TuttleTree" title="My Musical Taste"></a></li>
								<li id="flickr"><a href="http://flickr.com/photos/tuttletree" title="My Photos"></a></li>
								<li id="delicious"><a href="http://delicious.com/fusiongrokker" title="My Shared Links"></a></li>
								<li id="twitter"><a href="http://twitter.com/AdamTuttle" title="Follow me on Twitter"></a></li>
								<li id="gplus"><a href="https://plus.google.com/u/0/101395374163833780485/posts" title="Me on Google Plus"></a></li>
							</ul>
						</mangox:TemplatePod>

						<!--- output all the pods, including the ones added by plugins --->
						<mangox:Pods>
							<mangox:Pod>
								<mangox:PodProperty content />
							</mangox:Pod>
						</mangox:Pods>
					</mangox:PodGroup>

					<p><hr/></p>
					<p>
						<a href="http://www.adobe.com/communities/professionals/" title="Adobe Community Professional"><img src="#variables.skinurl#assets/img/community_professional_badge.png" alt="Adobe Community Professional" width="200" height="63" /></a>
					</p>
					<p>
						<a href="http://www.cfobjective.com/" title="I'm speaking at cfObjective 2012!"><img border="0" height="125" width="125" alt="I'm speaking at cfObjective 2012!" src="http://www.cfobjective.com/cfo/assets/Image/badges/2012/CFObjective_speaker_125x125.gif" /></a>
					</p>
					<p>
						<a href="http://codebassradio.net/" title="I DJ weekly (Tuesdays at 4:00 Eastern) on CodeBass Radio"><img border="0" alt="I DJ weekly (Tuesdays at 4:00 Eastern) on CodeBass Radio" src="#variables.skinurl#assets/img/cbr125x125.png" width="125" height="125" /></a>
					</p>
					<!---
					--->
					<p>
						<a href="http://phillymerge.com" title="Philly Merge: A conference for Developer-Entrepreneurs and Entrepreneur-Developers"><img border="0" alt="Philly Merge: A conference for Developer-Entrepreneurs and Entrepreneur-Developers" src="#variables.skinurl#assets/img/philly_merge.png" width="200" height="128" /></a>
					</p>
					<p>
						<a href="http://github.com/atuttle/Taffy" title="Taffy: A ColdFusion Framework for creating REST web services"><img border="0" alt="Taffy: A ColdFusion Framework for creating REST web services" src="#variables.skinurl#assets/img/Taffy.png" width="200" height="200" /></a>
					</p>
				</cfif></section>

	        	<section id="left">
</cfoutput>
<cfelse>
				</section><!-- /left -->
	        </div><!-- /content -->
	        <div id="footer">
	            <h3>Copyright &copy; <cfoutput>#year(now())#</cfoutput> Adam Tuttle. Please do not use my content without permission.</h3>
	        </div>
	    </div>

		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<cfoutput><script type="text/javascript" src="#variables.skinurl#assets/js/_combined.js"></script></cfoutput>
		<mango:Event name="beforeHtmlBodyEnd" />
	</body>
	</html>
</cfif>