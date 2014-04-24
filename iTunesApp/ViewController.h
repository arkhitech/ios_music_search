//
//  ViewController.h
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, retain) IBOutlet UITextField* searchField;
-(IBAction)searchResults:(id)sender;
@end
