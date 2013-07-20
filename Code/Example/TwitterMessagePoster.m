//
//  TwitterMessagePoster.m
//  BBUMessageComposer
//
//  Created by Boris Bügling on 20.07.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "TwitterMessagePoster.h"

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

+(NSString *)messageServiceName {
    return @"Twitter";
}

+(NSInteger)messageURLLength {
    // https://dev.twitter.com/docs/tco-url-wrapper
    return 20;
}

@end
