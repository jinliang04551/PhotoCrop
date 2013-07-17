//
//  UserDataManager.h
//  CropTest
//
//  Created by liu on 13-6-24.
//
//

#import <Foundation/Foundation.h>
#import "KLAddition.h"

@interface UserDataManager : NSObject {
    NSMutableArray *_imageArray;
    
}

@property (nonatomic,retain)NSMutableArray *imageArray;

+ (UserDataManager *)sharedManager;

@end
