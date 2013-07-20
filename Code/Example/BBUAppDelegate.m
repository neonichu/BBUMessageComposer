//
//  BBUAppDelegate.m
//  BBUMessageComposer
//
//  Created by Boris Bügling on 20.07.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "BBUAppDelegate.h"
#import "BBUMessageComposeViewController.h"
#import "UIView+Geometry.h"

@implementation BBUAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.width = 200.0;
    button.height = 44.0;
    button.x = (self.window.width - button.width) / 2.0;
    button.y = (self.window.height - button.height) / 2.0;
    [button addTarget:self action:@selector(openMessageComposer) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Open" forState:UIControlStateNormal];
    [self.window.rootViewController.view addSubview:button];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)openMessageComposer
{
    BBUMessageComposeViewController* messageComposer = [BBUMessageComposeViewController new];
    [self.window.rootViewController presentViewController:messageComposer animated:YES completion:NULL];
}

@end
