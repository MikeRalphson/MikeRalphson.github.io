---
layout: post
title: Comparison of various OpenApi/Swagger to Slate conversion tools
tagline: There's more than one way to skin an API
category: OpenApi
tags:
  - openapi
  - swagger
  - slate
  - shins
  - widdershins
published: true

---
Something a little different for this blog; a comparison of four tools which aim to do a similar job, to convert 
[OpenApi / Swagger](https://www.openapis.org/specification/repo) definitions into simple markdown which can be rendered by 
[Slate](https://github.com/lord/slate) (or one of its ports). Slate itself and its alternative implementations / ports will 
likely be the subject of a follow-up post on this blog.

Disclaimer: the author of this blog post is also the author of one of the tools compared (`widdershins`), and 
[shins](https://github.com/mermade/shins), the Node.js port of Slate used here to convert each tool's Slate markdown into HTML.

When I started `widdershins` I could not find any tools to directly convert OpenAPI / Swagger definitions to Slate, except for
`swagger2slate` which is written in PHP and was at the time in an unmaintained state. Some weeks later on and two more tools, 
developed in Node.js (like `widdershins`) have appeared, and `swagger2slate` has seen further development, hence this comparison.

Because `shins` uses the common-mark compatible [markdown-it](https://github.com/markdown-it/markdown-it) as its markdown
processor, there may be differences in the rendered HTML compared to that produced by Ruby Slate.

Each tool may be optimised for a particular Slate CSS theme. This is not taken into account here, but where an example site
is provided, it is linked to below.

Only the example `petstore.json` has been used so far to compare each tool, which may not demonstrate all features to best effect.

First up is:

## [OpenApi2Slate](https://github.com/scrive/openapi2slate)

![OpenApi2Slate screenshot](https://github.com/Mermade/oa2s-comparison/blob/master/docs/openapi2slate.png?raw=true)

`openapi2slate` is a Node.js-based tool developed by [Scrive](https://github.com/scrive/) which describes itself as

> An opinionated converter from OpenAPI to Slate markdown

### What OpenAPI2Slate gets right

* `openapi2slate` certainly looks impressive with Scrive's CSS theming, as can be seen on their 
[API documentation](http://apidocs.scrive.com/)
* The right-most pane is used for documentation box-outs as well as schema descriptions
* A nice list of API calls is included at the top of the middle-pane as well as in the left-most table of contents. This is helpful
when the documentation consists of more than just simple API calls and responses
* Available as a package on [npm](https://www.npmjs.com/package/openapi2slate)
* `openapi2slate` can use OpenAPI vendor extensions to mark tags and parameters as internal use only, making it simple to 
produce both internal and external-facing documentation from the same OpenAPI definition.

### Areas for improvement

* No option for code-samples
* Authentication information is not shown
* Where some optional information in the OpenAPI definition is missing, `openapi2slate` renders `undefined` in the table-of-contents
footer.
* It would be nice to be able to call a documented API to produce the markdown programmatically, rather than only as a command-line
tool which outputs to STDOUT
* Some markdown is not common-mark compatible, which results in `shins` at least rendering it sub-optimally. This can be seen in 
unconverted headings. This may be due to an amount of HTML which `openapi2slate` mixes in with the markdown.
* No explicit license, except in the project's `package.json` (BSD-3-Clause)

As documented in the project's [README](https://github.com/scrive/openapi2slate/blob/master/README.md), `openapi2slate` 
has a few limitations / design decisions to be aware of:

> Dereferncing(sic) is not properly implemented, instead it tries to dereference the file for you and use that. YMMV.
> API Schema works fairly OK, some features may be missing...
> We render things in Slate Markdown that fits our needs and customisations, so this may not work well for you!

## [Swagger-to-Slate](https://github.com/lavkumarv/swagger-to-slate)

![Swagger-to-slate screenshot](https://github.com/Mermade/oa2s-comparison/blob/master/docs/swaggerToSlate.png?raw=true)

`Swagger-to-Slate` is also a Node.js-based tool, under the MIT license, developed by 
[Lav Kumar Vishwakarma](https://github.com/lavkumarv), which describes itself as

> Node module which converts the swagger.json or YAML file into slate markdown 

### What Swagger-to-Slate gets right

* Parameters and responses are clearly rendered in table form
* Although not documented, it is easy enough to call the conversion programmatically
* Handles yaml as a well as json formatted definitions
* Available as a module on [npm](https://www.npmjs.com/package/swagger-to-slate)
* Explicitly MIT Licensed

### Areas for improvement

* Header metadata about the API such as the endpoint URL, contact and license information is not shown
* Authentication scopes are not shown
* `swagger-to-slate` uppercases the table-of-contents, making it look somewhat shouty
* Although `shell` is defined as a language tab, no examples are shown yet
* Minor common-mark glitches, e.g. emphasis in `code` blocks not rendering
* No link to an example HTML output on the project page

`Swagger-to-Slate` includes Slate's `_error.md` file by default, so you need to remember to update this to include your 
API documentation.

## [Swagger2Slate](https://github.com/e96/swagger2slate)

![Swagger2Slate screenshot](https://github.com/Mermade/oa2s-comparison/blob/master/docs/swagger2slate.png?raw=true)

`Swagger2Slate` is in some way the granddaddy of all these tools, predating them by about 18-months.

It is written as a PHP application and the project description is

> Convert swagger api documentation (http://swagger.io) to slate static html page (https://github.com/tripit/slate) 

I wasn't originally going to include `Swagger2Slate` in this comparison, because by the author's own admission it was
no-longer maintained, had several outstanding issues, and being written in PHP wasn't something that was immediately easy
for me to test (much like Slate, being written in Ruby - and not supporting Windows, which may be the reason a number of
Node.js-based ports exist).

However, as of this writing, the latest commit to `Swagger2Slate` was only five hours ago, and deploying a slightly hacked
version of the code to [heroku](https://swagger2slate.herokuapp.com) allowed me to see the example output.

### What Swagger2Slate gets right

* Authentication information is displayed (but not oAuth scopes)
* The table-of-contents uses operation summaries / descriptions as is nicely readable
* Produced and Consumed MIME-Types are shown in the right-hand pane
* HTML examples are used for the right-hand-pane
* Input and output models are shown in the right-hand-pane
* Model names are shown not just `Object`, and are hyperlinks 
* No visible markdown glitches

### Areas for improvement

* Some header metadata, such as license and contact information is not shown
* Sometimes difficult to tell input from output models
* Links to response models actually link back to tags if name matches
* Documentation is confusing, as it implies you have to start with a PHP application containing Swagger annotations. This isn't 
the case, and `Swagger2Slate` happily works on any OpenAPI definition, no matter how it is generated.
* No link to example generated HTML on the project page

## [Widdershins](https:/github.com/mermade/widdershins)

![Widdershins screenshot](https://github.com/Mermade/oa2s-comparison/blob/master/docs/widdershins.png?raw=true)

As above, `Widdershins` is written by the author of this blog post, and the author of `shins`, so you might want to stop
reading here!

### What Widdershins gets right

* All heading / metadata is shown, including oAuth authentication scopes
* Tag-level external docs are shown
* Response codes are linked to official RFC descriptions by default
* Code samples are shown for shell, HTTP, Javascript, Node.Js, Ruby, Python and Java by default
* Authentication methods for each operation are shown
* Responses are shown in both JSON and XML if matching `produces` MIME-types are detected
* Responses are shown as examples, not just schemas
* Each section and code-sample is built from user-overridable templates
* Code samples can be read from [vendor-extensions](https://github.com/Rebilly/ReDoc/blob/master/docs/redoc-vendor-extensions.md#operation-object-vendor-extensions)
within the OpenAPI definition
* No known markdown glitches
* Explicitly MIT Licensed
* Extensive test suite (almost 800 definitions)
* Processes JSON or YAML format definitions
* Configurable syntax highlighting themes (almost [70 themes](https://highlightjs.org/static/demo/))
* Available as a module on [npm](https://www.npmjs.com/package/widdershins)
* Has a defined and documented API for converting definitions programmatically

### Areas for improvement

* Because of the extensive metadata heading, the right-most panel looks empty at first glance
* Authentication information may be better rendered as tables
* `Widdershins` uses operationIds if available for the table-of-contents. This may not be optimal for human-readable documentation
* Complex types are shown as `Object`, not the model names
* Default code samples are very generic, and incomplete when it comes to required parameters
* `Widdershins` is in hindsight not the most descriptive name, and might imply it only works with `shins`. This is not the case,
`Widdershins` should work with the original Ruby `Slate` or any of its ports / forks / derivatives.