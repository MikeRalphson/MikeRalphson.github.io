---
layout: page
title: Mermade Software
tagline: A blog about APIs and other things
---
{% include JB/setup %}

## Latest Posts

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

This blog was created with [Jekyll Quick Start](http://jekyllbootstrap.com/usage/jekyll-quick-start.html).
More information [here](http://jekyllbootstrap.com)
    
## To-Do

This theme is still unfinished. If you'd like to be added as a contributor, [please fork](http://github.com/plusjade/jekyll-bootstrap)!
We need to clean up the themes, make theme usage guides with theme-specific markup examples.
