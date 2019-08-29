Translation
============

![License](https://cocoapod-badges.herokuapp.com/l/Translation/badge.(png|svg))
![Platforms](https://cocoapod-badges.herokuapp.com/p/Translation/badge.png)
[![Cocoapod Latest Version](http://img.shields.io/cocoapods/v/Translation.svg?style=flat)](https://cocoapods.org/?q=Translation)

## Translation

A simple iOS library for Google translation APIs.


## Quick Start (Google)

```objective-c
FGTranslator *translator = [[FGTranslator alloc] initWithGoogleAPIKey:@"your_google_key"];

[translator translateText:@"Bonjour!" 
               completion:^(NSError *error, NSString *translated, NSString *sourceLanguage)
{
	if (error)
    	NSLog(@"translation failed with error: %@", error);
	else
		NSLog(@"translated from %@: %@", sourceLanguage, translated);
}];
```

## Demo

1. Go to the FGTranslatorDemo directory.
2. Open the `.xcworkspace` (**not the `.xcodeproj`!**) file.
3. Run the app.

## Adding FGTranslator to Your Project

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like FGTranslator in your projects. See the ["Getting Started"](https://github.com/gpolak/FGTranslator/wiki/Installing-FGTranslator-via-CocoaPods) guide for more information.

```ruby
platform :ios, '6.0'
pod "FGTranslator"
```

### Source Files

Alternatively you can directly add the *FGTranslator* folder to your project. FGTranslator uses [AFNetworking](https://github.com/AFNetworking/AFNetworking) - your project needs this for it to work if you include it this way. CocoaPods install manages this dependency for you.


## Usage

### Initialize with Google...

```objective-c
FGTranslator *translator =
	[[FGTranslator alloc] initWithGoogleAPIKey:@"your_google_key"];
```

### Translate
```objective-c
[translator translateText:@"Bonjour!" completion:^(NSError *error, NSString *translated, NSString *sourceLanguage)
{
	if (error)
	{
    	NSLog(@"failed with error: %@", error);
	}
	else
	{
    	NSString *fromLanguage = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:sourceLanguage];
		NSLog(@"translated from %@: %@", fromLanguage, translated);
	}
}];
```

> Note that translations are one-shot operations. You need to instantiate a new `FGTranslator` object for each translation.


### Detect Language

Detects the language and returns its ISO language code as the `detectedSource` parameter.

If initialized with Google, the completion handler also returns a float between 0 and 1 indicating the confidence of the match, with 1 being the highest confidence. This is not supported with Bing translate and will always returns `FGTranslatorUnknownConfidence`.

```objective-c
[translator detectLanguage:@"Bonjour"
                completion:^(NSError *error, NSString *detectedSource, float confidence)
{
   if (error)
   {
       NSLog(@"failed with error: %@", error);
   }
   else
   {
       NSString *language = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:detectedSource];       
       NSString *confidenceMessage = confidence == FGTranslatorUnknownConfidence
           ? @"unknown"
           : [NSString stringWithFormat:@"%.1f%%", confidence * 100];
           
       NSLog(@"detected %@ with %@ confidence", language, confidenceMessage);
   }
}];
```

### Get a List of Supported Languages

Google and Bing Translate support different languages. You can get a list of supported ISO language codes with the following function:

```objective-c
[translator supportedLanguages:^(NSError *error, NSArray *languageCodes)
{
   if (error)
       NSLog(@"failed with error: %@", error);
   else
       NSLog(@"supported languages:%@", languageCodes);
}];
```

## Fancy Stuff

### Specify Source or Target Language

The basic translation function makes a guess at the source language and specifies the target language based on the user's phone settings:
```objective-c
- (void)translateText:(NSString *)text
           completion:(NSError *error, NSString *translated, NSString *sourceLanguage)completion;
```

You can specify the source and/or the target languages if desired:
```objective-c
- (void)translateText:(NSString *)text
           withSource:(NSString *)source
               target:(NSString *)target
           completion:(NSError *error, NSString *translated, NSString *sourceLanguage)completion;
```

### Disable Smart Guessing

Usually you don't know the source language to translate from. Going by user's iPhone locale or keyboard language settings seems like the obvious answer, but it is unreliable: there's nothing stopping you from typing *Hola amigo!* with an English keyboard. This is common, especially with international users.

For this reason FGTranslator will ignore the passed-in `source` parameter in the above function, if it determines a good guess can be made. Typically this means that the `text` parameter is complex and long enough for the engine to reliably determine the language. Short string snippets will typically respect the passed-in `source` parameter, if any.

To force FGTranslator to always respect the `source` parameter, use the following property:
```objective-c
translator.preferSourceGuess = NO;
```
> Note: Unless you definitely know the source language, I recommend leaving smart guessing on **AND** passing the source parameter if available as a hint to the language detector.


### User Throttles *(Google Only)*

For Google Translate, you can throttle usage on a per-user/device basis by setting a specific user identifier property in the `FGTranslator` instance. See the specific [Google documentation](https://developers.google.com/console/help/new/#cappingusage) for more information.

```objective-c
@property (nonatomic) NSString *quotaUser;
```
	
### Cancel a Translation In Progress
```objective-c
- (void)cancel;
```


## Attributions

FGTranslator uses the following projects:

- [PINCache](https://github.com/nicklockwood/XMLDictionary)
- [AFNetworking](https://github.com/pinterest/PINCache)
	- I also cribbed some parts of the README. Great job explaining CocoaPods usage guys!
	
## License

Translation is available under the MIT license. See the LICENSE file for more info.


