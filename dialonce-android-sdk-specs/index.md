---
layout: default
title: Dial Once Android SDK Specifications
---

Android SDK Specifications
==========================

### Table of Contents

1.  [How it works](#how-does-it-work)
2.  [Including the SDK](#how-to-include-the-sdk-into-my-app)
3.  [Available platforms](#on-which-platform-the-dial-once-sdk-is-available)
4.  [Permissions](#which-permissions-are-required)

## How does it work?
The Dial Once SDK is included in your app and is running when the user makes various actions.  

Actions are:  

1. Calling a number
2. Wiring the phone to the computer
3. Getting internet connectivity

Dial Once uses these actions to launch himself and do some tasks like offering an improved customer service interface or updating his local database. Then it shuts himself down and is not present anymore in memory until the next action.

> Dial Once does not run in background and do not make your app a battery-killer

## How to include the SDK into my app?
Installing the SDK is as simple as adding a line into your project.
Find a more technical explanation on the SDK page [the SDK page](/dialonce-android-sdk).

## On which platform the Dial Once SDK is available?
For now, we only provide the SDK for Android phones, iOS and WP8 are coming soon.

## Which permissions are required?  
Because we use advanced features of the devices, some permissions are required. Note that you do not need to modify your app or add these permissions since the SDK is doing it by himself.  

Permissions are:

+ android.permission.INTERNET
+ android.permission.ACCESS_NETWORK_STATE
+ android.permission.CALL_PHONE
+ android.permission.PROCESS_OUTGOING_CALLS
+ android.permission.READ_PHONE_STATE
+ android.permission.ACCESS_FINE_LOCATION
+ android.permission.ACCESS_COARSE_LOCATION
+ com.android.launcher.permission.INSTALL_SHORTCUT