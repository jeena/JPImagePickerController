//
//  JPImagePickerController.h
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import <UIKit/UIKit.h>
#import "JPImagePickerControllerDelegate.h"
#import "JPImagePickerControllerDataSource.h"
#import "JPImagePickerOverviewController.h"

@protocol JPImagePickerControllerDelegate;
@protocol JPImagePickerControllerDataSource;
@class JPImagePickerOverviewController;

@interface JPImagePickerController : UIViewController {
	IBOutlet UINavigationController *modalNavigationController;
	JPImagePickerOverviewController *overviewController;
	UIStatusBarStyle statusBarStyle; 
	id<JPImagePickerControllerDelegate> delegate;
	id<JPImagePickerControllerDataSource> dataSource;
	NSString *imagePickerTitle;
}

@property (nonatomic, retain) IBOutlet UINavigationController *modalNavigationController;
@property (nonatomic, retain) JPImagePickerOverviewController *overviewController;
@property (nonatomic, readonly) UIStatusBarStyle statusBarStyle;
@property (nonatomic, retain) id<JPImagePickerControllerDelegate> delegate;
@property (nonatomic, retain) id<JPImagePickerControllerDataSource> dataSource;
@property (nonatomic, retain) NSString *imagePickerTitle;

- (void)cancelPicking:(id)sender;

@end
