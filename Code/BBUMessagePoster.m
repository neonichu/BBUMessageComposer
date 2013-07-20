//
//  BBUMessagePoster.m
//  BBUMessageComposer
//
//  Created by Boris Bügling on 20.07.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "BBUMessagePoster.h"

@implementation BBUMessagePoster

+(NSArray *)accounts {
    return nil;
}

+(NSString *)lastAccountIdentifier {
    return nil;
}

+(NSInteger)maximumNumberOfImages {
    return 0;
}

+(NSInteger)messageMaximumLength {
    return 0;
}

+(NSString *)messageServiceName {
    return nil;
}

+(NSInteger)messageURLLength {
    return 0;
}

#pragma mark -

-(void)postMessage:(NSString *)message withImages:(NSArray *)images fromAccount:(ACAccount *)account {
    [self doesNotRecognizeSelector:_cmd];
}

@end
