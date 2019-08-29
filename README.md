Translation
============

![License](https://cocoapod-badges.herokuapp.com/l/Translation/badge.(png|svg))
![Platforms](https://cocoapod-badges.herokuapp.com/p/Translation/badge.png)
[![Cocoapod Latest Version](http://img.shields.io/cocoapods/v/Translation.svg?style=flat)](https://cocoapods.org/?q=Translation)

A simple iOS library for Google translation APIs.

## Quick Start (Google)

#### Objective-C
```objective-c

ICTTranslation *translation = [[ICTTranslation alloc] initWithGoogleAPIKey:<GOOGLE_API_KEY>];
[translation translateText:@"Bonjour" completion:^(NSError * _Nullable error, NSString * _Nullable translated, NSString * _Nullable sourceLanguage) {
        NSLog(@"error -> %@", error);
        NSLog(@"translated -> %@", translated);
        NSLog(@"sourceLanguage -> %@", sourceLanguage);
    }];
```

#### Swift
```swift

let translation = Translation(googleAPIKey: <GOOGLE_API_KEY>)
translation.translate(text: "Bonjour") { (error, translated, sourceLanguage) in
	print(error.debugDescription as Any)
        print(translated as Any)
        print(sourceLanguage as Any)
}
```

## Demo

1. Go to the Demo directory.
2. Open the `.xcworkspace` (**not the `.xcodeproj`!**) file.
3. Install Cocoapod
4. Run the app.

## Adding Translation to Your Project

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like Translation in your projects.

```ruby
platform :ios, '8.0'
pod "Translation"
```

### Source Files

Alternatively you can directly add the *Translation* folder to your project. Translation uses [AFNetworking](https://github.com/AFNetworking/AFNetworking) - your project needs this for it to work if you include it this way. CocoaPods install manages this dependency for you.


## Usage

### Initialize with Google...

#### Objective-C
```objective-c

ICTTranslation *translation = [[ICTTranslation alloc] initWithGoogleAPIKey:<GOOGLE_API_KEY>];
```

#### Swift
```swift

let translation = Translation(googleAPIKey: <GOOGLE_API_KEY>)
```

### Translate
#### Objective-C
```objective-c

[translation translateText:@"Bonjour" completion:^(NSError * _Nullable error, NSString * _Nullable translated, NSString * _Nullable sourceLanguage) {
        NSLog(@"error -> %@", error);
        NSLog(@"translated -> %@", translated);
        NSLog(@"sourceLanguage -> %@", sourceLanguage);
 }];
```

#### Swift
```swift

translation.translate(text: "Bonjour") { (error, translated, sourceLanguage) in
            print(error.debugDescription as Any)
            print(translated as Any)
            print(sourceLanguage as Any)
}
```

> Note that translations are one-shot operations. You need to instantiate a new `Translation` object for each translation.


### Detect Language

Detects the language and returns its ISO language code as the `detectedSource` parameter.

If initialized with Google, the completion handler also returns a float between 0 and 1 indicating the confidence of the match, with 1 being the highest confidence. This is not supported with Bing translate and will always returns `ICTTranslationUnknownConfidence`.

#### Objective-C
```objective-c

[detectLanguage detectLanguage:@"問題" completion:^(NSError * _Nullable error, NSString * _Nullable detectedSource, float confidence) {
	NSLog(@"error -> %@", error);
	NSLog(@"translated -> %@", detectedSource);
	NSLog(@"sourceLanguage -> %f", confidence);
}];
```

#### Swift
```swift

detectLanguage.detectLanguage(text: "問題") { (error, detectLanguage, val) in
    print(error.debugDescription as Any)
    print(detectLanguage as Any)
    print(val as Any)
}
```

### Get a List of Supported Languages

Google supports different languages. You can get a list of supported ISO language codes with the following function:

#### Objective-C
```objective-c

[langs supportedLanguages:^(NSError * _Nonnull error, NSArray * _Nonnull languageCodes) {
     NSLog(@"translated -> %@", languageCodes);
 }];
```

#### Swift
```swift

langs.supportedLanguages { (error, langs) in
     print(langs as Any)
}
```

## Fancy Stuff

### Specify Source or Target Language

The basic translation function makes a guess at the source language and specifies the target language based on the user's phone settings:

#### Objective-C
```objective-c

- (void)translateText:(NSString *)text
               target:(nullable NSString *)target
           completion:(ICTTranslationCompletionHandler)completion;
```

#### Swift
```swift

func translate(text: String, _ completion: (Error?, String?, String?)-> Void) -> Void
```

You can specify the source and/or the target languages if desired:
#### Objective-C
```objective-c
- (void)translateText:(NSString *)text
           withSource:(nullable NSString *)source
               target:(nullable NSString *)target
           completion:(ICTTranslationCompletionHandler)completion;
```

#### Swift
```swift

func translate(text: String, source: String, target: String, _ completion: (Error?, String?, String?)-> Void) -> Void
```
### Disable Smart Guessing

Usually you don't know the source language to translate from. Going by user's iPhone locale or keyboard language settings seems like the obvious answer, but it is unreliable: there's nothing stopping you from typing *Hola amigo!* with an English keyboard. This is common, especially with international users.

For this reason Translation will ignore the passed-in `source` parameter in the above function, if it determines a good guess can be made. Typically this means that the `text` parameter is complex and long enough for the engine to reliably determine the language. Short string snippets will typically respect the passed-in `source` parameter, if any.

To force Translation to always respect the `source` parameter, use the following property:
#### Objective-C
```objective-c
translation.preferSourceGuess = false;
```

#### Swift
```swift

translation.preferSourceGuess = false
```
> Note: Unless you definitely know the source language, I recommend leaving smart guessing on **AND** passing the source parameter if available as a hint to the language detector.


### User Throttles *(Google Only)*

For Google Translate, you can throttle usage on a per-user/device basis by setting a specific user identifier property in the `Translation` instance. See the specific [Google documentation](https://developers.google.com/console/help/new/#cappingusage) for more information.

#### Objective-C
```objective-c

@property (nonatomic, nullable) NSString *quotaUser;
```

#### Swift
```swift

var quotaUser: String?
```
	
### Cancel a Translation In Progress
#### Objective-C
```objective-c

- (void)cancel;
```

#### Swift
```swift

func cancel() -> Void
```

## Attributions

Translation uses the following projects:

- [PINCache](https://github.com/nicklockwood/XMLDictionary)
- [AFNetworking](https://github.com/pinterest/PINCache)
	- I also cribbed some parts of the README. Great job explaining CocoaPods usage guys!
	
## License

Translation is available under the MIT license. See the LICENSE file for more info.


