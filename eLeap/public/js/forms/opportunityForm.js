/**
 * @author: JP Marinacci
 */

/*jshint devel:true, jquery:true, browser:true, strict: true */
/*global eLeap:true */

define(['eLeap', 'jquery', 'underscore', 'backbone', 'datetimepicker', 'controllers/user', 'controllers/notifications', 
		'models/opportunity', 'text!../../tmpl/forms/opportunityForm.tmpl'],
function (eLeap, $, _, Backbone, datetimepicker, user, notifications, Opportunity, opportunityFormTmpl) { 'use strict';
		
	eLeap.own.OpportunityForm = Backbone.View.extend({
		
		formTmpl: _.template(opportunityFormTmpl),
		
		events: {
			'click .saveOpportunity': 'saveOpportunity',
		},
		
		initialize: function (options) {
			this.options = _.extend({}, options);
			this.opportunity = options.opportunity || new Opportunity();
			this.renderFramework();
		},
		tempFunc: function() {
			
		},
		
		renderFramework: function(){
			this.$el.html(this.formTmpl({
				opportunity: this.opportunity
			}));
			this.$(".startDateTimeInput").datetimepicker({
				 icons: {
                    time: "fa fa-clock",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                    previous: "glyphicon glyphicon-chevron-left",
                    next: "glyphicon glyphicon-chevron-right"
                    /*previous: "fa fa-angle-left",
                    next: "fa fa-angle-right",
                    time: 'glyphicon glyphicon-time',
		            date: 'glyphicon glyphicon-calendar',
		            up: 'glyphicon glyphicon-chevron-up',
		            down: 'glyphicon glyphicon-chevron-down',
		            previous: 'glyphicon glyphicon-chevron-left',
		            next: 'glyphicon glyphicon-chevron-right',
		            today: 'glyphicon glyphicon-screenshot',
		            clear: 'glyphicon glyphicon-trash',
		            close: 'glyphicon glyphicon-remove'*/
                }
			});
			this.$(".endDateTimeInput").datetimepicker({
				 icons: {
                    time: "fa fa-clock",
                    date: "fa fa-calendar",
                    up: "fa fa-arrow-up",
                    down: "fa fa-arrow-down",
                    previous: "glyphicon glyphicon-chevron-left",
                    next: "glyphicon glyphicon-chevron-right"
                }
			});
		},
		
		gatherInput: function() {
			var startDateTime = new Date(this.$(".startDateTimeInput").val());
			var endDateTime = new Date(this.$(".endDateTimeInput").val());
			var opportuntityJson = {
				//classId: "",
				/*donation: "",
				isVirtual: "",
				notes: "",*/
				/*pay: "",
				statusId: "",
				timePeriodEnd: "",*/
				//timePeriodStartDate: new Date(),
                description: this.$(".opportunityFormDescription").val(),
                //duration: this.$(".duration").val(),
                isPaid: true,// this.$(".isPaid").val(),
                //isServiceLearning: this.$(".isServiceLearning").val(),
                startDateTime: startDateTime,
                endDateTime: endDateTime,
                ownerId: user.person.get('personId') || 1,
				title: this.$(".opportunityFormTitle").val(),
				totalSeats: Number(this.$(".totalSeats").val())
			};
			this.opportunity.set(opportuntityJson);
		},
		
		saveOpportunity: function() {
			notifications.notifyUser("opportunity created");
			this.gatherInput();
			var options = {
				success: function() {
					notifications.notifyUser("opportunity created");
				},
				error: function() {
					notifications.notifyUser("error -- opportunity creation failed");
				}
			};
			this.opportunity.save({}, options);
		}
	});
	return eLeap.own.OpportunityForm;
});
