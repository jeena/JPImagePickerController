//
//  JPImagePickerDataSourse.h
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import <Foundation/Foundation.h>
#import "JPImagePickerController.h"

@class JPImagePickerController;


/*!
 @protocol JPImagePickerControllerDataSource
 @abstract The data source protocol for JPImagePickerController
 @discussion The JPImagePickerController asks this data source for all
 data which it wants to display.
 */

@protocol JPImagePickerControllerDataSource

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
 image number position.
 @param picker A picker-object requesting the thumbnail.
 @param imageNumber A image number locating the image in the picker.
 */
- (UIImage *)imagePicker:(JPImagePickerController *)picker thumbnailForImageNumber:(NSInteger)imageNumber;

/*!
 @method imagePicker:imageForImageNumber:
 @abstract Asks the data source for a image to show in a preview.
 @discussion This method should return a UIImage image for the preview at
 the image number position.
 @param picker A picker-object requesting the image.
 @param imageNumber A image number locating the image in the picker.
 */
- (UIImage *)imagePicker:(JPImagePickerController *)picker imageForImageNumber:(NSInteger)imageNumber;

@end
