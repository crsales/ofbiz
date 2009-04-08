<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#macro renderSectionBegin></#macro>
<#macro renderSectionEnd>
</#macro>
<#macro renderContainerBegin id style autoUpdateLink autoUpdateInterval>
<#if autoUpdateLink?has_content>
<script type="text/javascript">ajaxUpdateAreaPeriodic('${id}', '${autoUpdateLink}', '', '${autoUpdateInterval}');</script>
</#if>
<div<#if id?has_content> id="${id}"</#if><#if style?has_content> class="${style}"</#if>>
</#macro>
<#macro renderContainerEnd></div></#macro>
<#macro renderContentBegin editRequest enableEditValue editContainerStyle><#if editRequest?has_content && enableEditValue><div class=${editContainerStyle}></#if></#macro>
<#macro renderContentBody></#macro>
<#macro renderContentEnd urlString editMode editContainerStyle editRequest enableEditValue>
<#if editRequest?exists && enableEditValue>
<#if urlString?exists><a href="${urlString}">${editMode}</a><#rt/></#if>
<#if editContainerStyle?exists></div><#rt/></#if>
</#if>
</#macro>
<#macro renderSubContentBegin editContainerStyle editRequest enableEditValue><#if editRequest?exists && enableEditValue><div class="${editContainerStyle}"></#if></#macro>
<#macro renderSubContentBody></#macro>
<#macro renderSubContentEnd>
<#if editRequest?exists && enableEditValue>
<#if urlString?exists><a href="${urlString}">${editMode}</a><#rt/></#if>
<#if editContainerStyle?exists></div><#rt/></#if>
</#if>
</#macro>

<#macro renderHorizontalSeparator id style><hr<#if id?has_content> id="${id}"</#if><#if style?has_content> class="${style}"</#if>/></#macro>
<#macro renderLabel text id style><#if text?exists><#if id?has_content || style?has_content><span<#if id?has_content> id="${id}"</#if><#if style?has_content> class="${style}"</#if>></#if>${text}<#if id?has_content || style?has_content></span></#if></#if></#macro>
<#macro renderLink parameterList targetWindow target uniqueItemName linkType actionUrl id style name linkUrl text imgStr>
<#if "hidden-form" == linkType>
<form method="post" action="${actionUrl}" <#if targetWindow?has_content>target="${targetWindow}"</#if> onSubmit="javascript:submitFormDisableSubmits(this)" name="${uniqueItemName}"><#rt/>
<#list parameterList as parameter>
<input name="${parameter.name}" value="${parameter.value}" type="hidden"/><#rt/>
</#list>
</form><#rt/>
</#if>
<a <#if id?has_content>id="${id}"</#if> <#if style?has_content>class="${style}"</#if> <#if name?has_content>name="${name}"</#if> <#if targetWindow?has_content>target="${targetWindow}"</#if> href="<#if "hidden-form"==linkType>javascript:document.${uniqueItemName}.submit()<#else>${linkUrl}</#if>"><#rt/>
<#if image?has_content>${imgStr}<#else><#if text?has_content>${text}</#if></#if></a>
</#macro>
<#macro renderImage src id style wid hgt border alt urlString>
<#if src?has_content>
<img <#if id?has_content>id="${id}"</#if><#if style?has_content> class="${style}"</#if><#if wid?has_content> width="${wid}"</#if><#if hgt?has_content> height="${hgt}"</#if><#if border?has_content> border="${border}"</#if><#if alt?has_content> alt="${alt}"</#if> src="${urlString}" />
</#if>
</#macro>

<#macro renderContentFrame fullUrl width height border><iframe src="${fullUrl}" width="${width}" height="${height}" <#if border?has_content>border="${border}"</#if> /></#macro>
<#macro renderScreenletBegin id title collapsible collapsibleAreaId expandToolTip collapseToolTip fullUrlString padded menuString showMore collapsed javaScriptEnabled>
<div class="screenlet"<#if id?has_content> id="${id}"</#if>><#rt/>
<#if showMore>
<div class="screenlet-title-bar"><ul><#if title?has_content><li class="h3">${title}</li></#if>
<#if collapsible>
<li class="<#rt/>
<#if collapsed>
collapsed"><a <#if javaScriptEnabled>onclick="javascript:toggleScreenlet(this, '${collapsibleAreaId}', '${expandToolTip}', '${collapseToolTip}');"<#else>href="${fullUrlString}"</#if><#if expandToolTip?has_content> title="${expandToolTip}"</#if>
<#else>
expanded"><a <#if javaScriptEnabled>onclick="javascript:toggleScreenlet(this, '${collapsibleAreaId}', '${expandToolTip}', '${collapseToolTip}');"<#else>href="${fullUrlString}"</#if><#if expandToolTip?has_content> title="${expandToolTip}"</#if>
</#if>
>&nbsp</a></li>
</#if>
<#if !collapsed>
${menuString}
</#if>
</ul><br class="clear" /></div><div <#if collapsibleAreaId?has_content> id="${collapsibleAreaId}" <#if collapsed> style="${collapsed}display: none;"</#if></#if><#if padded> class="screenlet-body"</#if>>
</#if>
</#macro>
<#macro renderScreenletSubWidget></#macro>
<#macro renderScreenletEnd></div></div></#macro>
<#macro renderScreenletPaginateMenu>
<li class="${paginateLastStyle}<#if lastLinkUrl?has_content>"><a href="${lastLinkUrl}">${paginateLastLabel}</a><#else> disabled">${paginateLastLabel}</#if></li><#rt/>
<li class="${paginateNextStyle}<#if nextLinkUrl?has_content>"><a href="${nextLinkUrl}">${paginateNextLabel}</a><#else> disabled">${paginateNextLabel}</#if></li><#rt/>
<#if listSize>0>${lowIndex + 1}" - "${lowIndex + actualPageSize}" "${ofLabel}" "${listSize}<#rt/></#if>
<li class="${paginatePreviousStyle}<#if previousLinkUrl?has_content>"><a href="${previousLinkUrl}">${paginatePreviousLabel}</a><#else> disabled">${paginatePreviousLabel}</#if></li><#rt/>
<li class="${paginateFirstStyle}<#if firstLinkUrl?has_content>"><a href="${firstLinkUrl}">${paginateFirstLabel}</a><#else> disabled">${paginateFirstLabel}</#if></li>
</#macro>
