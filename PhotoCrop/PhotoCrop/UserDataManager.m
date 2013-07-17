//
//  UserDataManager.m
//  CropTest
//
//  Created by liu on 13-6-24.
//
//

#import "UserDataManager.h"

static UserDataManager *sharedManager = nil;

@implementation UserDataManager
@synthesize imageArray = _imageArray;

+ (UserDataManager *)sharedManager {    
    if (sharedManager ==  nil) {
        sharedManager = [[UserDataManager alloc]init];
    }
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
        _imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    }
    
    return self;
}


@end
