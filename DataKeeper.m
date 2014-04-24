//
//  DataKeeper.m
//  OpsightLite
//
//  Created by MacBook on 10/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataKeeper.h"

@implementation DataKeeper


- (id)init
{
    self = [super init];
    if (self) {

    }
    
    return self;
}




-(NSString*)getiTunesAPIResults: (NSString*)searchInput
{
    
    NSString *strRequestParams = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@",searchInput];
    
    strRequestParams = [strRequestParams stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    //NSLog(@"PARAMS: %@", strRequestParams);
    
    NSURL *url = [NSURL URLWithString:strRequestParams];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    //    [request setHTTPBody:[strRequestParams dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSError *error;
    NSURLResponse *response;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (!response) {
        // "Connection Error", "Failed to Connect to the Internet"
        return @"Connection Failed";
    }
    
    NSString *respString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] ;
    
    return respString;
}

@end