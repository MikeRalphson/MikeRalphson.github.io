---
layout: post
title: More Nitro deprecations
tagline: null
category: APIs
tags:
  - bbc
  - nitro
  - api
published: true

---
First time I've seen this, the BBC Nitro API xml specification has changed, but the corresponding JSON definition has not yet been updated.
Update: refetching the API endpoints just after midnight pulled down a modified `nitro-schema.xsd` which makes sense if the output format of the API has changed, but still not an `api.json` to match the updated `api.xml`.

Gone in this update are the inline `image` elements across several of the feeds, which were deprecated back in July 2014 and replaced by the `images` mixin, presumably for performance reasons. This means image information is now looked up only if specifically requested.

The `formats` element within the programmes feed has been removed. Its replacement since March 2015 has been the `programme_formats` element. This too will reduce message response size.

The versions feed gains a payment-type filter as did the programmes feed last week, the parameters are the same: `free`, `bbcstore` and `uscansvod`.

As the JSON specification has not yet been updated, the JS api file and Swagger (now OpenApi) definitions have not been regenerated.

In other news the iBL (iPlayer Business Layer) JSON schema has been updated from version 323 to version 334.