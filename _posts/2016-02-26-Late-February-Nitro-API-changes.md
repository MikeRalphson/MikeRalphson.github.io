---
layout: post
title: Late February Nitro API changes
tagline: No new deprecations this time
category: null
tags:
  - bbc
  - nitro
  - api
  - bbc3
published: true

---
This update's most important change is a new value for the Programmes/availability_type filter (`fProgrammesAvailabiltyType`).

The new value is `webcast`, in addition to the previous option: `ondemand`

In the JSON API spec, a few rogue XML namespace prefixes (`n:`) have been removed.

The Nitro XSD schema also has a new element, `deployment_root` in the `availabilty_debug` element. I must admit I hadn't noticed this in the schema before, and I'm not exactly sure how to turn on debugging information in the availabilities feed or Nitro generally. Any feedback gratefully received. ;)

In iBL land, where BBCpuns abound, ibl-nibl powered by edibl has been updated several times, the current version is v1.00 r348.

```javascript
         "deprecations": {
           "deprecated": [
             {
-              "name": "n:version_types",
+              "name": "version_types",
               "type": "element",
               "deprecated_since": "2015-05-05",
-              "replaced_by": "n:types",
+              "replaced_by": "types",
               "replacement_type": "element"
             }
```