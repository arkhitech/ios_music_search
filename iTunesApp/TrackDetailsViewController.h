//
//  TrackDetailsViewController.h
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrackDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, assign) int selectedTrackIndex;
@property (nonatomic, retain) NSMutableArray* trackDetails;
@property (nonatomic, retain) NSString* trackTitle;
@end
