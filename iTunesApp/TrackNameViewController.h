//
//  TrackNameViewController.h
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iTunesResults.h"

@interface TrackNameViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) iTunesResults* searchResults;

@end
