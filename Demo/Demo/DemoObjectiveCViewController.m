//
//  DemoObjectiveCViewController.m
//  Demo
//
//  Created by HarryTran on 8/29/19.
//  Copyright © 2019 HarryTran. All rights reserved.
//

#import "DemoObjectiveCViewController.h"
#import <Translation/Translation.h>

@interface DemoObjectiveCViewController ()

@end

@implementation DemoObjectiveCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ICTTranslation *translation = [[ICTTranslation alloc] initWithGoogleAPIKey:@"AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4"];
    [translation translateText:@"Bonjour" completion:^(NSError * _Nullable error, NSString * _Nullable translated, NSString * _Nullable sourceLanguage) {
        NSLog(@"error -> %@", error);
        NSLog(@"translated -> %@", translated);
        NSLog(@"sourceLanguage -> %@", sourceLanguage);
    }];
    
    ICTTranslation *detectLanguage = [[ICTTranslation alloc] initWithGoogleAPIKey:@"AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4"];
    [detectLanguage detectLanguage:@"問題" completion:^(NSError * _Nullable error, NSString * _Nullable detectedSource, float confidence) {
        NSLog(@"error -> %@", error);
        NSLog(@"translated -> %@", detectedSource);
        NSLog(@"sourceLanguage -> %f", confidence);
    }];
    
    ICTTranslation *langs = [[ICTTranslation alloc] initWithGoogleAPIKey:@"AIzaSyCgyhS-Rz4QT9wH5gr0KlNej1Umldoq2D4"];
    [langs supportedLanguages:^(NSError * _Nonnull error, NSArray * _Nonnull languageCodes) {
        NSLog(@"translated -> %@", languageCodes);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
