/*!
 * ExpressionEngine - by EllisLab
 *
 * @package		ExpressionEngine
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2003 - 2016, EllisLab, Inc.
 * @license		https://expressionengine.com/license
 * @link		https://ellislab.com
 * @since		Version 3.0
 * @filesource
 */
$(document).ready(function(){$(".sidebar .folder-list .remove a.m-link").click(function(i){var t="."+$(this).attr("rel");$(t+" .checklist").html(""),// Reset it
$(t+" .checklist").append("<li>"+$(this).data("confirm")+"</li>"),$(t+" input[name='id']").val($(this).data("id")),i.preventDefault()})});