//
//  CombineImageViewController.h
//  CropTest
//
//  Created by liu on 13-7-11.
//
//

#import <UIKit/UIKit.h>
#import "KLAddition.h"
#import "UserDataManager.h"
#import "BJImageCropper.h"
#import "KLNavigationBar.h"
#import "TSPopoverPopoverView.h"

@interface CombineImageViewController : UIViewController {
    UIImageView *_imageView;
    NSMutableArray *_imageArray;
    
}

- (void)showCropImage;


@end
