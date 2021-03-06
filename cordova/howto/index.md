---
layout: default
title: Dial-Once Cordova plugin Documentation
published: true
---

Dial-Once Cordova plugin Documentation
=========================

This is a plugin that allows your Cordova or PhoneGap app to easily integrate the Dial-Once SDK. https://www.npmjs.com/package/cordova-plugin-dialonce

Supported platforms:
 - Android
 - iOS (coming soon)

Installation & Setup
--------------------

### Table of Contents

1.  [Prerequisites](#prerequisites)
2.	[Installation](#installation)
	-	[Cordova](#cordova)
	-	[PhoneGap](#phonegap)
3.	[Getting Started with Cordova](#getting-started-with-cordova)
4.	[Example](example)
5.	[API](#api)

### Prerequisites

Before you start, be sure you have the following prerequisites:

-   You need your Dial-Once API key
-   [Cordova](https://cordova.apache.org/docs/en/latest/guide/cli/) or [PhoneGap](http://docs.phonegap.com/getting-started/1-install-phonegap/cli/)  must be installed

## Installation

The Dial-Once SDK is brought in automatically if you provide `ANDROID_API_KEY` at plugin installation time but starting from version `2.6.16` `ANDROID_API_KEY` is optional and you can initialize SDK on demand with `navigator.dialonce.init(apiKey)`

### Cordova

| **Supported Cordova versions** | 4.0.0 and above |

To install the plugin in your Cordova app, run the following command:

    $ cordova plugin add cordova-plugin-dialonce@2.6.16 --variable ANDROID_API_KEY="<ANDROID_API_KEY>"

### PhoneGap

| **Supported PhoneGap versions** | 4.0.0 and above |

To add the plugin to your PhoneGap app, add the following snippet to your `config.xml`:

```xml
<gap:plugin name="cordova-plugin-dialonce" source="npm">
  <param name="ANDROID_API_KEY" value="<ANDROID_API_KEY>" />
</gap:plugin>
```

## Getting Started with Cordova

The Cordova command line tooling is based on node.js so first you’ll need to install node then you can install Cordova by executing:

	$ npm install -g cordova

### Create the App

Create a new app by executing:

	$ cordova create <project-name> [app-id] [app-name]

### Add platform(s)

Specify a set of target platforms by executing:

	$ cordova platform add <platform>

> The only available platform at the moment is Android, iOS is coming soon.

### Install the plugin

Install the dialonce-cordova plugin by executing:

	$ cordova plugin add cordova-plugin-dialonce --variable ANDROID_API_KEY="<ANDROID_API_KEY>"

## Example

	# Create initial Cordova app
	$ cordova create myApp
	$ cd myApp/
	$ cordova platform add android
	$ cordova plugin add cordova-plugin-dialonce --variable ANDROID_API_KEY="<ANDROID_API_KEY>"

## API

Dial-Once SDK works as an autonomous component. One thing which needs to be done is to request for permissions. This can be done by `navigator.dialonce.requestPermissions()` call.

This is important becuase beginning in Android 6.0 (API level 23), users grant permissions to apps while the app is running, not when they install the app. And without these permissions, the SDK will not able to work properly.

Also you can disable/enable SDK in run-time with `navigator.dialonce.setEnableCallInterception(boolean)` current state of SDK you can get from `navigator.dialonce.isCallInterceptionEnabled`. SDK didn't persist this state between app restart, once app started and SDK initialized it always ready to work: `navigator.dialonce.isCallInterceptionEnabled -> true`.

### Debugging

During the development process (especially for hybrid apps) WebView debugging ability is very important. But our SDK use WebView by itself, and it's very important for us to not allow debugging WebView debugging by default. To control it you can use `navigator.dialonce.setDebug (true | false)`, by default it's false even for debug build

Reporting Bugs or Feature Requests
----------------------------------

To report a bug or make a feature request, send us a mail to [publishers@dial-once.com](mailto:publishers@dial-once.com)
