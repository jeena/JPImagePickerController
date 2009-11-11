//
//  UIImageResizing.h
//  JPImagePickerController
//
//  Created by Jeena on 07.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//
//  Most of this code is from http://stackoverflow.com/questions/603907/uiimage-resize-then-crop

#import <Foundation/Foundation.h>


@interface UIImage (Resize)

+ (UIImage *)image:(UIImage *)sourceImage scaleAndCroppForSize:(CGSize)targetSize;
- (UIImage *)scaleAndCropToSize:(CGSize)newSize;
- (UIImage *)scaleAndCropToSize:(CGSize)targetSize onlyIfNeeded:(BOOL)onlyIfNeeded;

+ (UIImage *)image:(UIImage *)image scaleToSize:(CGSize)newSize;
- (UIImage *)scaleToSize:(CGSize)newSize;
- (UIImage *)scaleToSize:(CGSize)targetSize onlyIfNeeded:(BOOL)onlyIfNeeded;

+ (BOOL)image:(UIImage *)sourceImage needsToScale:(CGSize)targetSize;
- (BOOL)needsToScale:(CGSize)targetSize;

@end
