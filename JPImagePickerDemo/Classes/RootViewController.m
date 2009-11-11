//
//  RootViewController.m
//  JPImagePickerDemo
//
//  Created by Jeena on 11.11.09.
//  Copyright Jeena Paradies 2009. All rights reserved.
//

#import "RootViewController.h"
#import "JPImagePickerController.h"


@implementation RootViewController

@synthesize chosenImageView, chosenImageController;

#define THUMBNAIL_SIZE 30
#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 400

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	chosenImage = -1;
	self.navigationItem.title = @"ImagePicker Demo";
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	if (indexPath.section == 0) {
		cell.textLabel.text = @"Chose Image";		
		cell.textLabel.textAlignment = UITextAlignmentCenter;
	} else {
		cell.textLabel.textAlignment = UITextAlignmentLeft;
		cell.textLabel.text = @"Show chosen image";
		if (chosenImage == -1) {
			cell.imageView.image = [[UIImage imageNamed:@"noImageSelected.png"] scaleToSize:CGSizeMake(THUMBNAIL_SIZE, THUMBNAIL_SIZE) onlyIfNeeded:NO];
		} else {
			cell.imageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"t%i.png", (chosenImage % 4) + 1]] scaleToSize:CGSizeMake(THUMBNAIL_SIZE, THUMBNAIL_SIZE) onlyIfNeeded:NO];
		}

	}
	
    return cell;
}




// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
	
	if (indexPath.section == 0) {
		JPImagePickerController *imagePickerController = [[JPImagePickerController alloc] init];
		
		imagePickerController.delegate = self;
		imagePickerController.dataSource = self;
		[imagePickerController setImagePickerTitle:@"Emoticards"];
		
		[self.navigationController presentModalViewController:imagePickerController animated:YES];
		[imagePickerController release];	
		
	} else {
		
		if (chosenImage == -1) {
			chosenImageView.image = [[UIImage imageNamed:@"noImageSelected.png"] scaleToSize:CGSizeMake(320, 480) onlyIfNeeded:YES];
		} else {
			chosenImageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"i%i.png", (chosenImage % 4) + 1]] scaleToSize:CGSizeMake(IMAGE_WIDTH, IMAGE_HEIGHT) onlyIfNeeded:YES];
		}
		
		[self.navigationController pushViewController:chosenImageController animated:YES];
	}

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

# pragma mark -
# pragma mark JPImagePickerControllerDelegate

- (void)imagePickerDidCancel:(JPImagePickerController *)picker {
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)imagePicker:(JPImagePickerController *)picker didFinishPickingMediaWithImageNumber:(NSInteger)imageNumber {
	chosenImage = imageNumber;
	[self.tableView reloadData];
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

# pragma mark JPImagePickerControllerDataSource

- (NSInteger)numberOfImagesInImagePicker:(JPImagePickerController *)picker {
	return 22;
}

- (UIImage *)imagePicker:(JPImagePickerController *)picker thumbnailForImageNumber:(NSInteger)imageNumber {
	return [UIImage imageNamed:[NSString stringWithFormat:@"t%i.png", (imageNumber % 4) + 1]];
}

- (UIImage *)imagePicker:(JPImagePickerController *)imagePicker imageForImageNumber:(NSInteger)imageNumber {
	return [UIImage imageNamed:[NSString stringWithFormat:@"i%i.png", (imageNumber % 4) + 1]];
}


# pragma mark -


- (void)dealloc {
    [super dealloc];
}


@end

