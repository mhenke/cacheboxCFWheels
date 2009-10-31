<cfcomponent>
	 <cffunction name="init">
		<cfset this.version = "0.9.4">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="$insertDefaults" returntype="struct" access="public" output="false">
	<cfargument name="name" type="string" required="true">
	<cfargument name="input" type="struct" required="true">
	<cfargument name="reserved" type="string" required="false" default="">
	<cfscript>
		var loc = {};
		if (application.wheels.environment != "production")
		{
			if (ListLen(arguments.reserved))
			{
				loc.iEnd = ListLen(arguments.reserved);
				for (loc.i=1; loc.i <= loc.iEnd; loc.i++)
				{
					loc.item = ListGetAt(arguments.reserved, loc.i);
					if (StructKeyExists(arguments.input, loc.item))
						$throw(type="Wheels.IncorrectArguments", message="The '#loc.item#' argument is not allowed.", extendedInfo="Do not pass in the '#loc.item#' argument. It will be set automatically by Wheels.");
				}
			}			
		}
				StructAppend(arguments.input, application.wheels.functions[arguments.name], false);
		loc.returnValue = arguments.input;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="$addToCache" returntype="void" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="value" type="any" required="true">
	<cfargument name="time" type="numeric" required="false" default="#application.wheels.defaultCacheTime#">
	<cfargument name="category" type="string" required="false" default="main">
	<cfscript>
		var loc = {}; 
		loc.span = CreateTimeSpan(0,0,arguments.time,0); 
		loc.agent = application.wheels.cache[arguments.category]; 
		loc.agent.store(arguments.key,duplicate(arguments.value),loc.span); 
	</cfscript>
</cffunction>

<cffunction name="$getFromCache" returntype="any" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="category" type="string" required="false" default="main">
	<cfscript>
		var loc = {}; 
		loc.returnValue = false; 
		loc.cache = application.wheels.cache[arguments.category].fetch(key); 
		if (not loc.cache.status) { 
			// we found cache and it's still valid 
			loc.returnValue = duplicate(loc.cache.content); // if it's a struct or object, we don't want to make changes to the cache after returning it 
		} 
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="$removeFromCache" returntype="void" access="public" output="false">
	<cfargument name="key" type="string" required="true">
	<cfargument name="category" type="string" required="false" default="main">
	<cfset application.wheels.cache[arguments.category].expire(key) />
</cffunction>

<cffunction name="$cacheCount" returntype="numeric" access="public" output="false">
	<cfargument name="category" type="string" required="false" default="">
	<cfscript>
		var loc = {}; 
		if (Len(arguments.category)) 
		{ 
			loc.returnValue = application.wheels.cache[arguments.category].getHeadCount();
		} 
		else 
		{ 
			loc.returnValue = 0; 
			for (loc.key in application.wheels.cache) { 
				loc.returnValue = loc.returnValue + application.wheels.cache[loc.key].getHeadCount(); 
			} 
		} 
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="$clearCache" returntype="void" access="public" output="false">
	<cfargument name="category" type="string" required="false" default="#structKeyList(application.wheels.cache)#">
	<cfscript>
		var loc = {};
		var agent = listToArray(category); 
		var i = 0; 
		
		for (i = 1; i lte arrayLen(agent); i = i + 1) { 
			application.wheels.cache[agent[i]].expire(); 
		} 
	</cfscript>
</cffunction>
</cfcomponent>