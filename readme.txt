Download Cachebox
http://cachebox.riaforge.org/

Unzip and place in webroot of with the cfwheels application.

In events/onapplicationstart.cfm place this code:
<cfscript>
application.wheels.cache.sql = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_sql"));
application.wheels.cache.image = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_image"));
application.wheels.cache.main = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_main"));
application.wheels.cache.action = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_action"));
application.wheels.cache.page = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_page"));
application.wheels.cache.partial = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_partial"));
application.wheels.cache.query = CreateObject("component","cachebox.cacheboxnanny").init(CreateObject("component","cachebox.cacheboxagent").init("wheels_query"));
</cfscript>

Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true

You should be good to go now.

For the Admin:
http://localhost/cachebox/index.cfm