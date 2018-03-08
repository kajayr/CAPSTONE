/**
 * @author: JP Marinacci
 */

/*jshint devel:true, jquery:true, browser:true, strict: true */
/*global eLeap:true */

define(['eLeap', 'jquery', 'underscore', 'backbone', 'text!../../tmpl/pages/opportunityEditorPage.tmpl'],
function (eLeap, $, _, Backbone, opportunityEditorPageTmpl) {
	'use strict';
		
	eLeap.own.OpportunityEditorPage = Backbone.View.extend({
		
		pageTmpl: _.template(opportunityEditorPageTmpl),
		
		initialize: function (options) {
			this.options = _.extend({}, options);
			this.renderFramework();
		},
		
		renderFramework: function(){
			this.$el.html(this.pageTmpl({}));
		}
	});
	return eLeap.own.OpportunityEditorPage;
});
