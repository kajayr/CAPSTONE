/**
 * @author: JP Marinacci
 */

/*jshint devel:true, jquery:true, browser:true, strict: true */
/*global eLeap:true */

define(['jquery', 'underscore', 'backbone', 'eLeap', 'controllers/user', 'controllers/notifications',
		'models/person', 'text!../../tmpl/forms/signupForm.tmpl'],
function ( $, _, Backbone, eLeap, user, notifications, Person, signupFormTmpl) { 'use strict';
		
	eLeap.own.SignForm = Backbone.View.extend({
		
		formTmpl: _.template(signupFormTmpl),
		
		events: {
			'click .signupButton': 'createNewPerson'
		},
		
		initialize: function (options) {
			this.options = _.extend({}, options);
			this.person = options.person || new Person();
			this.renderFramework();
		},
		
		renderFramework: function(){
			this.$el.html(this.formTmpl());
		},
		
		gatherInput: function() {
			/*var personJson = {
				email: this.$(".signupEmail").val(),
				personName: this.$(".signupName").val(),
				phone: this.$(".signupPhone").val(),
				roleId: Number(this.$(".signupRole").val())
			};*/
			var personJson = {
				email: "kajayr@yahoo.com",
				personName: "Leo",
				phone: "425-444-0923",
				roleId: 2
			};
			this.person.set(personJson);
		},
		
		createNewPerson: function() {
			notifications.notifyUser("Person created");
			this.gatherInput();
			var options = {
				success: function() {
					notifications.notifyUser("Person created");
				},
				error: function() {
					notifications.notifyUser("error -- Person creation failed");
				}
			};
			this.person.save({}, options);
		}
	});
	return eLeap.own.SignForm;
});
