---
layout: post
title: An undocumented Nitro feed
tagline: null
category: null
tags:
  - bbc
  - nitro
  - api
published: true

---
Just added to the Open Nitro SDK is a new (?) undocumented feed: `programme_details`.

This feed is a simple way of obtaining details from the `programmes` feed for a particular `pid`
without having to specify a number of mixins. It may be present for cacheability reasons, i.e. 
to improve performance on a very common use-case.

Information for `ancestor_titles`, `available_versions` (including the new `territory` attribute),
`available_webcasts`, `available_simulcasts` and `genre_groupings` is returned as per the 
existing mixins on the `programmes` feed.

It only accepts the common `page` and `page_size` filters, as well as `partner_pid`.

Speaking of `partner_pid`, a new partner pid `s0000024` for internal BBC programmes / clips was
recently added. `s0000025` is now being used for ITV programmes broadcast on the BBC-Extra SVOD 
service in the US / Canada (`payment_type` = `uscansvod`). Update: BBC-Extra appears to have
been rebranded as [BritBox](https://www.theguardian.com/media/2016/dec/13/bbc-and-itv-to-launch-britbox-on-demand-service-in-us).

Being undocumented, this information is subject to change without notice.
