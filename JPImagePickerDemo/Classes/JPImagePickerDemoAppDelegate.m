//
//  JPImagePickerDemoAppDelegate.m
//  JPImagePickerDemo
//
//  Created by Jeena on 11.11.09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "JPImagePickerDemoAppDelegate.h"
#import "JPImagePickerDemoViewController.h"

@implementation JPImagePickerDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
