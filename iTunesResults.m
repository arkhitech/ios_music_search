//
//  iTunesResults.m
//  iTunesApp
//
//  Created by Arkhitech on 4/24/14.
//  Copyright (c) 2014 Arkhitech. All rights reserved.
//

#import "iTunesResults.h"

@implementation iTunesResults
@synthesize allData;
@synthesize allTrackNames;

-(id)initWithData: (NSDictionary*)data
{
    self = [super init];
    if(self!=nil)
    {
        [self setAllData:data];
        [self setTrackNames];
    }
    return self;
}

-(void)setTrackNames
{
    NSDictionary *allTracksData=[allData objectForKey:@"results"];
    allTrackNames=[NSMutableArray arrayWithCapacity:[self getCount]];
    for (NSDictionary* temp in allTracksData) {
        [allTrackNames addObject:[temp objectForKey:@"trackName"]];
    }

}


-(int)getCount
{
    return [[allData valueForKey:@"resultCount"]intValue];
}

-(NSMutableArray*)getAllTrackNames
{
    NSDictionary *allTracksData=[allData objectForKey:@"results"];
    
    NSMutableArray* trackNames=[NSMutableArray arrayWithCapacity:[self getCount]];
    for (NSDictionary* temp in allTracksData) {
        [trackNames addObject:[temp objectForKey:@"trackName"]];
    }
    return trackNames;
}

-(NSString*)getTrackNameWithIndex:(int)index
{
    return allTrackNames[index];
}

-(NSMutableArray*)getTrackDetails:(int) index
{
    NSDictionary *allTracksData=[allData objectForKey:@"results"];
    int count=0;
    NSDictionary* tempDict;
    for (tempDict in allTracksData)
    {
        if(count==index)
        {
            break;
        }
        count++;
    }
    
    NSArray *keys = [tempDict allKeys];
    NSMutableArray* tempArray=[[NSMutableArray alloc]init];
    for (NSString* key in keys)
    {
        [tempArray addObject:key];
        [tempArray addObject:[tempDict objectForKey:key]];
    }
    
    return tempArray;
    
    
}


@end