//
//  TrackDetailsViewController.m
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import "TrackDetailsViewController.h"

@interface TrackDetailsViewController ()

@end

@implementation TrackDetailsViewController
@synthesize selectedTrackIndex;
@synthesize trackDetails;
@synthesize trackTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title=trackTitle;
    
}


//------------------------------------------------------------------------------
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return trackDetails.count/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"1"] ;
    }
    
    NSString* str=[NSString stringWithFormat:@"%@ : %@",trackDetails[2*indexPath.row],trackDetails[2*indexPath.row+1]];
    cell.textLabel.text =str;
    
    
    cell.accessoryType = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
