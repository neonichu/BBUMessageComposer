//
//  TwitterMessagePoster.m
//  BBUMessageComposer
//
//  Created by Boris Bügling on 20.07.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import <Social/Social.h>

#import "TwitterMessagePoster.h"

static NSString * const TWPostURLString             = @"https://api.twitter.com/1.1/statuses/update.json";
static NSString * const TWPostWithImagesURLString   = @"https://api.twitter.com/1.1/statuses/update_with_media.json";
static NSString * const TWStatusKey                 = @"status";

@implementation TwitterMessagePoster

+(NSArray *)accounts {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *twitterAccountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    return [accountStore accountsWithAccountType:twitterAccountType];
}

+(NSString*)lastAccountIdentifier {
    return @"DETweetLastAccountIdentifier";
}

+(NSInteger)maximumNumberOfImages {
    return 1;
}

+(NSInteger)messageMaximumLength {
    return 140;
}

+(NSString *)messageName {
    return @"Tweet";
}

+(NSString *)messageServiceName {
    return @"Twitter";
}

+(NSInteger)messageURLLength {
    // https://dev.twitter.com/docs/tco-url-wrapper
    return 20;
}

#pragma mark -

-(void)informDelegateOfStatusCode:(NSNumber*)statusCode {
    if ([statusCode intValue] >= 200 && [statusCode intValue] < 300) {
        [self.delegate messageSucceeded:self];
    } else {
        [self.delegate messageFailed:self];
    }
}

-(void)postMessage:(NSString *)message withImages:(NSArray *)images fromAccount:(ACAccount *)account {
    NSAssert(account, @"No account specified");
    
    SLRequest* request = nil;
    
    if (images.count > 0) {
        request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                     requestMethod:SLRequestMethodPOST
                                               URL:[NSURL URLWithString:TWPostWithImagesURLString]
                                        parameters:nil];
        
        [images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString* filename = [NSString stringWithFormat:@"image_%d.png", idx];
            [request addMultipartData:UIImagePNGRepresentation((UIImage*)obj)
                             withName:@"media[]" type:@"multipart/form-data" filename:filename];
        }];
        
        [request addMultipartData:[message dataUsingEncoding:NSUTF8StringEncoding]
                         withName:TWStatusKey type:@"multipart/form-data" filename:nil];
    } else {
        NSDictionary* parameters = @{ TWStatusKey: message };
        request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                     requestMethod:SLRequestMethodPOST
                                               URL:[NSURL URLWithString:TWPostURLString]
                                        parameters:parameters];
    }
    
    account.accountType = [[ACAccountStore new] accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    request.account = account;
    
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        NSInteger statusCode = urlResponse.statusCode;
        
        NSString* text = nil;
        if (responseData) {
            text = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        } else {
            text = error.localizedDescription;
        }
        
        [self performSelectorOnMainThread:@selector(informDelegateOfStatusCode:) withObject:@(statusCode) waitUntilDone:NO];
        
        NSLog(@"Request result: %d, %@", statusCode, text);
    }];
}

@end
