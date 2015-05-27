---
layout: default
title: Dial Once Android SDK Specifications
---

Android SDK Specifications
==========================

### Table of Contents

1.	[How it works](#how-does-it-work)
2.	[SDK Weight](#what-is-the-footprint-on-your-application)
3.	[Integrating the SDK](#how-to-integrate-the-sdk-into-your-app)
4.	[Available platforms](#on-which-platform-is-the-dial-once-sdk-available)
5.	[Permissions](#which-permissions-are-required)

## How does it work?

The Dial Once SDK is integrated in your app and only runs during one of these actions:

1.	Calling a number
2.	Connecting the phone to a power supply
3.	Connecting to the internet

Dial Once uses these intents to launch itself and to perform tasks such as displaying the customer service interface or updating its local database. Then it shuts itself down and frees up the memory until the next action.

> Dial Once does not run in the background and does not turn your app into a battery-killer

What is the footprint on your application?
------------------------------------------

Currently, the Dial Once SDK has a total footprint of *64KB*.

> This is indicative and may change in the near future as we are constantly updating and adding new features.

How to integrate the SDK into your app?
---------------------------------------

Installing the SDK is simple as all you are adding is a single line of code. You can find a more technical explanation on [the SDK page](/android/howto).

On which platform is the Dial Once SDK available?
-------------------------------------------------

The SDK is available for Android. iOS and WP8 are coming soon.

Which permissions are required?
-------------------------------

We use advanced features of the Android platform so permissions are required:

-	`android.permission.INTERNET`
-	`android.permission.ACCESS_NETWORK_STATE`
-	`android.permission.CALL_PHONE`
-	`android.permission.PROCESS_OUTGOING_CALLS`
-	`android.permission.READ_PHONE_STATE`
-	`android.permission.VIBRATE`
-	`com.android.launcher.permission.INSTALL_SHORTCUT`

> You do not need to modify your app or add permissions since the SDK does it automatically.
