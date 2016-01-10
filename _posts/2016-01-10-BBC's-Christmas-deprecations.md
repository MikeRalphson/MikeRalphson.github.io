---
layout: post
title: "BBC's Christmas deprecations"
tagline: "Dated the 24/12/2015 the BBC's Nitro API dropped some interesting deprecations"
category: null
tags: []
published: true

---
Just after New Year, my periodic polling of the BBC's Nitro API endpoint revealed a change in the api.xml, api.json and nitro-schema.xsd files. 

Well, a simple 'git status' revealed it.

Despite containing deprecations dated November and December, the revised API wasn't published until early January. The BBC work to a two-week release cycle.

The most interesting change is that the BBC have deprecated entire hosts and replaced them with a new one.

Out go **nitro.api.bbci.co.uk**, **data.bbc.co.uk**, **d.bbc.co.uk**, and in comes **programmes.api.bbc.com**. The new host is up and running, presumably as of the deprecation date of 24/12/2015, but there is no word on when the old hosts will go dark. It will be interesting to see if Nitro consumers will react to this in-band communication of a breaking change (the API spec doesn't otherwise specify the host in any way) or whether the BBC will have updated their commercial partners via other means.

### Other changes ###

The Programmes mixin `versions_availability` (in my JS API this is `mProgrammesVersionsAvailability`) has been deprecated, apparently since 10/11/2015. It may be the BBC simply forgot to change the release-status. It has been replaced by `available_versions` (`mProgrammesAvailableVersions`) which has a different response format, as documented in the nitro-schema.xsd

### Updated API files ###

The (api.js)[https://raw.githubusercontent.com/Mermade/bbcparse/master/nitroApi/api.js] and (swagger.json)[https://raw.githubusercontent.com/Mermade/bbcparse/master/nitroApi/swagger.json] have been regenerated. The swagger.json is still showing as failing validation in Swagger.UI, but this is due to a typo in the swagger parser which has now been corrected.