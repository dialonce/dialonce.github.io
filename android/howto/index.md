---
layout: default
title: Dial-Once Android SDK Documentation
published: true
---

Android SDK Documentation
=========================

[![Download](https://api.bintray.com/packages/dialonce/maven/dialonce-android/images/download.svg) ](https://bintray.com/dialonce/maven/dialonce-android/_latestVersion)

This document will guide you through the integration of the Dial-Once SDK for Android.

You can find more information about the Android SDK [on the dedicated page](/android/specs).

Installation & Setup
--------------------

### Table of Contents

1.	[Introduction](#introduction)
2.	[Prerequisites](#prerequisites)
3.	[Android versions](#android-versions)
4.	[Installation](#installation)
	-	[Gradle](#gradle-recommanded)
	-	[Maven](#maven)
5.	[Request Runtime Permissions](#request-runtime-permissions)
6.	[Disable SDK](#enable--disable-sdk-at-run-time)
7.  [Environment switch](#environment-switch)
8.	[Proguard](#proguard)
9.	[Options](#options)

### Introduction

This document will guide you through the integration of the the Dial-Once SDK in an application.

### Prerequisites

Before you start, be sure you have the following prerequisites:

-	You need your Dial-Once api key
-	The [Android SDK](http://developer.android.com/sdk/index.html) Bundle already installed and configured on your system

### Android versions

The Dial-Once Android SDK supports Android 2.3+ (API Level 9) as the [minSdkVersion](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#min).

### Installation

Depending on your build system, the setup might be slightly different.

#### Gradle (recommended)

The best way to install the Dial-Once SDK for Android is to use gradle and jcenter. First add jcenter to your list of Maven repositories, if needed.

{% highlight javascript %}
allprojects {
  repositories {
    jcenter()
  }
}
{% endhighlight %}

Then, add the Dial-Once SDK as a project dependency.

{% highlight javascript %}
dependencies {
  compile 'com.dialonce:dialonce-android:+'
}
{% endhighlight %}

Finally, add the following line to your application class in the `onCreate` method.

{% highlight java %}
DialOnce.init(this, "your_api_key_here");
{% endhighlight %}

#### Maven (skip this step if you are using gradle)

The `aar` dependency requires the use of the `maven-android-plugin 4.+` with `maven 3.+`.

Maven repositories can be declared both in the global `settings.xml` and in projects `pom.xml` files. The pros and cons of the two approaches are largely debatable (e.g. [Why Putting Repositories in your POMs is a Bad Idea](http://www.sonatype.com/people/2009/02/why-putting-repositories-in-your-poms-is-a-bad-idea/)).

{% highlight xml %}
<profiles>
  <profile>
    <id>bintray</id>
    <repositories>
      <repository>
        <snapshots>
          <enabled>false</enabled>
        </snapshots>
        <id>central</id>
        <name>bintray</name>
        <url>http://jcenter.bintray.com/</url>
      </repository>
    </repositories>
    <pluginRepositories>
      <pluginRepository>
        <snapshots>
          <enabled>false</enabled>
        </snapshots>
        <id>central</id>
        <name>bintray-plugins</name>
        <url>http://jcenter.bintray.com/</url>
      </pluginRepository>
    </pluginRepositories>
  </profile>
</profiles>
<activeProfiles>
  <activeProfile>bintray</activeProfile>
</activeProfiles>
{% endhighlight %}

Then, inside the `<dependencies>` tag, add the following code to the `pom.xml`:

{% highlight xml %}
<dependency>
  <groupId>com.dialonce</groupId>
  <artifactId>dialonce-android</artifactId>
  <version>2.6.13</version>
  <type>aar</type>
</dependency>
{% endhighlight %}

Finally, add the following line to your application class in the `onCreate` method.

{% highlight java %}
DialOnce.init(this, "your_api_key_here");
{% endhighlight %}

### Request Runtime Permissions

Beginning in Android 6.0 (API level 23), users grant permissions to apps while the app is running, not when they install the app.

To request permissions you can simply call:

{% highlight java %}
DialOnce.requestPermissions(activity);
{% endhighlight %}

In case if you app have own permissions handling, you can simply request permissins below [with Android API](https://developer.android.com/training/permissions/requesting.html):

 - `Manifest.permission.CALL_PHONE`
 - `Manifest.permission.READ_PHONE_STATE`
 - `Manifest.permission.PROCESS_OUTGOING_CALLS`

In case if you will request permissions directly via Android API you are responsible to notify SDK about results by calling [`Dialonce.onRequestPermissionsResult`](/android/javadoc/) which have a similar signature as
[`Activity.onRequestPermissionsResult`](https://developer.android.com/reference/android/app/Activity.html#onRequestPermissionsResult(int, java.lang.String[], int[]))

Without these permissions, the SDK will not able to work properly.

### Enable / Disable SDK at Run-time

Sometimes you need to turn off / on SDK by some conditions, there is several API to do this:

 - [`DialOnce.disable()`](/android/javadoc/)
 - [`DialOnce.setEnableCallInterception(boolean)`](/android/javadoc/)

From end user point of view they both behave the same. Difference in the implementation details:

 - `DialOnce.disable()` - will disable BroadcastReceiver till next restart of the app. SDK will not get any dialer's intents, as result SDK will not perform call digitization.
 - `DialOnce.setEnableCallInterception(boolean)` - SDK will continue listen dialer's intents and collect analytics, but will not perform call digitization.

To rollback `DialOnce.disable()` app need to be restarted.
To rollback `DialOnce.setEnableCallInterception(false)` app just need to call `DialOnce.setEnableCallInterception(true)`

So `DialOnce.setEnableCallInterception(boolean)` much preferred to be able perform DialOnce SDK disabling

### ProGuard

Since DialOnce is already minified, please use these rules to not obfuscate the code again and to ensure the SDK is working as expected.

Insert the following rules into your proguard config file:

{% highlight yaml %}
-keep class com.dialonce.** { *; }
-keep class com.android.internal.telephony.ITelephony { *; }
-dontwarn okio.**
{% endhighlight %}

### Troubleshooting

__Conflict with dependency 'com.google.code.findbugs:jsr305'__<br>

| **SDK version** | 2.6.4 and above |

This means that your project contains `com.google.code.findbugs:jsr305` dependencies with different versions.
To fix this you can break transitive relationship like this:

{% highlight groovy %}
compile ('com.dialonce:dialonce-android:2.6.7') {
  exclude group: 'com.google.code.findbugs'
}
{% endhighlight %}

__Unable to start receiver com.dialonce.sdk.PhoneCallReceiver: java.lang.IllegalStateException: DialOnce library not initialized! Call DialOnce.init() method first!__<br>

| **SDK version** | [2.6.0, 2.6.5] |

Once you have added SDK dependency to your android project important to call `DialOnce.init` in `Application.onCreate` even if you wanna to disable SDK, otherwise it will lead to this crash.

To disable SDK you may use `DialOnce.setEnableCallInterception(false)`.

__Unable to start receiver com.dialonce.sdk.PhoneCallReceiver: java.lang.IllegalStateException: Android OS Issue. Application class should be initialized beforeBroadcastReceiver__<br>

| **SDK version** | 2.6.5 |

The same issue as above related to missing `DialOnce.init` in `Application.onCreate`

__java.lang.NoSuchMethodError: No static method getSerial()Ljava/lang/String__<br>

| **SDK version** | [2.6.5, 2.6.6] |

Affect devices with of Android 7.x and above, fixed in 2.6.7

__Broken deep-link handling__<br>

| **SDK version** | 2.6.8 and below |

Issue related to passing URI params in `Intent`'s data

__Broken digitization disablig__<br>

| **SDK version** | 2.6.11  |

Regression issue

Reporting Bugs or Feature Requests
----------------------------------

To report a bug or make a feature request, send us a mail to [publishers@dial-once.com](mailto:publishers@dial-once.com)
