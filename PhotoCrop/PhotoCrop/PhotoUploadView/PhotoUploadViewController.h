//
//  PhotoUploadViewController.h
//  CropTest
//
//  Created by liu on 13-7-8.
//
//

#import <UIKit/UIKit.h>
#import "KLAddition.h"
#import "SelectSubjectView.h"
#import "ResetOrGetPasswordViewController.h"
#import "CombineImageViewController.h"
#import "CropViewController.h"

@interface PhotoUploadViewController : UIViewController<UITextViewDelegate,UIImagePickerControllerDelegate,SelectSubjectViewDelegate>  {
    
    IBOutlet UIScrollView *_scrollView;
    NSMutableArray *_subjectItemArray;
    BOOL _needHelp;

    HaoTiBenNavgationItem *_titleView;

}

@property (nonatomic,retain)IBOutlet UIImageView *previewImageView;
@property (nonatomic,retain)IBOutlet UIButton *photoButton;
@property (nonatomic,retain)IBOutlet UIButton *combineButton;
@property (nonatomic,retain)IBOutlet UIButton *needHelpButton;
@property (nonatomic,retain)IBOutlet UIButton *notNeedHelpButton;
@property (nonatomic,retain)IBOutlet UIButton *selectSubjectButton;
@property (nonatomic,retain)IBOutlet UILabel  *selectedSubjectLabel;
@property (nonatomic,retain)IBOutlet UITextView *noteTextView;
@property (nonatomic,retain)IBOutlet UIButton  *uploadButton;

- (IBAction)buttonPressed:(id)sender;

@end
