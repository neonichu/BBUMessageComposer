//
//  BBUMessagePoster.h
//  BBUMessageComposer
//
//  Created by Boris Bügling on 20.07.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import <Accounts/Accounts.h>
#import <Foundation/Foundation.h>

@class BBUMessagePoster;

@protocol BBUMessagePosterDelegate <NSObject>

- (void)messageFailed:(BBUMessagePoster *)poster;
- (void)messageFailedAuthentication:(BBUMessagePoster *)poster;
- (void)messageSucceeded:(BBUMessagePoster *)poster;

@end

#pragma mark -

@interface BBUMessagePoster : NSObject

@property (nonatomic, weak) id<BBUMessagePosterDelegate> delegate;

+(NSArray*)accounts;
+(NSString*)lastAccountIdentifier;
+(NSInteger)maximumNumberOfImages;
+(NSInteger)messageMaximumLength;
+(NSString*)messageName;
+(NSString*)messageServiceName;
+(NSInteger)messageURLLength;

-(void)postMessage:(NSString*)message withImages:(NSArray*)images fromAccount:(ACAccount*)account;

@end
