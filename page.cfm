<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="pageTitle"><mango:Page><mango:PageProperty title /></mango:Page> &bull; FusionGrokker</cfsavecontent>
<template:layout title="#pageTitle#">
	<mango:Page>
		<div class="post">
			<h1><mango:PageProperty title /></h1>
			<mango:PageProperty body />
			<mango:Event name="beforePageContentEnd" template="page" mode="full" />

			<mango:PageProperty ifcommentsallowed>

				<section id="comments">

					<h1 id="comments"><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty><mango:PostProperty ifCommentCountLT="1">s</mango:PostProperty>:</h1>

					<mango:Comments>
						<mango:Comment>
							<article id="comment-<mango:CommentProperty id />" class="comment<mango:CommentProperty ifIsAuthor> adam</mango:CommentProperty>">
								<a class="avatar" href="http://www.gravatar.com/88f83040f8ccdcaa86397c0a9bfe2518"><img src="http://www.gravatar.com/avatar/88f83040f8ccdcaa86397c0a9bfe2518?s=100" alt="Vicky Ryder" /></a>
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
							<input name="comment_post_id" value="<mango:PageProperty id />" type="hidden" />
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

			</mango:PageProperty><!-- /ifCommentsAllowed -->
		</div><!-- /post -->
	</mango:Page>
</template:layout>
