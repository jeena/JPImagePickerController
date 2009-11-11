//
//  JPImagePickerDetailController.m
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import "JPImagePickerDetailController.h"


@implementation JPImagePickerDetailController

@synthesize previewImageView, overviewController, imageNumber;

#define PREVIEW_IMAGE_WIDTH 320
#define PREVIEW_IMAGE_HEIGHT 420

- (id)initWithOverviewController:(JPImagePickerOverviewController *)newOverviewController {
	if (self = [super initWithNibName:@"JPImagePickerDetailController" bundle:nil]) {
        // Custom initialization
		overviewController = newOverviewController;
		imageNumber = -1;
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	originalStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self prepareForImageNumber:imageNumber];
}

/*
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}
*/
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)prepareForImageNumber:(NSInteger)newImageNumber {
	imageNumber = newImageNumber;
	previewImageView.image = [[overviewController.imagePickerController.dataSource imagePicker:overviewController.imagePickerController imageForImageNumber:imageNumber] scaleToSize:CGSizeMake(PREVIEW_IMAGE_WIDTH, PREVIEW_IMAGE_HEIGHT) onlyIfNeeded:YES];
}

- (IBAction)cancelPreview:(id)sender {
	[[UIApplication sharedApplication] setStatusBarStyle:originalStatusBarStyle animated:YES];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)finishedPicking:(id)sender {
	[[UIApplication sharedApplication] setStatusBarStyle:overviewController.imagePickerController.statusBarStyle animated:YES];
	[overviewController.imagePickerController.delegate imagePicker:overviewController.imagePickerController didFinishPickingWithImageNumber:imageNumber];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
