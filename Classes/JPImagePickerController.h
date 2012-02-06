//
//  JPImagePickerController.h
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import <UIKit/UIKit.h>
#import "JPImagePickerOverviewController.h"

@class JPImagePickerController, JPImagePickerOverviewController;

/*!
 @enum JPImagePickerControllerThumbnailSize
 @abstract Specifies the thumbnail width and height.
 @constant kJPImagePickerControllerThumbnailSizeWidth Thumbnail width 75 px.
 @constant kJPImagePickerControllerThumbnailSizeHeight Thumbnail height 75 px.
 */
enum JPImagePickerControllerThumbnailSize {
	kJPImagePickerControllerThumbnailSizeWidth = 75,
	kJPImagePickerControllerThumbnailSizeHeight = 75
};

/*!
 @enum JPImagePickerControllerPreviewImageSize
 @abstract Specifies the preview image width and height.
 @constant kJPImagePickerControllerPreviewImageSizeWidth Preview image width 320 px.
 @constant kJPImagePickerControllerPreviewImageSizeHeight Preview image height 420 px.
 */
enum JPImagePickerControllerPreviewImageSize {
	kJPImagePickerControllerPreviewImageSizeWidth = 320,
	kJPImagePickerControllerPreviewImageSizeHeight = 420
};

#pragma mark -

/*!
 @protocol JPImagePickerControllerDelegate
 @abstract Delegate protocol for the JPImagePickerController
 @discussion You have to implement this delegate in order to
 use the JPImagePickerController. This delegate is responsible
 for dismissing the picker on cancel or finished picking.
 */

@protocol JPImagePickerControllerDelegate <NSObject>
@optional

/*!
 @method imagePickerDidCancel:
 @abstract Called when picker did cancel
 @discussion This method is called when the user canceled picking.
 The delegate is responsible to dismiss the picker here.
 @param picker The picker which called this method.
 */
- (void)imagePickerDidCancel:(JPImagePickerController *)picker;

/*!
 @method imagePicker:didFinishPickingWithImageNumber:
 @abstract Called when the user picked a image.
 @discussion This method is called when the user die finish picking.
 The delegate is responsible to dismiss the picker here.
 @param picker The picker which called this method.
 @param imageNumber The number which image the user picked.
 */
- (void)imagePicker:(JPImagePickerController *)picker didFinishPickingWithImageNumber:(NSInteger)imageNumber;

@end



/*!
 @protocol JPImagePickerControllerDataSource
 @abstract The data source protocol for JPImagePickerController
 @discussion The JPImagePickerController asks this data source for all
 data which it wants to display.
 */

@protocol JPImagePickerControllerDataSource <NSObject>
@optional

/*!
 @method numberOfImagesInImagePicker:
 @abstract Should return the number of images.
 @discussion This method should return the number of images which the
 picker should display.
 @param picker The picker which called this method.
 */
- (NSInteger)numberOfImagesInImagePicker:(JPImagePickerController *)picker;

/*!
 @method imagePicker:thumbnailForImageNumber:
 @abstract Asks the data source for a thumbnail to insert in a particular location
 the image picker.
 @discussion This method should return a UIImage thumbnail for a image at the
 image number position. The image should have the width of kJPImagePickerControllerThumbnailWidth
 and height of kJPImagePickerControllerThumbnailWidth. If it is not that size the
 image picker will resize it so it fits.
 @param picker A picker-object requesting the thumbnail.
 @param imageNumber A image number locating the image in the picker.
 */
- (UIImage *)imagePicker:(JPImagePickerController *)picker thumbnailForImageNumber:(NSInteger)imageNumber;

/*!
 @method imagePicker:imageForImageNumber:
 @abstract Asks the data source for a image to show in a preview.
 @discussion This method should return a UIImage image for the preview at
 the image number position. The image should have the width of kJPImagePickerControllerPreviewImageWidth
 and height of kJPImagePickerControllerPreviewImageWidth. If it is not that size the
 image picker will resize it so it fits.
 @param picker A picker-object requesting the image.
 @param imageNumber A image number locating the image in the picker.
 */
- (UIImage *)imagePicker:(JPImagePickerController *)picker imageForImageNumber:(NSInteger)imageNumber;

@end

#pragma mark -

/*!
 @class JPImagePickerController
 @abstract A image picker view controller.
 @discussion A class which represents a image picker controller like apples UIImagePickerController
 but lets you use a external dataSource for the images.
 @updated 2009-11-14
 */

@interface JPImagePickerController : UIViewController {
	IBOutlet UINavigationController *modalNavigationController;
	UIStatusBarStyle originalStatusBarStyle; 
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
@property (nonatomic, readonly) UIStatusBarStyle originalStatusBarStyle;

/*!
 @property delegate
 @abstract The image picker's delegate object.
 @discussion The delegate receives notifications when the user picks an image,
 or exits the picker interface. The delegate also decides when to dismiss
 the picker interface, so you must provide a delegate to use a picker.
 If this property is nil, the picker is dismissed immediately if you try
 to show it.
 */
@property (nonatomic, assign) id<JPImagePickerControllerDelegate> delegate;

/*!
 @property dataSource
 @abstract The data source for the picker view.
 @discussion The data source must adopt the JPImagePickerControllerDataSource protocol
 and implement the required methods to return the number of components and the
 number of rows in each component.
 */
@property (nonatomic, assign) id<JPImagePickerControllerDataSource> dataSource;

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
