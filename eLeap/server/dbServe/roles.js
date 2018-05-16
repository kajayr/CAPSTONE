var dbServer = require('../dbServer');
var mysql = require('mysql');

var roles = {
	
	getRoles: function(request, response) { 'use strict';	
		var sprocName = "sprocAllRole";
		var params = [];
		console.log("getRoles route called");
		console.log("calling " + sprocName);
		function processSproc(results) {
			if (results && results.error) {
				dbServer.processSprocError(results, response);
	    	} else {
	    		var returnResults = results[0];
	    		console.log("sprocAllRole successful");
	    		response.send(returnResults);
	    	}
		};
		dbServer.sproc(sprocName, params, processSproc);
    }
};

module.exports = roles;

