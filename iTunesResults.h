//
//  iTunesResults.h
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesResults : NSObject

@property(nonatomic, retain) NSDictionary* allData;
@property (nonatomic, retain) NSMutableArray* allTrackNames;

-(id)initWithData: (NSDictionary*)data;
-(int)getCount;
-(NSMutableArray*)getAllTrackNames;
-(NSMutableArray*)getTrackDetails:(int) index;
-(NSString*)getTrackNameWithIndex:(int)index;
@end
