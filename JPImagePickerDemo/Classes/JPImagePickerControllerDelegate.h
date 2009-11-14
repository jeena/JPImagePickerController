//
//  JPImagePickerControllerDelegate.h
//  JPImagePickerController
//
//  Created by Jeena on 07.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import <Foundation/Foundation.h>
#import "JPImagePickerController.h"

@class JPImagePickerController;

/*!
 @protocol JPImagePickerControllerDelegate
 @abstract Delegate protocol for the JPImagePickerController
 @discussion You have to implement this delegate in order to
 use the JPImagePickerController. This delegate is responsible
 for dismissing the picker on cancel or finished picking.
 */

@protocol JPImagePickerControllerDelegate 

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
