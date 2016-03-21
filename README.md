Mugo Content Class Manager
==========================

Extension for viewing eZ Publish content objects grouped by content class

Description
-----------

If you've ever had a hard time finding content objects of certain classes in your eZ Publish installation, you might write one-off PHP scripts or worse, dive directly into the database. This is often the case on unfamiliar sites (where you get lost in the content tree) and/or sites that have a large number of content objects. Mugo Content Class Manager is a simple but powerful extension that displays content objects grouped by their content class. 

- See more at: http://www.mugo.ca/Blog/Viewing-eZ-Publish-content-objects-by-content-class#sthash.811HPm25.dpuf

Installing the extension
------------------------

Mugo Content Class Manager works out of the box: just extract the "mugocontentclassmanager" folder in your eZ Publish extension/ folder, then activate it for your Administration Interface siteaccess in site.ini.append.php via the ActiveAccessExtensions[] array: ActiveAccessExtensions[]=mugocontentclassmanager. You can alternatively activate it globally in settings/override/site.ini.append.php, but remember that the array is called ActiveExtensions[] instead of ActiveAccessExtensions[]. Then, clear the INI and template cache.

- See more at: http://www.mugo.ca/Blog/Viewing-eZ-Publish-content-objects-by-content-class
