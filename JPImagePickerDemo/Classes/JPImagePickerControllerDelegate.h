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

@protocol JPImagePickerControllerDelegate 

- (void)imagePickerDidCancel:(JPImagePickerController *)picker;
- (void)imagePicker:(JPImagePickerController *)picker didFinishPickingWithImageNumber:(NSInteger)imageNumber;

@end
