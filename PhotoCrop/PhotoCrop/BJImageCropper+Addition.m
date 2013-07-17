//
//  BJImageCropper+Addition.m
//  CropTest
//
//  Created by liu on 13-6-19.
//
//

#import "BJImageCropper+Addition.h"

@implementation BJImageCropper (Addition)
- (void)setMoveable:(BOOL)model {
    if (model) {
        [self setUserInteractionEnabled:YES];
    }
    else {
        [self setUserInteractionEnabled:NO];

    }
}


@end
