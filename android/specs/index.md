---
layout: default
title: Dial-Once Android SDK Specifications
---

Android SDK Specifications
==========================

### Table of Contents

1.  [How it works](#how-does-it-work)
2.  [SDK Weight](#what-is-the-footprint-on-your-application)
3.  [Dependencies](#what-are-the-underlying-dependencies)
4.  [Integrating the SDK](#how-to-integrate-the-sdk-into-your-app)
5.  [Available platforms](#on-which-platform-is-the-dial-once-sdk-available)
6.  [Supported versions](#what-are-the-supported-android-versions)
7.  [Permissions](#which-permissions-are-required)
8.  [SDK Communications](#how-data-is-transmitted-to-dial-once)

How does it work?
-----------------

The Dial-Once SDK is integrated in your app and only runs during one of these actions:

1.  Calling a number
2.  Connecting the phone to a power supply
3.  Connecting to the internet

Dial-Once uses these intents to launch itself and to perform tasks such as displaying the customer service interface or updating its local database. Then it shuts itself down and frees up the memory until the next action.

> Dial-Once does not run in the background and does not turn your app into a battery-killer

What is the footprint on your application?
------------------------------------------

Currently (as of v2.6.12), the Dial-Once SDK has a total weight of *174KB*.

> This is indicative and may change in the near future as we are constantly updating and adding new features.

What are the underlying dependencies?
------------------------------------------

Current version (v2.6.12) has the following dependency tree:
{% highlight md %}
+--- com.bugsnag:bugsnag-android:3.9.0
|    \--- com.android.support:support-annotations:25.3.1 -> 25.4.0
+--- com.google.code.gson:gson:2.8.2
+--- com.squareup.okhttp3:okhttp:3.8.0
|    \--- com.squareup.okio:okio:1.13.0
+--- io.socket:socket.io-client:0.8.3
|    \--- io.socket:engine.io-client:0.8.3
+--- com.google.code.findbugs:jsr305:3.0.2
\--- com.android.support:support-v4:25.4.0

{% endhighlight %}

How to integrate the SDK into your app?
---------------------------------------

Installing the SDK is simple as all you are adding is a single line of code. You can find a more technical explanation on [the SDK page](/android/howto).

On which platform is the Dial-Once SDK available?
-------------------------------------------------

The SDK is available for Android. iOS and WP8 are coming soon.

What are the supported Android versions?
-------------------------------------------------

We support Android API version 9 and more.

Which permissions are required?
-------------------------------

We use advanced features of the Android platform so permissions are required:

- `android.permission.INTERNET`
- `android.permission.ACCESS_NETWORK_STATE`
- `android.permission.CALL_PHONE`
  - Allows us to initiate a phone call without going through the Dialer
- `android.permission.PROCESS_OUTGOING_CALLS`
  - Allows us to modify or abort outgoing calls (used to display our interfaces)
- `android.permission.READ_PHONE_STATE`
  - Allows read only access to phone state
- `android.permission.VIBRATE`
- `android.permission.GET_TASKS`
  - Old versions throw warnings for this not being declared so we include it to avoid that (the users will also not be prompted)
- `com.android.launcher.permission.INSTALL_SHORTCUT`

> You do not need to modify your app or add permissions since the SDK does it automatically.


How data is transmitted to Dial-Once?
-------------------------------

We only transfer anonymous user data over secured TCP connections (wss and https).
As soon as we check that the device is up to date with our database, we put the device to sleep through a socket secured channel connection, and all communications with Dial-Once are stopped for a large amount of time: not consuming the user battery.
Each user have a token that can be revoked anytime server side.
