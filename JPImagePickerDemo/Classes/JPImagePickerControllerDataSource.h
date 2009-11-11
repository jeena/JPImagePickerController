//
//  JPImagePickerDataSourse.h
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JPImagePickerController.h"

@class JPImagePickerController;

@protocol JPImagePickerControllerDataSource

- (NSInteger)numberOfImagesInImagePicker:(JPImagePickerController *)picker;
- (UIImage *)imagePicker:(JPImagePickerController *)picker thumbnailForImageNumber:(NSInteger)imageNumber;
- (UIImage *)imagePicker:(JPImagePickerController *)picker imageForImageNumber:(NSInteger)imageNumber;

@end
