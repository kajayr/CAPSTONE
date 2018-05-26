/**
 * @authors: JP Marinacci, Belete Zegeye, Sunny Wu, Aren Kasner, Leo Sinanian
 */

/*jshint devel:true, jquery:true, browser:true, strict: true */
/*global eLeap:true */

define(['eLeap', 'jquery', 'underscore', 'backbone', 'controllers/cache', 'controllers/notifications', 'controllers/user',
		'items/opportunityDetailItem', 'text!../../tmpl/pages/opportunityPage.tmpl'],
function (eLeap, $, _, Backbone, cache, notifications, user, OpportunityDetailItem, opportunityPageTmpl) { 'use strict';
		
	eLeap.own.OpportunityPage = Backbone.View.extend({
		
		pageTmpl: _.template(opportunityPageTmpl),
		
		events: {
			'click .oppViewJoinBtn': 'commandJoinOpportunity',
			'click .oppViewLeaveBtn': 'commandLeaveOpportunity',
			'click .oppViewEditBtn': 'commandEditOpportunity'
		},
		
		initialize: function (options) {
			this.options = _.extend({}, options);
			this.renderFramework();
			this.opportunityId = options.opportunityId;
			if(this.opportunityId === "create") {
				this.showCreateView();
				var thisPage = this;
				require(['forms/opportunityForm'], function(OpportunityForm) {
					thisPage.opportunityForm = new OpportunityForm({
						el: thisPage.$(".opportunityPageCreateForm")
					});
				});
			} else {
				this.showDetailView();
				var oppId = Number(this.opportunityId);
				if(oppId) {
					this.opportunity = cache.getOpportunity({
						opportunityId: oppId
					});
				}
				this.listenForEvents();
				cache.fetchOpportunity(this.opportunity);
				//this.opportunity.fetch();
			}
		},
		
		renderFramework: function(){
			this.$el.html(this.pageTmpl());
		},
		
		showDetailView: function() {
			this.$(".oppportunityEditView").hide();
			this.$(".opportunityDetailsView").show();
		},
		
		showCreateView: function() {
			this.$(".oppportunityEditView").show();
			this.$(".opportunityDetailsView").hide();
		},
		
		listenForEvents: function() {
			this.listenTo(this.opportunity, 'sync change', this.renderOpportunity);
		},
		
		renderOpportunity: function() {
			var opportunityView = new OpportunityDetailItem({
				opportunity: this.opportunity
			});
			this.$(".opportunityView").html(opportunityView.render());
			//if()
		},
		
		commandJoinOpportunity: function() {
			this.$(".oppViewJoinBtn").attr('disabled', 'disabled');
			var options = {
				personId: user.person.get('personId'),
				success: function() {
					notifications.notifyUser("You joined this opportunity");
				},
				appError: function(error) {
					var errorMessage = error ? error.message ? error.message : error: "couldn't join at this time";
					notifications.notifyUser(error.message);
				},
				error: function(error) {
					var errorMessage = error ? error.message ? error.message : error: "an error occurred";
					notifications.notifyUser(error.message);
				}
			};
			this.opportunity.joinOpportuntiy(options);
		},
		
		commandLeaveOpportunity: function() {
			this.$(".oppViewLeaveBtn").attr('disabled', 'disabled');
			var options = {
				personId: user.person.get('personId'),
				success: function() {
					notifications.notifyUser("You Left this opportunity");
				},
				appError: function(error) {
					var errorMessage = error ? error.message ? error.message : error: "couldn't leave at this time";
					notifications.notifyUser(error.message);
				},
				error: function(error) {
					var errorMessage = error ? error.message ? error.message : error: "an error occurred";
					notifications.notifyUser(error.message);
				}
			};
			this.opportunity.leaveOpportuntiy(options);
		}
	});
	return eLeap.own.OpportunityPage;
});

