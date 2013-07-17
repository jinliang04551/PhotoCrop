//
//  HaoTiBenNavgationItem.h
//  CropTest
//
//  Created by liu on 13-7-5.
//
//

#import <UIKit/UIKit.h>
#import "KLAddition.h"
#import "KLNavigationBar.h"

#define kPhotoButtonNotifaction             @"kPhotoButtonNotifaction"
#define kSubjectListButtonNotifaction       @"kSubjectListButtonNotifaction"
#define kSubjectCountButtonNotifaction      @"kSubjectCountButtonNotifaction"

@interface HaoTiBenNavgationItem :UIView {
    UILabel   *_nameLabel;
    UIButton  *_photoButton;  /*拍照*/
    UIButton  *_subjectListButton; /*题目列表*/
    UIButton  *_subjectCountButton; /*题目统计*/
    UIImageView *_logoImageView;
    
}

@property (nonatomic,retain)UILabel *nameLabel;
@property (nonatomic,retain)UIButton *subjectListButton;
@property (nonatomic,retain)UILabel *unreadMessageLabel;

//- (id)initwithCustomFrame:(CGRect )frame;

@end
