//
//  ShowCropImageViewController.h
//  CropTest
//
//  Created by liu on 13-6-20.
//
//

#import <UIKit/UIKit.h>
#import "KLAddition.h"
#import "UserDataManager.h"
#import "BJImageCropper.h"
#import "KLNavigationBar.h"
#import "TSPopoverPopoverView.h"

@interface ShowCropImageViewController : UIViewController {
    UIImageView *_imageView;
    NSMutableArray *_imageArray;
    
}

- (void)showCropImage;

@end
