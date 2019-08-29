/*!
 @header    ICTTranslation.h
 @abstract  Translation iOS SDK Source
 @copyright Copyright 2019 IchiTech. All rights reserved.
 @version   1.0
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Error domain for ICTTranslation errors.
 */ 
typedef NSInteger ICTTranslationError;

/**
 * ICTTranslation specific error
 */
enum ICTTranslationError
{
    ICTTranslationErrorUnableToTranslate = 0,
    ICTTranslationErrorNetworkError = 1,
    ICTTranslationErrorSame = 2,
    ICTTranslationErrorTranslationInProgress = 3,
    ICTTranslationErrorAlreadyTranslated = 4,
    ICTTranslationErrorMissingCredentials = 5
} NS_SWIFT_NAME(TranslationError);

extern float const ICTTranslatorUnknownConfidence;

NS_SWIFT_NAME(Translation)
@interface ICTTranslation : NSObject

/**
 * Set to 'true' to enable source guessing, false to always respect the 'source' parameter in translate functions. Default true.
 */
@property (nonatomic) BOOL preferSourceGuess API_AVAILABLE(ios(8.0));

/**
 * Google API key, if any.
 */
@property (nonatomic, readonly) NSString *googleAPIKey API_AVAILABLE(ios(8.0));

/**
 * Optional quota throttle to use use with Google Translate.
 * https://developers.google.com/analytics/devguides/reporting/realtime/v3/parameters
 *
 */
@property (nonatomic, nullable) NSString *quotaUser;

typedef void (^ICTTranslationCompletionHandler)( NSError * _Nullable error, NSString * _Nullable translated, NSString * _Nullable sourceLanguage) NS_SWIFT_NAME(TranslationCompletionHandler) API_AVAILABLE(ios(8.0));

/**
 * Initialize translator with Google Translate.
 
 * @param key Google API key
 
 * @return ICTTranslation instance.
 */
- (instancetype) initWithGoogleAPIKey:(NSString *)key API_AVAILABLE(ios(8.0));

/**
 * Translate text.
 
 * The translator will attempt to guess the source language, and user the current iPhone locale for the target language.
 
 * @param text Text to translate.
 * @param completion Completion handler.
 */
- (void)translateText:(NSString *)text completion:(ICTTranslationCompletionHandler)completion NS_SWIFT_NAME(translate(text:_:)) API_AVAILABLE(ios(8.0));

/**
 * Translate text.
 
 * @param text Text to translate.
 * @param source ISO language code of the source text. Leave 'nil' to guess.
 * @param target ISO language code of the desired language output. Leave 'nil' to use iPhone's current locale.
 * @param completion Completion handler.
 
 * @discussion If the `preferSourceGuess` property is set to TRUE (default), the translator will ignore the passed-in `source` 
 * parameter (if any) if it determines a reliable guess can be made.
 */
- (void)translateText:(NSString *)text
           withSource:(nullable NSString *)source
               target:(nullable NSString *)target
           completion:(ICTTranslationCompletionHandler)completion NS_SWIFT_NAME(translate(text:source:target:_:)) API_AVAILABLE(ios(8.0));

- (void)translateText:(NSString *)text
               target:(nullable NSString *)target
           completion:(ICTTranslationCompletionHandler)completion NS_SWIFT_NAME(translate(text:target:_:)) API_AVAILABLE(ios(8.0));

/**
 * Detect text language.
 
 * @param text Text to analyze.
 * @param completion Completion handler.
 */
- (void)detectLanguage:(NSString *)text completion:(void (^)(NSError * _Nullable error, NSString * _Nullable detectedSource, float confidence))completion NS_SWIFT_NAME(detectLanguage(text:_:)) API_AVAILABLE(ios(8.0));

/**
 * Return a list of languages supported by either the Google or Bing service.
 * @param completion completion handler
 */
- (void)supportedLanguages:(void (^)(NSError *error, NSArray *languageCodes))completion NS_SWIFT_NAME(supportedLanguages(_:)) API_AVAILABLE(ios(8.0));

/**
 * Cancels the current translation.
 */
- (void)cancel API_AVAILABLE(ios(8.0));

/**
 * Flushes the translation cache.
 
 * Previous translation results are cached (on a per-target-language basis). Call this function to clear the cache.
 */
+ (void)flushCache API_AVAILABLE(ios(8.0));

/**
 Flush Azure credentials.
 
 This deletes the existing token, if any.
 */
+ (void)flushCredentials API_AVAILABLE(ios(8.0));

@end

NS_ASSUME_NONNULL_END
