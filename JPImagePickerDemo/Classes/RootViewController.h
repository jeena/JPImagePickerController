//
//  RootViewController.h
//  JPImagePickerDemo
//
//  Created by Jeena on 11.11.09.
//  Copyright Jeena Paradies 2009.
//  Licence: MIT-Licence
//

#import "JPImagePickerControllerDelegate.h"
#import "JPImagePickerControllerDataSource.h"

@interface RootViewController : UITableViewController <JPImagePickerControllerDelegate, JPImagePickerControllerDataSource> {
	NSInteger chosenImage;
	IBOutlet UIViewController *chosenImageController;
	IBOutlet UIImageView *chosenImageView;
}

@property (nonatomic, retain) IBOutlet UIViewController *chosenImageController;
@property (nonatomic, retain) IBOutlet UIImageView *chosenImageView;

@end
