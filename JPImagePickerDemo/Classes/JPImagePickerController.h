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

/*!
 @class JPImagePickerController
 @abstract A image picker view.
 @discussion A class which represents a image picker controller like apples UIImagePickerController
 but lets you use a external dataSource for the images.
 @updated 2009-11-11
 */

@interface JPImagePickerController : UIViewController {
	IBOutlet UINavigationController *modalNavigationController;
	JPImagePickerOverviewController *overviewController;
	UIStatusBarStyle statusBarStyle; 
	id<JPImagePickerControllerDelegate> delegate;
	id<JPImagePickerControllerDataSource> dataSource;
	NSString *imagePickerTitle;
}

/*!
 @property modalNavigationController
 @abstract The additional navigation controller.
 @discussion We need it to be able to view a navigation when the user
 picks a image.
 */
@property (nonatomic, retain) IBOutlet UINavigationController *modalNavigationController;

/*!
 @property overviewController
 @abstract Controller for the scrollView.
 @discussion This controller holds the scrollView with all the buttons which
 represent the images.
 */
@property (nonatomic, retain) JPImagePickerOverviewController *overviewController;

/*!
 @property overviewController
 @abstract Original StatusBarStyle at the beginning.
 @discussion This property saves the UIStatusBarStyle at the beginning, so that
 we'll be able to change it back when we dismiss the image picker.
 */
@property (nonatomic, readonly) UIStatusBarStyle statusBarStyle;

/*!
 @property delegate
 @abstract The image picker's delegate object.
 @discussion The delegate receives notifications when the user picks an image,
 or exits the picker interface. The delegate also decides when to dismiss
 the picker interface, so you must provide a delegate to use a picker.
 If this property is nil, the picker is dismissed immediately if you try
 to show it.
 */
@property (nonatomic, retain) id<JPImagePickerControllerDelegate> delegate;

/*!
 @property dataSource
 @abstract The data source for the picker view.
 @discussion The data source must adopt the JPImagePickerControllerDataSource protocol
 and implement the required methods to return the number of components and the
 number of rows in each component.
 */
@property (nonatomic, retain) id<JPImagePickerControllerDataSource> dataSource;

/*!
 @property imagePickerTitle
 @abstract The image picker title.
 @discussion You can set the title for the image overview here.
 */
@property (nonatomic, retain) NSString *imagePickerTitle;

/*!
 @method cancelPicking:
 @param sender The button which sends the action.
 */
- (void)cancelPicking:(id)sender;

@end

