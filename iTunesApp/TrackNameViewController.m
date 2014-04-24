//
//  TrackNameViewController.m
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import "TrackNameViewController.h"
#import "TrackDetailsViewController.h"

@interface TrackNameViewController ()

@end

@implementation TrackNameViewController
@synthesize searchResults;


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
    self.title=@"Tracks";

    
    
}


//------------------------------------------------------------------------------
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    TrackDetailsViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrackDetailsViewController"];
    
    vc.selectedTrackIndex=indexPath.row;
    vc.trackTitle=[searchResults getTrackNameWithIndex:indexPath.row];
    vc.trackDetails=[searchResults getTrackDetails:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [searchResults getCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"1"] ;
    }
    

    cell.textLabel.text =[searchResults getTrackNameWithIndex:indexPath.row];
    
    
    cell.accessoryType = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
