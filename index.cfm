<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>
		<mango:Posts count="3">
			<mango:Post>
				<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
				<div class="post" id="post-<mango:PostProperty id />">
					<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
					<mango:PostProperty ifhasExcerpt excerpt>
						<div class="previous"><a href="<mango:PostProperty link />" title="Read the rest of this entry">Read more &rarr;</a></div>
					</mango:PostProperty>
					<mango:PostProperty ifNotHasExcerpt body />
					<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
					<p class="date">
						<span>
							in
							<mango:Categories>
								<mango:Category>
									<a href="<mango:CategoryProperty link />" title="View all posts in: <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> |
								</mango:Category>
							</mango:Categories>

							<a href="<mango:PostProperty link />#comments" title="Comments for: <mango:PostProperty title />"
							><mango:PostProperty ifCommentCountGT="0">
								<mango:PostProperty commentCount /> Response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty>
							</mango:PostProperty>
							<mango:PostProperty ifCommentCountLT="1">No Responses Yet</mango:PostProperty>
							</a>
						</span>
						Posted <cfoutput>#variables.postDate#</cfoutput>
					</p>
	            </div><!-- /post -->
			</mango:Post>
		</mango:Posts>
		<mango:Archive pageSize="3">
            <div id="archiveNav">
                <mango:ArchiveProperty ifHasNextPage>
                	<div class="previous"><a href="<mango:ArchiveProperty link pageDifference='1' />">&larr; Older Entries</a></div>
                </mango:ArchiveProperty>
            </div>
		</mango:Archive>
</template:layout>