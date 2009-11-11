//
//  JPImagePickerDemoAppDelegate.m
//  JPImagePickerDemo
//
//  Created by Jeena on 11.11.09.
//  Copyright Jeena Paradies 2009.
//  Licence: MIT-Licence
//

#import "JPImagePickerDemoAppDelegate.h"
#import "RootViewController.h"


@implementation JPImagePickerDemoAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

