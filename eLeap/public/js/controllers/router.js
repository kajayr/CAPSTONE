/** 
 *	@authors: JP Marinacci
 */

define(['underscore', 'backbone', 'eLeap', 'controllers/user', 'navigation/sidebar'], 
function (_, Backbone, eLeap, user, Sidebar) { 'use strict';
	
	var thisRouter;
	
	eLeap.own.Router = Backbone.Router.extend({
		
		lastRoute: '/',
		
		initialize: function() {
			this.listenForEvents();
		},
		
		routes: {
			'/': 'loginPage',
			'about': 'about',
			'account/settings': 'accountSettings',
			'account/profile': 'accountProfile',
			'dashboard': 'dashboard',
			'dbTest': 'dbTest',
			'home': 'home',
			'login': 'loginPage',
			'opportunity/:id':'opportunity',
			'sample':'sample',
			'sample/:param': 'sample',
			'team': 'team',
			'themesettings': 'themeSettings',
			'*path':  'loginPage'
		},
		
		listenForEvents: function() {
			this.stopListening();
			if(user) {
				this.listenTo(user, 'user:loggedIn', this.successfulLogin);
			}
		},
		
		successfulLogin: function() {
			this.sidebar = new Sidebar({
				el: "#sidebar"
			});
			if (window.location.pathname === "/" + this.lastRoute) {
				window.location.assign("/" + this.lastRoute);
			} else {
				this.navigate(this.lastRoute, { trigger: true });
			}
			//fetch any neccessary data;
			require(['controllers/cache'], function(cache) {
				cache.fetchRoles();
			});
		},
		
		logOut: function () {
			user.logout();
			this.navigate('/login', { trigger: true });
		},
		
		beginNewPage: function() {
			if(this.currentPage) {
				this.currentPage.remove();
			}
		},
		
		about: function() {
			this.beginNewPage();
			this.lastRoute = '/about';
			$("#pages").empty().append("<div id='aboutPage'></div>");
			require(['pages/aboutPage'], function(AboutPage) {
				thisRouter.currentPage = eLeap.run.aboutPage = new AboutPage({
					el: "#aboutPage"
				});
			});
		},
		
		accountSettings: function() {
			this.beginNewPage();
			this.lastRoute = '/accountSettings';
			$("#pages").empty().append("<div id='accountSettingsPage'></div>");
			require(['pages/accountSettingsPage'], function(AccountSettingsPage) {
				thisRouter.currentPage = eLeap.run.accountSettingsPage = new AccountSettingsPage({
					el: "#accountSettingsPage"
				});
			});
		},
		
		accountProfile: function() {
			this.beginNewPage();
			this.lastRoute = '/accountProfile';
			$("#pages").empty().append("<div id='accountProfilePage'></div>");
			require(['pages/accountProfilePage'], function(AccountProfilePage) {
				thisRouter.currentPage = eLeap.run.accountProfilePage = new AccountProfilePage({
					el: "#accountProfilePage"
				});
			});
		},
		
		dashboard: function () {
			this.beginNewPage();
			this.lastRoute = '/dashboard';
			$("#pages").empty().append("<div id='dashboardPage'></div>");
			require(['pages/dashboardPage'], function(DashboardPage) {
				thisRouter.currentPage = eLeap.run.dashboardPage = new DashboardPage({
					el: "#dashboardPage"
				});
			});
		},
		
		dbTest: function() {
			this.beginNewPage();
			this.lastRoute = '/dbTest';
			$("#pages").empty().append("<div id='dbTest'> DATA: </div>");
			require(['pages/dbTestPage'], function(dbTestPage) {
				thisRouter.currentPage = eLeap.run.dbTestPage = new dbTestPage({
					el: "#dbTest"
				});
			});
		},
		
		home: function() {
			this.beginNewPage();
			this.lastRoute = '/home';
			$("#pages").empty().append("<div id='homePage'></div>");
			require(['pages/homePage'], function(HomePage) {
				thisRouter.currentPage = eLeap.run.homePage = new HomePage({
					el: "#homePage"
				});
			});
		},
		
		lockedPage: function () {
			this.beginNewPage();
			$("#pages").empty().append("<div id='lockedPage'></div>");
			require(['pages/lockedPage'], function(LockedPage) {
				thisRouter.currentPage = eLeap.run.lockedPage = new LockedPage({
					el: "#lockedPage"
				});
			});
		},
		
		loginPage: function() {
			this.beginNewPage();
			this.lastRoute = '/login';
			$("#pages").empty().append("<div id='loginPage'></div>");
			require(['pages/loginPage'], function(LoginPage) {
				thisRouter.currentPage = eLeap.run.loginPage = new LoginPage({
					el: "#loginPage"
				});
			});
		},
		
		opportunity: function(id) {
			this.beginNewPage();
			this.lastRoute = '/opportunity/' + id;
			$("#pages").empty().append("<div id='opportunityPage'></div>");
			require(['pages/opportunityPage'], function(OpportunityPage) {
				thisRouter.currentPage = eLeap.run.loginPage = new OpportunityPage({
					el: "#opportunityPage",
					opportunityId: id
				});
			});
		},
		
		sample: function(sampleParam) {
			this.beginNewPage();
			this.lastRoute = '/sample';
			$("#pages").empty().append("<div id='samplePage'></div>");
			sampleParam = sampleParam || "400000px";
			var sampleObjParam = {
				amount: function(){
					return "$$";
				},
				number: 2018,
				letters: "foo",
				tempText: "Here is a sample page"
			};
			require(['pages/samplePage'], function(SamplePage) {
				eLeap.run.samplePage = new SamplePage({
					el: "#samplePage",
					bringInAParam: sampleParam,
					bringInObj: sampleObjParam,
					isCool: true
				});
			});
		},
		
		team: function() {
			this.beginNewPage();
			this.lastRoute = '/team';
			$("#pages").empty().append("<div id='teamPage'></div>");
			require(['pages/teamPage'], function(TeamPage) {
				thisRouter.currentPage = eLeap.run.teamPage = new TeamPage({
					el: "#teamPage"
				});
			});
		},
		
		themesettings: function () {
			this.beginNewPage();
			this.lastRoute = '/themesettings';
			$("#pages").empty().append("<div id='themeSettingsPage'></div>");
			require(['pages/themeSettingsPage'], function(ThemeSettingsPage) {
				thisRouter.currentPage = eLeap.run.themesettingsPage = new ThemeSettingsPage({
					el: "#themeSettingsPage"
				});
			});
		}
	});
	
	function getRouter() {
		thisRouter = thisRouter || (eLeap.run.router = new eLeap.own.Router());
		return thisRouter;
	}
	return getRouter();

});
