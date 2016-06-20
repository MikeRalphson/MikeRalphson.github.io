---
layout: post
title: iBL schema tweak
tagline: null
category: null
tags:
  - bbc
  - iBL
  - api
published: true

---
On Thursday 16/06/16, the BBC iBL team released iBL v1.00 r388. This contained an error in the JSON schema,
which indicates this file is hand-generated, and not validated against the JSON-schema schema.

````javascript
diff --git a/iblApi/ibl.json b/iblApi/ibl.json
index 94bd369..82c4f79 100644
--- a/iblApi/ibl.json
+++ b/iblApi/ibl.json
@@ -518,6 +518,19 @@
         "$ref": "#/definitions/store_version"
       }
     },
+    "next": {
+      "type": "object",
+      "properties": {
+        "programme": {
+          "type": "array"
+        },
+        "items": {
+          "$ref": "#/definitions/episode"
+        },
+        "minItems": 0,
+        "maxItems": 1
+      }
+    },
````

The items and minItems / maxItems entries should be within the `programme` element.

This was reported to the iBL team on Friday the 17/06/16 and was fixed in release 389 on
Monday the 20th.

parseIblApi now validates both the JSON schema, and the resultant Swagger 2.0 spec to guard against 
similar errors in the future.

A small error in the description and start/end dates of the `radio_10` linear service in the Nitro
feed was also reported, but is still outstanding.
