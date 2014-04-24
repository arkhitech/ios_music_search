//
//  SingletonClass.m
//  OpsightLite
//
//  Created by Polaris on 9/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SingletonClass.h"

@implementation SingletonClass


static SingletonClass *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (SingletonClass *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// Your dealloc method will never be called, as the singleton survives for the duration of your app.
// However, I like to include it so I know what memory I'm using (and incase, one day, I convert away from Singleton).


// We don't want to allocate a new instance, so return the current one.
+ (id)allocWithZone:(NSZone*)zone {
    return [self sharedInstance] ;
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}




//Do nothing, other than return the shared instance - as this is expected from autorelease.


@end
