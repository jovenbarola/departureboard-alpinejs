component {

	this.name = "<application-name>"; // name of the application context

// regional
	// default locale used for formating dates, numbers ...
	this.locale = "en_US"; 
	// default timezone used
	this.timezone = "Asia/Shanghai"; 

// scope handling
	// lifespan of an untouched application scope
	this.applicationTimeout = createTimeSpan( 1, 0, 0, 0 ); 
	
	// session handling enabled or not
	this.sessionManagement = true; 
	// cfml or jee based sessions
	this.sessionType = "application"; 
	// untouched session lifespan
	this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 ); 
	this.sessionStorage = "memory";
	
	// client scope enabled or not
	this.clientManagement = false; 
	this.clientTimeout = createTimeSpan( 90, 0, 0, 0 );
	this.clientStorage = "cookie";
						
	// using domain cookies or not
	this.setDomainCookies = false; 
	this.setClientCookies = true;

	// prefer the local scope at un-scoped write
	this.localMode = "classic"; 
	
	// buffer the output of a tag/function body to output in case of an exception
	this.bufferOutput = false; 
	this.compression = false;
	this.suppressRemoteComponentContent = false;
	
	// If set to false Lucee ignores type definitions with function arguments and return values
	this.typeChecking = true;
	
	
// request
	// max lifespan of a running request
	this.requestTimeout=createTimeSpan(0,0,0,50); 

// charset
	this.charset.web="UTF-8";
	this.charset.resource="windows-1252";
	
	this.scopeCascading = "standard";
	this.searchResults = true;
// regex
	this.regex.type = "perl";
//////////////////////////////////////////////
//               MAIL SERVERS               //
//////////////////////////////////////////////
	this.mailservers =[ 

	];
//////////////////////////////////////////////
//               DATASOURCES                //
//////////////////////////////////////////////
	
	this.datasources["flightstatusdsn"] = {
	  class: 'com.mysql.cj.jdbc.Driver'
	, connectionString: 'jdbc:mysql://localhost:3306/flightstatusdb?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&maxReconnects=3'
	, username: '<mysql-username>'
	, password: "encrypted:<mysql-password-but-must-be-get-in-serveradminpanel></mysql-password-but-must-be-get-in-serveradminpanel>"
	
	// optional settings
	, connectionLimit:100 // default:-1
	};
	this.datasource = "flightstatusdsn"
//////////////////////////////////////////////
//                 CACHES                   //
//////////////////////////////////////////////
		

//////////////////////////////////////////////
//               MAPPINGS                   //
//////////////////////////////////////////////

this.mappings["/lucee/admin"]={
		physical:"{lucee-config}/context/admin"
		,archive:"{lucee-config}/context/lucee-admin.lar"};

this.mappings["/lucee/doc"]={
		archive:"{lucee-config}/context/lucee-doc.lar"};

}