//
//  CropTestViewController.h
//  CropTest
//
//  Created by Barrett Jacobsen on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BJImageCropper.h"
#import "ShowCropImageViewController.h"
#import "KLAddition.h"
#import "BJImageCropper+Addition.h"
#import "UserDataManager.h"
#import "HaoTiBenNavgationItem.h"
#import "PhotoUploadViewController.h"

@interface CropViewController : UIViewController {
    BJImageCropper *_imageCropper;
    IBOutlet UIButton *_confirmButton;
    IBOutlet UIButton *_cancelButton;
    NSMutableDictionary *_imageDirectory;

}

@property (nonatomic, strong) BJImageCropper *imageCropper;
@property (nonatomic, strong) UIImageView *preview;

- (IBAction)buttonPressed:(id)sender;


@end
