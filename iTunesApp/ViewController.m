//
//  ViewController.m
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import "ViewController.h"
#import "DataKeeper.h"
#import "TrackNameViewController.h"
#import "SBJSON.H"
#import "iTunesResults.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize searchField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title=@"Search";
    searchField.delegate=self;
    
}

-(IBAction)searchResults:(id)sender
{
    DataKeeper* _dataKeeper=[DataKeeper sharedInstance];
    NSString* resp = [_dataKeeper getiTunesAPIResults:searchField.text];
    
        if([resp isEqualToString:@"Connection Failed"])
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Connection Failed" message:@"Can't access internet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    else
    {
        SBJSON* parser = [[SBJSON alloc]init];
        NSDictionary *dic = (NSDictionary *)[parser objectWithString:resp error:nil];
        
        NSInteger count=[[dic valueForKey:@"resultCount"]intValue];
        if(count==0)
        {
            UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"No Results Found" message:@"No results found for this query. Try another" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            return;
        }
        else
        {
            iTunesResults* searchResults=[[iTunesResults alloc]initWithData:dic];
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            TrackNameViewController *vc = [sb instantiateViewControllerWithIdentifier:@"TrackNameViewController"];
            vc.searchResults=searchResults;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }

    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
