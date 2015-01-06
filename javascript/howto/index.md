---
layout: default
title: Dial Once JS TAG Documentation
published: true
---

Dial Once JS TAG
================

This document covers how to use the `Dial Once TAG` with the latest asynchronous syntax. With this version of the tracking code, you can also place the `Dial Once TAG` snippet higher in the page without delaying subsequent content from rendering.

### Installation guide

The `Dial Once TAG` snippet is a small piece of JavaScript code that you paste into your pages.

To begin using the `Dial Once TAG`, paste the following JavaScript snippet into your website template page.

{% highlight javascript %}
<script type="text/javascript">
    var _dialonce = _dialonce || {};
    _dialonce.setAppID = 'XXX-XXX-XXX-XXX';
    _dialonce.enableDevices = ['Mobile'];
    (function() {
        var dialonce = document.createElement('script');
        dialonce.type = 'text/javascript';
        dialonce.async = true;
        dialonce.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'd3ayv6nsn4rwn3.cloudfront.net/js/dialonce.js';
        var script = document.getElementsByTagName('script')[0];
        script.parentNode.insertBefore(dialonce, script);
    })();
</script>
{% endhighlight %}

The snippet above represents the minimum configuration needed to use the TAG asynchronously.  


### TAG Options

#### Geolocation

To be able to geolocate users, just add the following option in the features list of the Dial Once TAG in the global _dialonceQ variable, by adding this line of code in the JS snippet: 

{% highlight javascript %}
_dialonce.enableFeatures = ['Geoloc'];
{% endhighlight %}