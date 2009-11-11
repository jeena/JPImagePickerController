//
//  UIImageResizing.m
//  JPImagePickerController
//
//  Created by Jeena on 07.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import "UIImageResizing.h"


@implementation UIImage (Resizing)

+ (UIImage *)image:(UIImage *)sourceImage scaleAndCroppForSize:(CGSize)targetSize {

	UIImage *newImage = nil;        
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
	{
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor >= heightFactor) {
			scaleFactor = widthFactor; // scale to fit height
        } else {
			scaleFactor = heightFactor; // scale to fit width
		}
		
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
		
        // center the image
        if (widthFactor >= heightFactor)	{
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
		} else if (widthFactor < heightFactor)	{
			thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
		}
	}       
	
	UIGraphicsBeginImageContext(targetSize); // this will crop
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	if(newImage == nil) 
        NSLog(@"could not scale image");
	
	//pop the context to get back to the default
	UIGraphicsEndImageContext();
	
	return newImage;
}

- (UIImage *)scaleAndCropToSize:(CGSize)targetSize {
	return [UIImage image:self scaleAndCroppForSize:(CGSize)targetSize];
}

- (UIImage *)scaleAndCropToSize:(CGSize)targetSize onlyIfNeeded:(BOOL)onlyIfNeeded {
	
	UIImage *image;
	
	if (!onlyIfNeeded || [self needsToScale:targetSize]) {
		image = [self scaleAndCropToSize:targetSize];
	} else {
		image = self;
	}
	
	return image;
}

+ (UIImage *)image:(UIImage *)sourceImage scaleToSize:(CGSize)targetSize {
	
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetSize.width;
	CGFloat scaledHeight = targetSize.height;
	
	CGFloat widthFactor = targetSize.width / sourceImage.size.width;
	CGFloat heightFactor = targetSize.height / sourceImage.size.height;

	if (widthFactor < heightFactor) {
		scaleFactor = widthFactor; // scale to fit height
	} else {
		scaleFactor = heightFactor; // scale to fit width
	}
		
	scaledWidth  = sourceImage.size.width * scaleFactor;
	scaledHeight = sourceImage.size.height * scaleFactor;
	
	CGSize propperSize = CGSizeMake(scaledWidth, scaledHeight);
	
	UIGraphicsBeginImageContext( propperSize );
	[sourceImage drawInRect:CGRectMake(0, 0, propperSize.width, propperSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

- (UIImage *)scaleToSize:(CGSize)newSize {
	return [UIImage image:self scaleToSize:newSize];
}

- (UIImage *)scaleToSize:(CGSize)targetSize onlyIfNeeded:(BOOL)onlyIfNeeded {
	
	UIImage *image;
	
	if (!onlyIfNeeded || [self needsToScale:targetSize]) {
		image = [self scaleToSize:targetSize];
	} else {
		image = self;
	}
	
	return image;
}

+ (BOOL)image:(UIImage *)sourceImage needsToScale:(CGSize)targetSize {
	BOOL needsToScale = NO;
	
	if (sourceImage.size.width > targetSize.width) {
		needsToScale = YES;
	}
	
	if (sourceImage.size.height > targetSize.height) {
		needsToScale = YES;
	}
	
	return needsToScale;
}

- (BOOL)needsToScale:(CGSize)targetSize {
	return [UIImage image:self needsToScale:targetSize];
}


@end
