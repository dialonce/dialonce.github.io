---
layout: default
title: Dial-Once iOS SDK Documentation
published: true
---

iOS SDK Documentation
=========================

[Download](https://cocoapods.org/pods/DialOnce)

This document will guide you through the integration of the Dial-Once SDK for iOS.

Installation & Setup
--------------------

### Table of Contents

1.	[Prerequisites](#prerequisites)
2.	[Supported versions](#android-versions)
3.	[Installation](#installation)
	- [Pod](#pod)
    - [Carthage](#carthage)

### Prerequisites

Before you start, be sure you have the following prerequisites:

- You need your Dial-Once api key
- [Xcode](https://developer.apple.com/download/) Bundle already installed and configured on your system
- Currently our SDK tested with `swift 4`, `swift 3.2` and `objective-c`

### Supported versions

The Dial-Once SDK for iOS supports iOS 8.0 as deployment target and we distribute SDK as static library + headers

### Installation

#### Cocoa Pods

Straightforward way To install the Dial-Once SDK for iOS is to use `CocoaPods` as package manager. Just add `DialOnce` pod to your target

{% highlight ruby %}
target 'MyTargetApp' do
  ...
  pod 'DialOnce'
end
{% endhighlight %}

Finally, add the following line to your application delegate class in the [`application(_:didFinishLaunchingWithOptions:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application) method.

{% highlight swift %}
DialOnce.setupWithApiKey(AppDelegate.apiKey)
{% endhighlight %}

Now your app is ready! For more information you can look at `DialOnce.h` 

#### Carthage

Not supported at this moment
