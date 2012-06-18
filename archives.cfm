<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>
	<mango:Archive pageSize="5">

		<mango:ArchiveProperty ifIsType="category"><h1 class="archive_head">Entries Tagged as <span class="green"><mango:ArchiveProperty title /></span></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="month"><h1 class="archive_head">Entries for month: <span class="green"><mango:ArchiveProperty title dateformat="mmmm yyyy"  /></span></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="day"><h1 class="archive_head">Entries for day: <span class="green"><mango:ArchiveProperty title dateformat="dd mmmm yyyy" /></span></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="year"><h1 class="archive_head">Entries for year: <span class="green"><mango:ArchiveProperty title dateformat="yyyy" /></span></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="search"><h1 class="archive_head">Search Results for <span class="green"><mango:ArchiveProperty title format="escapedHtml" /></span></h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="author"><h1 class="archive_head">Entries by '<mango:ArchiveProperty title />'</h1></mango:ArchiveProperty>
		<mango:ArchiveProperty ifIsType="unknown"><h1 class="archive_head">No archives</h1></mango:ArchiveProperty>

		<mango:Posts count="5">
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

		<mango:Archive pageSize="5">
            <div id="archiveNav">
                <mango:ArchiveProperty ifHasNextPage>
                	<div class="previous"><a href="<mango:ArchiveProperty link pageDifference='1' />">&larr; Older Entries</a></div>
                </mango:ArchiveProperty>
                <mango:ArchiveProperty ifHasPreviousPage>
                	<div class="next"><a href="<mango:ArchiveProperty link pageDifference='-1' />">Newer Entries &rarr;</a></div>
                </mango:ArchiveProperty>
            </div>
		</mango:Archive>

	</mango:Archive>
</template:layout>
