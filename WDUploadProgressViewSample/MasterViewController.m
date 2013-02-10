//
//  MasterViewController.m
//  WDUploadProgressViewSample
//
//  Created by Guilherme Moura on 10/02/2013.
//  Copyright (c) 2013 Guilherme Moura. All rights reserved.
//

#import "MasterViewController.h"
#import "DummyConnection.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showUploadView)];
	self.navigationItem.rightBarButtonItem = addButton;

}

- (void)showUploadView {
	WDUploadProgressView *progressView = [[WDUploadProgressView alloc] initWithTableView:self.tableView cancelButton:YES];
	progressView.delegate = self;
	
	// Add Here an image to show
	[progressView setPhotoImage:[UIImage imageNamed:@"flower"]];
	
	// Additionally you can set the message at any time (Default: Uploading...)
	[progressView setUploadMessage:@"Uploading..."];
	
	// You can customize the progress tint color
//	[progressView setProgressTintColor:[UIColor whiteColor]];
	
	// Additionally you can customize the progress track color
//	[progressView setProgressTrackColor:[UIColor darkGrayColor]];
	
	
	// Insert your connection library that will deal with the upload
	// and set the progress view as a delegate
	DummyConnection *connection = [[DummyConnection alloc] initWithDelegate:progressView];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	NSString *dummy = [NSString stringWithFormat:@"Dummy Row %d", [indexPath row]];
	cell.textLabel.text = dummy;
    return cell;
}

#pragma mark - WDUploadProgressView Delegate Methods
- (void)uploadDidFinish:(WDUploadProgressView *)progressView {
	[progressView removeFromSuperview];
	[self.tableView setTableHeaderView:nil];
}

- (void)uploadDidCancel:(WDUploadProgressView *)progressView {
	[progressView removeFromSuperview];
	[self.tableView setTableHeaderView:nil];
}

@end
