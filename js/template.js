/**
 * @version		$Id: js/template.js
 * @package		Joomla.Site
 * @subpackage	com_jkassa
 * @copyright	Copyright (C) 2007 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license		Commercial Software; see LICENSE.txt
 * @author      GeneticsPro Eugene Gal'chuk - http://www.geneticspro.net/, admin@geneticspro.net
 */
 
/* AJAX SETUP
------------------------------------------------ */
jQuery(document).ajaxComplete(function(event, xhr, settings)
{
	"use strict";
	
	if (settings === undefined) { return false; }
	
	jQuery('.hasTooltip').tooltip({"html": true, "container": "body"});
	
	if (xhr.responseText.indexOf('chosen.jquery.min.js') + 1)
	{
		jQuery('select').chosen({
			"disable_search_threshold":20,
			"search_contains":true,
			"allow_single_deselect":true,
			"placeholder_text_multiple":"",
			"placeholder_text_single":"",
			"no_results_text":""
		});
	}
});


/* LOADING FOR AJAX
------------------------------------------------ */
jQuery(document).ajaxStart(function()
{ 
	"use strict";
	
	var outerDiv = jQuery('body');
	
	jQuery('<div id="jk_loading"></div>')
		.css("background", "rgba(255, 255, 255, 0.8)")
		.css("top", outerDiv.position().top - jQuery(window).scrollTop())
		.css("left", outerDiv.position().left - jQuery(window).scrollLeft())
		.css("width", "100%")
		.css("height", outerDiv.height())
		.css("position", "fixed")
		.css("opacity", "0.80")
		.css("-ms-filter", "progid:DXImageTransform.Microsoft.Alpha(Opacity = 80)")
		.css("filter", "alpha(opacity = 80)")
		.css("zIndex", "60000")
		.appendTo(outerDiv);
	jQuery('<div class="jk_loader"></div>').appendTo('#jk_loading');
}).ajaxStop(function()
{
	"use strict";
	
	jQuery('#jk_loading').remove();
});