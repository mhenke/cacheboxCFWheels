CacheBox provides a one-stop-shop for content caching. 
http://cachebox.riaforge.org/



requires:

# CFWheels 0.9.4

# CacheBox 0.9.9 BETA



Simple Instructions
1) Download Cachebox from http://cachebox.riaforge.org/
2) Unzip the Cachebox framework is in your webroot (should be under
webroot called cachebox)
3) Place the Cachebox CFWheels plugin zip in the plugins folder
4) Add the settings listed in the readme.txt to events/
onapplicationstart.cfm
5) Reloaded CFWheels (?reload=true) 

Detailed Instructions
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



Place the CacheBox-0.1.zip plugin in the plugins folder of cfwheels

Reload your cfwheels application.
Example: http://localhost/index.cfm?reload=true



You should be good to go now.

Cochebox Admin:
Exa mple: http://localhost/cachebox/index.cfm OR 
http://localhost/index.cfm?controller=wheels&action=plugins&name=cachebox