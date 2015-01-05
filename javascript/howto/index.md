---
layout: default
title: Dial Once JS SDK Documentation
published: true
---

Dial Once JS SDK
================

This document covers how to use the `Dial Once SDK` with the latest asynchronous syntax. With this version of the tracking code, you can also place the `Dial Once SDK` snippet higher in the page without delaying subsequent content from rendering.

### Installation guide

The `Dial Once SDK` snippet is a small piece of JavaScript code that you paste into your pages.

To begin using the `Dial Once SDK`, paste the following JavaScript snippet into your website template page.

{% highlight javascript %}
<script type="text/javascript">
    var _dialonceQ = _dialonceQ || {};
    _dialonceQ._setAppID = 'XXX-XXX-XXX-XXX';
    _dialonceQ._enableDevices = ['Mobile'];
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

The snippet above represents the minimum configuration needed to use the SDK asynchronously.  


### SDK Options

#### Geolocation

To be able to geolocate users, just add the following option in the features list of the Dial Once SDK in the global _dialonceQ variable, by adding this line of code in the JS snippet: 

{% highlight javascript %}
_dialonceQ._enableFeatures = ['Geoloc'];
{% endhighlight %}
