---
layout: default
title: Dial Once Android SDK Documentation
published: true
---

Android SDK Documentation
===================================

[![Download](https://api.bintray.com/packages/dialonce/maven/dialonce-android/images/download.svg) ](https://bintray.com/dialonce/maven/dialonce-android/_latestVersion)

This document will guide you through the integration of the Dial Once SDK for Android.

You can find more information about the Android SDK [on the dedicated page](/android/specs).

Installation & Setup
--------------------

### Table of Contents

1.  [Introduction](#introduction)
2.  [Prerequisites](#prerequisites)
3.  [Android versions](#android-versions)
4.  [Installation](#installation)
  - [Gradle](#gradle-recommanded)
  - [Maven](#maven)
5.  [Proguard](#proguard)
6.  [Options](#options)

### Introduction

This document will guide you through the creation of a sample application using the Dial Once SDK library.

### Prerequisites

Before you start, be sure you have the following prerequisites:

- You need your Dial Once api key and secret
- The [Android SDK](http://developer.android.com/sdk/index.html) Bundle already installed and configured on your system

### Android versions

The Dial Once Android SDK supports Android 2.2+ (API Level 8) as the [minSdkVersion](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#min), but it must be compiled using Android 4.4 (API Level 20) or above as the [targetSdkVersion](http://developer.android.com/guide/topics/manifest/uses-sdk-element.html#target).

### Installation

Depending on your build system, the setup might be slightly different.

#### Gradle (recommanded)

The best way to install the Dial Once SDK for Android is to use gradle and jcenter. First add jcenter to your list of Maven repositories, if needed.

{% highlight javascript %}
allprojects {
    repositories {
        jcenter()
    }
}
{% endhighlight %}

Then, add the Dial Once SDK as a project dependency.

{% highlight javascript %}
dependencies {
    compile 'com.dialonce:dialonce-android:+'
}
{% endhighlight %}

Finally, add the following line to your application class in the `onCreate` method.

{% highlight java %}
DialOnce.init(this, "your_api_key_here");
{% endhighlight %}

#### Maven

The aar dependency requires the use of the `maven-android-plugin 3.8.1+` with `maven 3.1.1+`.

Maven repositories can be declared both in the global `settings.xml` and in projects `pom.xml` files. The pros and cons of the two approaches are largely debated (e.g. [Why Putting Repositories in your POMs is a Bad Idea](http://www.sonatype.com/people/2009/02/why-putting-repositories-in-your-poms-is-a-bad-idea/)).

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
  <version>1.2.2</version>
  <type>aar</type>
</dependency>
{% endhighlight %}

Finally, add the following line to your application class in the `onCreate` method.

{% highlight java %}
DialOnce.init(this, "your_api_key_here");
{% endhighlight %}

### ProGuard

Since DialOnce is already minified, please use these rules to not obsfuscate the code again to ensure the SDK is working as expected. Insert the following rules into your proguard config file:

{% highlight yaml %}
-keep class com.dialonce.** { *; }
-keep class com.android.internal.telephony.ITelephony { *; }
{% endhighlight %}

### Options

The Dial Once SDK exposes methods to give you the ability to fully enable or disable the interception flow.  
We recommand to always give the user some control about Dial Once.
You can use the following line of code with true or false as parameter (true to enable, false to disable):
{% highlight java %}
DialOnce.setEnableCallInterception(true);
{% endhighlight %}

Reporting Bugs or Feature Requests
----------------------------------

Please report any bugs or feature requests on the github issues page for this project here:

[https://github.com/dial-once/dialonce-android-sdk/issues](https://github.com/dial-once/dialonce-android-sdk/issues)