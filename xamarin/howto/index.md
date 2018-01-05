---
layout: default
title: Dial-Once Xamarin SDK Documentation
published: true
---

Xamarin SDK Documentation
=========================

This document will guide you through the integration of the Dial-Once SDK for Xamarin project.

## Supported platforms

- Android
- iOS (coming soon)

Installation & Setup
--------------------

### Table of Contents

1.  [Introduction](#introduction)
2.  [Prerequisites](#prerequisites)
3.  [Android versions](#android-versions)
4.  [Installation](#installation)

### Introduction

This document will guide you through the creation of a sample application using the Dial-Once SDK library.

### Prerequisites

Before you start, be sure you have the following prerequisites:

-   You need your Dial-Once API key
-   The [Xamarin.Android](https://developer.xamarin.com/guides/android/getting_started/installation/) Bundle already installed and configured on your system

### Android versions

The Dial-Once Android SDK supports Android 2.2+ (API Level 9) as the [minSdkVersion](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#min), but it must be compiled using Android 6.0 (API Level 23) or above as the [targetSdkVersion](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#target).

### Installation

The best way to install the Dial-Once SDK for Xamarin is to use nuget packet manager

 - via main menu: `Project` -> `Add NuGet Packages...`
 - or via context menu on project: `Add` -> `Add NuGet Packages...`
 - in search file type `DialOnce` and press `Add` button

Finally, add the following line to your Application class in the `onCreate` method.

```c#
DialOnce.Initialize("your_api_key_here");
```

Reporting Bugs or Feature Requests
----------------------------------

To report a bug or make a feature request, send us a mail to [publishers@dial-once.com](mailto:publishers@dial-once.com)
