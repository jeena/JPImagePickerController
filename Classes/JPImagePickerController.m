//
//  JPImagePickerController.m
//  JPImagePickerController
//
//  Created by Jeena on 11.11.09.
//  Copyright 2009 Jeena Paradies.
//  Licence: MIT-Licence
//

#import "JPImagePickerController.h"


@implementation JPImagePickerController

@synthesize overviewController, modalNavigationController, delegate, dataSource, originalStatusBarStyle;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	originalStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
	
	overviewController = [[JPImagePickerOverviewController alloc] initWithImagePickerController:self];
	modalNavigationController = [[UINavigationController alloc] initWithRootViewController:overviewController];	
	modalNavigationController.view.frame = self.view.bounds;
	modalNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	modalNavigationController.navigationBar.translucent = YES;
	[self.view addSubview:modalNavigationController.view];
}

- (void)setImagePickerTitle:(NSString *)newTitle {
	imagePickerTitle = newTitle;
	[overviewController setImagePickerTitle:newTitle];
}

- (NSString *)imagePickerTitle {
	return imagePickerTitle;
}

-(void)viewWillAppear:(BOOL)animated { 
	[super viewWillAppear:animated];
	if (delegate == nil) {
		[self.navigationController dismissModalViewControllerAnimated:YES];
	}
	[modalNavigationController viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated { 
	[super viewWillDisappear:animated];
	[modalNavigationController viewWillDisappear:animated];
}
-(void)viewDidAppear:(BOOL)animated { 
	[super viewDidAppear:animated];
	[modalNavigationController viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated { 
	[super viewDidDisappear:animated];
	[modalNavigationController viewDidDisappear:animated];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)cancelPicking:(id)sender {
	[delegate imagePickerDidCancel:self];
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
