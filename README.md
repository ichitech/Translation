ICTKit
============

![License](https://cocoapod-badges.herokuapp.com/l/ICTKit/badge.(png|svg))
![Platforms](https://cocoapod-badges.herokuapp.com/p/ICTKit/badge.png)
[![Cocoapod Latest Version](http://img.shields.io/cocoapods/v/ICTKit.svg?style=flat)](https://cocoapods.org/?q=ICTKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<p align="left" >
  <img src="https://github.com/ngocbinh02/ICTKit/blob/master/demo.jpeg?raw=true" alt="ICTKit" title="ICTKit">
</p>

###Purpose

The Foundation framework defines a base layer of Objective-C classes. In addition to providing a set of useful primitive object classes, it introduces several paradigms that define functionality not covered by the Objective-C language. The Foundation framework is designed with these goals in mind:

Provide a small set of basic utility classes.
Make software development easier by introducing consistent conventions for things such as deallocation.
Support Unicode strings, object persistence, and object distribution.
Provide a level of OS independence, to enhance portability.
The Foundation framework includes the root object class, classes representing basic data types such as strings and byte arrays, collection classes for storing other objects, classes representing system information such as dates, and classes representing communication ports. See Cocoa Objective-C Hierarchy for Foundation for a list of those classes that make up the Foundation framework.

The Foundation framework introduces several paradigms to avoid confusion in common situations, and to introduce a level of consistency across class hierarchies. This consistency is done with some standard policies, such as that for object ownership (that is, who is responsible for disposing of objects), and with abstract classes like NSEnumerator. These new paradigms reduce the number of special and exceptional cases in an API and allow you to code more efficiently by reusing the same mechanisms with various kinds of objects.

Author: [Harry Tran](https://github.com/ngocbinh02/).

_Remark: This is my first iOS plugin project on github, please accept my apologize if any bad coding._

###Requirements
* ARC
* iOS 5.0+

###Installations

####Manual

1. Download or clone ICTKit, add source files into your project.
2. `#import <ICTKit/Kit.h>` whereever you need it.

####CocoaPods

(Unfamiliar with [CocoaPods](http://cocoapods.org/) yet? It's a dependency management tool for iOS and Mac, check it out!)

1. Add `pod 'ICTKit'` to your podfiles

####Carthage
Another dependency manager is [Carthage](http://github.com/Carthage/Carthage), which does not have a centralized repository.

###Easy Example
 
###More Examples

Please check the demo project I provided, with well explained example code inside.
 
###License
This code is distributed under the terms and conditions of the [MIT license](LICENSE). 


### What's coming up next?

1. ~~Submit to CocaPods~~
2. ~~Better performance.~~
3. __Your suggestions!:D__

