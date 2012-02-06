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
@synthesize largeImage, scrollView;


#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 400


- (id)initWithOverviewController:(JPImagePickerOverviewController *)newOverviewController {
	if (self = [super initWithNibName:@"JPImagePickerDetailController" bundle:nil]) {
        // Custom initialization
		overviewController = newOverviewController;
		imageNumber = -1;
    }
    return self;
}

- (void)dealloc {
    [previewImageView release];
    [overviewController release];
    [largeImage release];
    [scrollView release];
    [super dealloc];
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
    UIImage * image = [[overviewController.imagePickerController.dataSource
							   imagePicker:overviewController.imagePickerController
							   imageForImageNumber:imageNumber]
							  scaleToSize:CGSizeMake(kJPImagePickerControllerPreviewImageSizeWidth, kJPImagePickerControllerPreviewImageSizeHeight)
							  onlyIfNeeded:YES];
    
    self.previewImageView = [[UIImageView alloc] initWithImage:image];
	
	self.largeImage = image;
    
    //Center the image code
    CGRect frameToCenter = previewImageView.frame;
    CGSize boundsSize = CGSizeMake(kJPImagePickerControllerPreviewImageSizeWidth, kJPImagePickerControllerPreviewImageSizeHeight);
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    previewImageView.frame = frameToCenter;
  
    //Create Scroll view and add the ImageViewController.
    scrollView.contentSize = CGSizeMake(kJPImagePickerControllerPreviewImageSizeWidth, kJPImagePickerControllerPreviewImageSizeHeight);
    [scrollView addSubview:previewImageView];

    scrollView.minimumZoomScale = 0.4;
	scrollView.maximumZoomScale = 8.0;
	scrollView.delegate = self;
    
	[scrollView setZoomScale:1];
    
}

- (IBAction)cancelPreview:(id)sender {
	[[UIApplication sharedApplication] setStatusBarStyle:originalStatusBarStyle animated:YES];
    [previewImageView removeFromSuperview];
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)finishedPicking:(id)sender {
	[[UIApplication sharedApplication] setStatusBarStyle:overviewController.imagePickerController.originalStatusBarStyle animated:YES];
	[overviewController.imagePickerController.delegate imagePicker:overviewController.imagePickerController didFinishPickingWithImageNumber:imageNumber];
}

#pragma mark ScrollView Bits

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollview {
    return previewImageView;
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates.
    // At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    // As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [self.scrollView frame].size.height / scale;
    zoomRect.size.width = [self.scrollView frame].size.width / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

- (void)zoomAction:(UIGestureRecognizer *)gestureRecognizer {
    // double tap zooms in
    float newScale = [self.scrollView zoomScale] * 2;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [self.scrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    
}

@end
