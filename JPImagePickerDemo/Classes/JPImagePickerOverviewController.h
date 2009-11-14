//
//  JPImagePickerOverviewController.h
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import <UIKit/UIKit.h>
#import "JPImagePickerController.h"
#import "JPImagePickerDetailController.h"
#import "UIImageResizing.h"

@class JPImagePickerController, JPImagePickerDetailController;
@protocol JPImagePickerControllerDelegate, JPImagePickerControllerDataSource;

@interface JPImagePickerOverviewController : UIViewController {
	JPImagePickerController *imagePickerController;
	JPImagePickerDetailController *detailController;
	IBOutlet UIScrollView *scrollView;
}

@property (nonatomic, retain, readonly) JPImagePickerController *imagePickerController;
@property (nonatomic, retain) JPImagePickerDetailController *detailController;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;


- (id)initWithImagePickerController:(JPImagePickerController *)newImagePickerController;
- (void)setImagePickerTitle:(NSString *)newTitle;
- (NSString *)imagePickerTitle;
- (IBAction)cancelPicking:(id)sender;
- (void)buttonTouched:(UIButton *)sender;

@end
