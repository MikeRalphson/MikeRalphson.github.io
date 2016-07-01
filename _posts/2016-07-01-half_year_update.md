---
layout: post
title: BBC API half-year update
tagline: Changes at end of June 2016
category: APIs
tags:
  - bbc
  - nitro
  - ibl
  - openc4
  - channel4
  - api
published: true

---
Changes to both the BBC Nitro and iBL APIs yesterday.

Nitro agained a new option in the `programmes\availability_type` of `simulcast`.

The iBL API at release 391 gained three new attributes in the `broadcast` response:

````javascript
        "episode_id": "b07h0fsg",
        "version_id": "b07hw987",
        "service_id": "bbc_one_london",
````

In other news, the [openC4](https://github.com/Mermade/openC4) project joins the open* API project stable, with a
Swagger/OpenAPI [specification](https://raw.githubusercontent.com/Mermade/openC4/master/c4Api/swagger.json) for 
the Channel4 API. Swagger console is available [here](http://mermade.github.io/swagger/index.html?url=https://raw.githubusercontent.com/Mermade/openC4/master/c4Api/swagger.json).

The openC4 specification is automatically generated from the Channel 4 developer documentation 
[here](http://developer.channel4.com/) with numerous fixups and extensions applied to match the real-world API.
