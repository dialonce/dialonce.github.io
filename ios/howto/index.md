---
layout: default
title: Dial Once iOS SDK Documentation
published: true
---

iOS SDK Documentation
=========================

[Download](https://cocoapods.org/pods/DialOnce)

This document will guide you through the integration of the Dial Once SDK for iOS.

Installation & Setup
--------------------

### Table of Contents

1.	[Prerequisites](#prerequisites)
2.	[Supported versions](#android-versions)
3.	[Installation](#installation)
	-	[Pod](#pod)
  - [Carthage](#carthage)

### Prerequisites

Before you start, be sure you have the following prerequisites:

-	You need your Dial Once api key
-	[Xcode](https://developer.apple.com/download/) Bundle already installed and configured on your system
- Currently our SDK tested only with `swift 4`. Integration with `objective-c`, may works also but it's not guaranteed

### Supported versions

The Dial Once SDK for iOS supports iOS 8.0 as deployment target

### Installation

Depending on your package manager, the setup might be slightly different.

#### Cocoa Pods

Straightforward way To install the Dial Once SDK for iOS is to use `CocoaPods` as package manager. Just add `DialOnce` pod to your target

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

#### Carthage

Because our SDK distributed as fat framework, to integrate with `Carthage` you can simply get specific release

```
binary "https://github.com/dial-once/sdk-ios-pod/archive/1.0.0.zip"
```