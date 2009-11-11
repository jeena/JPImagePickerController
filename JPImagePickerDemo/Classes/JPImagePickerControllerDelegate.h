//
//  JPImagePickerControllerDelegate.h
//  JPImagePickerController
//
//  Created by Jeena on 07.11.09.
//  Copyright 2009 Jeena Paradies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JPImagePickerController.h"

@class JPImagePickerController;

@protocol JPImagePickerControllerDelegate 

- (void)imagePickerDidCancel:(JPImagePickerController *)picker;
- (void)imagePicker:(JPImagePickerController *)picker didFinishPickingMediaWithImageNumber:(NSInteger)imageNumber;

@end
