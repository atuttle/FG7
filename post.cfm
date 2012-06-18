<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="pageTitle"><mango:Post><mango:PostProperty title /></mango:Post> &bull; FusionGrokker</cfsavecontent>
<template:layout title="#pageTitle#">
	<mango:Post>
		<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
		<div class="post" id="post-<mango:PostProperty id />">
			<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
			<mango:PostProperty body />
			<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />

			<p class="date">
				<span>
					in
					<mango:Categories>
						<mango:Category>
							<a href="<mango:CategoryProperty link />" title="View all posts in: <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> <mango:Category ifCurrentIsNotLast>|</mango:Category>
						</mango:Category>
					</mango:Categories>
				</span>
				Posted <cfoutput>#variables.postDate#</cfoutput>
			</p>

			<mango:PostProperty ifcommentsallowed>

				<section id="comments">

					<h1><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty><mango:PostProperty ifCommentCountLT="1">s</mango:PostProperty>:</h1>

					<mango:Comments>
						<mango:Comment>
							<cfsavecontent variable="tmpEmail"><mango:CommentProperty email /></cfsavecontent>
							<cfset variables.tmpEmail = lcase(hash(lcase(trim(variables.tmpEmail)))) />
							<article id="comment-<mango:CommentProperty id />" class="comment<mango:CommentProperty ifIsAuthor> adam</mango:CommentProperty>">
								<a class="avatar" href="<mango:CommentProperty url />">
									<mangox:Gravatar size="100" />
								</a>
								<section class="wrapper">
									<div class="timestamp">
										<mango:CommentProperty ifhasurl>
											<a href="<mango:CommentProperty url />" rel="external follow"><mango:CommentProperty name /></a>
										</mango:CommentProperty>
										<mango:CommentProperty ifNotHasUrl>
											<mango:CommentProperty name />
										</mango:CommentProperty>
										<mango:CommentProperty date dateformat="yyyy-mm-dd" />
										<mango:CommentProperty time />
										<a href="#comment-<mango:CommentProperty id />" title="Link to this comment">#</a>
									</div>
									<div class="body">
										<mango:CommentProperty content />
									</div>
								</section>
							</article>
						</mango:Comment>
					</mango:Comments>

					<article id="respond">
						<h2>Leave a comment:</h2>
						<form method="post" action="#respond">
							<input name="action" value="addComment" type="hidden" />
							<input name="comment_post_id" value="<mango:PostProperty id />" type="hidden" />
							<input name="comment_parent" value="" type="hidden" />
							<mango:Message ifMessageExists type="comment" status="error">
								<p class="error">There was a problem: <mango:Message text /></p>
							</mango:Message>
							<mango:Message ifMessageExists type="comment" status="success">
								<p class="message"><mango:Message text /></p>
							</mango:Message>
							<mango:AuthenticatedAuthor ifIsLoggedIn>
								<p>You are logged in as <strong><mango:AuthorProperty name /></strong></p>
								<input type="hidden" name="comment_name" value="<mango:AuthorProperty name />" />
								<input type="hidden" name="comment_email" value="<mango:AuthorProperty email />" />
								<input type="hidden" name="comment_website" value="<mango:Blog url />" />
							</mango:AuthenticatedAuthor>
							<mango:AuthenticatedAuthor ifNotIsLoggedIn>
								<p id="gravatar_preview"></p>
								<p><input name="comment_name" value="" size="50" type="text" placeholder="Name (required)" /></p>
								<p><input name="comment_email" value="" size="50" type="email" placeholder="Email (required, not published)" /></p>
								<p><input name="comment_website" value="" size="50" type="url" placeholder="Website" /></p>
							</mango:AuthenticatedAuthor>
							<p><textarea name="comment_content" class="resizable" cols="50" rows="10" placeholder="Your Comment"></textarea></p>
							<p><label><input id="subscribe" name="comment_subscribe" value="1" type="checkbox"> Email me when others comment</label></p>
							<p class="extra"><mango:Event name="beforeCommentFormEnd" /></p>
							<p><input name="submit" value="Submit Comment" type="submit"></p>
						</form>
					</article>

			</mango:PostProperty><!-- /ifCommentsAllowed -->
		</div><!-- /post -->
	</mango:Post>
</template:layout>
