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
    _dialonce.token = 'XXX-XXX-XXX-XXX';
    _dialonce.enableDevices = ['Mobile'];
    (function() {
        var dialonce = document.createElement('script');
        dialonce.id = 'dialonce-sdk'
        dialonce.type = 'text/javascript';
        dialonce.async = true;
        dialonce.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'd3ayv6nsn4rwn3.cloudfront.net/js/dialonce.min.js';
        var script = document.getElementsByTagName('script')[0];
        script.parentNode.insertBefore(dialonce, script);
    })();
</script>
{% endhighlight %}

The snippet above represents the minimum configuration needed to use the TAG asynchronously.  


### TAG Options

#### Query Selector

You can choose a target specific elements to improve performances. If you do this only specific elements will be parsed. In order to do this, you can add one or multiple CSS selector(s):


**Specific block**
{% highlight javascript %}
_dialonce.querySelector = '#contact-block';
{% endhighlight %}

**Multiple CSS selectors**
{% highlight javascript %}
_dialonce.querySelector = '.contact-zone a.number, .contact-zone button.number';
{% endhighlight %}

**Simple CSS selector**
{% highlight javascript %}
_dialonce.querySelector = 'a.phone-number';
{% endhighlight %}

#### Devices

You can choose on which kind of devices the SDK will be enabled, by adding or removing property of the following parameter:

{% highlight javascript %}
_dialonce.devices = ['Mobile', 'Tablet', 'Desktop'];
{% endhighlight %}

#### Geolocation

To be able to geolocate users, just add the following option in the features list of the Dial Once SDK in the global _dialonce variable, by adding this line of code in the JS snippet:

{% highlight javascript %}
_dialonce.features = ['Geolocation'];
{% endhighlight %}
