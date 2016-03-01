---
layout: post
title: Nitro goes on a January diet
tagline: Deprecated features (finally) removed
category: APIs
tags:
  - bbc
  - nitro
  - deprecations
  - API
  - bbcstore
published: true

---
<img align="left" src="/images/bbc_diet.jpg">
Another January update to the BBC's Nitro programmes API.

The major focus of this update appears to be to remove long-deprecated features.

Filters, sorts and mixins which have been deprecated since 2013 and 2014 have now been removed. These 'dinosaurs' have been hanging around giving the lie to the the BBC's stated "Nitro will change" policy. In slimming down, is Nitro inching closer to a public release?

Another hint in that direction is the appearance of more draft documentation (confusingly under the 'Programmes API' rather than 'Nitro' heading) at [https://developer.bbc.co.uk/content/programmes-api](the developer.bbc.co.uk website).

This documentation itself states that the /Broadcasts feed will be deprecated at some point in the future, and that clients should use the /Schedules feed instead.

The one new filter added this release is ````/Programmes/payment_type```` which takes one of three values: ````free````, ````bbcstore```` and ````uscansvod````. The latter being for a US/Canada video-on-demand service?

#### Summary ####

Added:
````
fProgrammesPaymentType
````

Removed:
````
fProgrammesAvailabilityTo
fProgrammesInitialLetterStop
sProgrammesMostPopular
mProgrammesPeople
````