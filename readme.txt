CacheBox provides a one-stop-shop for content caching. 
http://cachebox.riaforge.org/

requires:
# CFWheels 0.9.4
#CacheBox 0.9.9 BETA

Download Cachebox
Unzip cachebox's zip and place in webroot of with the cfwheels application.

Exampe Of Directory Layout:
webroot
==index.cfm
==IsapiRewrite4.ini
==Application.cfc
====wheels
====views
====models
====events
====controllers
====cachebox

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

Place caceboxCFWheels plugin's zip in the plugin folder of cfwheels.

Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true

You should be good to go now.

Cochebox Admin:
Example: http://localhost/cachebox/index.cfm OR 
http://localhost/index.cfm?controller=wheels&action=plugins&name=cachebox