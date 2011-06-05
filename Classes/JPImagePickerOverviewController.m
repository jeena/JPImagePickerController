//
//  JPImagePickerOverviewController.m
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import "JPImagePickerOverviewController.h"


@implementation JPImagePickerOverviewController

@synthesize imagePickerController, detailController, scrollView;

#define PADDING_TOP 44
#define PADDING 4
#define THUMBNAIL_COLS 4

- (id)initWithImagePickerController:(JPImagePickerController *)newImagePickerController {
    if (self = [super initWithNibName:@"JPImagePickerOverviewController" bundle:nil]) {
        // Custom initialization
		imagePickerController = newImagePickerController;
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setImagePickerTitle:imagePickerController.imagePickerTitle];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self
                                                                                  action:@selector(cancelPicking:)];
    self.navigationItem.rightBarButtonItem = cancelButton;
    [cancelButton release];	
	
	UIButton *button;
	UIImage *thumbnail;
	int images_count = [imagePickerController.dataSource numberOfImagesInImagePicker:imagePickerController];
	
	for (int i=0; i<images_count; i++) {
		thumbnail = [[imagePickerController.dataSource imagePicker:imagePickerController thumbnailForImageNumber:(NSInteger)i]
					 scaleAndCropToSize:CGSizeMake(kJPImagePickerControllerThumbnailSizeWidth, kJPImagePickerControllerThumbnailSizeHeight)
					 onlyIfNeeded:NO];
		
		button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setImage:thumbnail forState:UIControlStateNormal];
		button.showsTouchWhenHighlighted = YES;
		button.userInteractionEnabled = YES;
		[button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
		button.tag = i;
		button.frame = CGRectMake(kJPImagePickerControllerThumbnailSizeWidth * (i % THUMBNAIL_COLS) + PADDING * (i % THUMBNAIL_COLS) + PADDING,
								  kJPImagePickerControllerThumbnailSizeHeight * (i / THUMBNAIL_COLS) + PADDING * (i / THUMBNAIL_COLS) + PADDING + PADDING_TOP,
								  kJPImagePickerControllerThumbnailSizeWidth,
								  kJPImagePickerControllerThumbnailSizeHeight);
		
		[scrollView addSubview:button];
	}
	
	int rows = images_count / THUMBNAIL_COLS;
	if (((float)images_count / THUMBNAIL_COLS) - rows != 0) {
		rows++;
	}
	int height = kJPImagePickerControllerThumbnailSizeHeight * rows + PADDING * rows + PADDING + PADDING_TOP;
	
	scrollView.contentSize = CGSizeMake(self.view.frame.size.width, height);
	scrollView.clipsToBounds = YES;
		
}

- (void)setImagePickerTitle:(NSString *)newTitle {
	self.navigationItem.title = newTitle;
}

- (NSString *)imagePickerTitle {
	return self.navigationItem.title;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)cancelPicking:(id)sender {
	[[UIApplication sharedApplication] setStatusBarStyle:imagePickerController.originalStatusBarStyle animated:YES];
	[imagePickerController.delegate imagePickerDidCancel:imagePickerController];
}


- (void)buttonTouched:(UIButton *)sender {
	[self performSelector:@selector(pushDetailViewWithSender:) withObject:sender afterDelay:0];
}

- (void)pushDetailViewWithSender:(UIButton *)sender {
	if (detailController == nil) {
		detailController = [[JPImagePickerDetailController alloc] initWithOverviewController:self];
	}
	
	detailController.imageNumber = sender.tag;
	[imagePickerController.modalNavigationController pushViewController:detailController animated:YES];
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
	[imagePickerController release];
	[detailController release];
	[scrollView release];
    [super dealloc];
}


@end
