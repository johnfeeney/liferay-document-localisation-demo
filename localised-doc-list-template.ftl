<style>
.column {
    float: left;
    margin: 10px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>

${HtmlField.getData()}

<#if DocumentsAndMediaArray.getSiblings()?has_content>
	<div class="row">
	<#list DocumentsAndMediaArray.getSiblings() as Document>
        <#assign counter = 0 >
        <#list "${Document.getData()}"?split("/") as x>
        <#if counter == 2>
        <#assign groupId = x?number >
        </#if>
        <#if counter == 5>
        <#assign uuId = x >
        </#if>
        <#assign counter = counter+1 >
        </#list>
        
        <#assign dlFileEntryService = serviceLocator.findService('com.liferay.document.library.kernel.service.DLFileEntryService') /> 
        
        <#assign file = dlFileEntryService.getFileEntryByUuidAndGroupId(uuId,groupId)  >

		<div class="column">
    		
            <div class="card-type-asset form-check form-check-card form-check-top-left file-card">
            	<div class="card">
            		<div class="aspect-ratio card-item-first">
            			<div class="custom-control custom-checkbox">
            				<label>
            					<input class="custom-control-input" type="checkbox" />
            					<span class="custom-control-label"></span>
            					<div class="aspect-ratio-item-center-middle aspect-ratio-item-fluid card-type-asset-icon">
            						<svg aria-hidden="true" class="lexicon-icon lexicon-icon-documents-and-media">
            							<use xlink:href="/images/icons/icons.svg#documents-and-media" />
            						</svg>
            					</div>
            					<span class="sticker sticker-bottom-left sticker-danger">DOC</span>
            				</label>
            			</div>
            		</div>
            		<div class="card-body">
            			<div class="card-row">
            				<div class="autofit-col autofit-col-expand">
            					<div class="card-title text-truncate" title="${file.fileName}">${file.fileName}</div>
            					<div class="card-subtitle text-truncate" title="${file.description}">${file.description}</div>
            					<div class="card-detail">
            						<span class="label label-success">
            							<span class="label-item label-item-expand">Approved</span>
            						</span>
            					</div>
            				</div>
            				<div class="autofit-col">
            					<div class="dropdown dropdown-action">
            						<a aria-expanded="false" aria-haspopup="true" class="component-action dropdown-toggle" data-toggle="dropdown" href="#1" role="button">
            							<svg aria-hidden="true" class="lexicon-icon lexicon-icon-ellipsis-v">
            								<use xlink:href="/images/icons/icons.svg#ellipsis-v" />
            							</svg>
            						</a>
            						<div class="dropdown-menu dropdown-menu-right">
            							<a class="dropdown-item" href="${Document.getData()}">Download</a>
            							<a class="dropdown-item" href="#1">Edit</a>
            							<a class="dropdown-item" href="#1">Move</a>
            							<a class="dropdown-item" href="#1">Checkout</a>
            							<a class="dropdown-item" href="#1">Permissions</a>
            							<a class="dropdown-item" href="#1">Move to Recycle Bin</a>
            						</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
	</#list>
	</div>
</#if>
