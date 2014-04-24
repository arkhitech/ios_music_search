//
//  DataKeeper.h
//  OpsightLite
//
//  Created by MacBook on 10/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SingletonClass.h"




@interface DataKeeper : SingletonClass {
  
}

@property(nonatomic, copy) NSString *serverAddress;

-(NSString*)getiTunesAPIResults: (NSString*)searchInput;

@end
