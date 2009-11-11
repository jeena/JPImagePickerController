//
//  JPImagePickerDemoAppDelegate.h
//  JPImagePickerDemo
//
//  Created by Jeena on 11.11.09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JPImagePickerDemoViewController;

@interface JPImagePickerDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JPImagePickerDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JPImagePickerDemoViewController *viewController;

@end

