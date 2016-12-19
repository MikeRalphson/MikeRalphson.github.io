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
[Slate]((https://github.com/lord/slate) (or one of its ports). Slate itself and its alternative implementations / ports will 
likely be the subject of a follow-up post on this blog.

Disclaimer: the author of this blog post is also the author of one of the tools compared (`widdershins`), and 
[shins](https://github.com/mermade/shins), the Node.js port of Slate used here to convert each tool's Slate markdown into HTML.

When I started `widdershins` I could not find any tools to directly convert OpenAPI / Swagger definitions to Slate, except for
`swagger2slate` which is written in PHP. Some weeks later on and two more tools, developed in Node.js (like `widdershins`) have
appeared, hence this comparison.

Because `shins` uses the common-mark compatible [markdown-it](https://github.com/markdown-it/markdown-it), as its markdown
processor, there may be differences in the rendered HTML compared to that produced by Ruby Slate.

Each tool may be optimised for a particular Slate CSS theme. This is not taken into account here.

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

* Some markdown is not common-mark compatible, which results in `shins` rendering it sub-optimally. This can be seen in unconverted
headings which are followed directly by `code` blocks. I think it is the simple lack of a blank line which causes this problem.
* Where some optional information in the OpenAPI definition is missing, `openapi2slate` renders `undefined` in the table-of-contents
footer.
* It would be nice to be able to call a documented API to produce the markdown programmatically, rather than only as a command-line
tool which outputs to STDOUT
* No option for code-samples

As documented in the project's [README](https://github.com/scrive/openapi2slate/blob/master/README.md), `openapi2slate` 
has a few limitations / design decisions to be aware of:

> Dereferncing(sic) is not properly implemented, instead it tries to dereference the file for you and use that. YMMV.
> API Schema works fairly OK, some features may be missing...
> We render things in Slate Markdown that fits our needs and customisations, so this may not work well for you!

