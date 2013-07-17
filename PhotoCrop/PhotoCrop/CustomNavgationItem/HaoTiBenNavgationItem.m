//
//  HaoTiBenNavgationItem.m
//  CropTest
//
//  Created by liu on 13-7-5.
//
//

#import "HaoTiBenNavgationItem.h"

@implementation HaoTiBenNavgationItem
@synthesize nameLabel = _nameLabel;
@synthesize subjectListButton = _subjectListButton;
@synthesize unreadMessageLabel = _unreadMessageLabel;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor brownColor]];
//        self.frame = CGRectMake(0, 0, frame.size.width +10, frame.size.height);
        [self createSubViewWithFrame:frame];

    }
    
    return self;
}

- (void)createSubViewWithFrame:(CGRect)frame {
    
    CGFloat width =  frame.size.width ;
    CGFloat height = frame.size.height -2;
    NSLog(@"frame width:%f height:%f",width,height);
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x,frame.origin.y, 60, height)];
    [_nameLabel setTextColor:[UIColor colorWithRed:35/255.0 green:50/255.0 blue:100/255.0 alpha:1.0f]];
    [_nameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        //        [_nameLabel setBackgroundColor:[UIColor whiteColor]];
    [_nameLabel setText:@"默罕默德"];
    [_nameLabel setBorderColor:[UIColor darkGrayColor] width:0.1f];
    [self addSubview:_nameLabel];
    
    _photoButton = [UIButton getButtonWithFrame:CGRectMake(_nameLabel.frame.origin.x+_nameLabel.frame.size.width +30, 10, 50, height) tag:0 normalImage:[UIImage imageNamed:@"PaiTi1.png"] highLightImage:[UIImage imageNamed:@"PaiTi2.png"] action:@selector(buttonPressed:) superView:self];
    
    _subjectListButton = [UIButton getButtonWithFrame:CGRectMake(_photoButton.frame.origin.x+_photoButton.frame.size.width +20, 10, 50, height) tag:1 normalImage:[UIImage imageNamed:@"PingJie1.png"] highLightImage:[UIImage imageNamed:@"PingJie2.png"] action:@selector(buttonPressed:) superView:self];
    
    _unreadMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(_photoButton.frame.origin.x+_photoButton.frame.size.width +20+30, 10, 50, height)];
    [_unreadMessageLabel setTextColor:[UIColor colorWithRed:35/255.0 green:50/255.0 blue:100/255.0 alpha:0.5f]];
    [_unreadMessageLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [_unreadMessageLabel setBackgroundColor:[UIColor clearColor]];
//    [_unreadMessageLabel setBackgroundImage:[UIImage imageNamed:@"Badage@2x.png"]];
    [_unreadMessageLabel setText:@"10"];
    [self addSubview:_unreadMessageLabel];
    
    
    _subjectCountButton = [UIButton getButtonWithFrame:CGRectMake(_subjectListButton.frame.origin.x+_subjectListButton.frame.size.width +20, 10, 50, height) tag:2 normalImage:[UIImage imageNamed:@"SubjectList.png"] highLightImage:[UIImage imageNamed:@"SubjectListHighLight.png"] action:@selector(buttonPressed:) superView:self];
    
    
    _logoImageView = [[UIImageView alloc] init];
    [_logoImageView setFrame:CGRectMake(_subjectCountButton.frame.origin.x+_subjectCountButton.frame.size.width+50, 10, 80, 46)];
    UIImage *logoImage = [UIImage imageNamed:@"NavLogo.png"];
    if (logoImage.size.width > _logoImageView.frame.size.width ||logoImage.size.height > _logoImageView.frame.size.height) {
        
        logoImage = [logoImage scaleImageToSize:CGSizeMake(_logoImageView.size.width - 10, _logoImageView.size.height - 20 )];
    }
    [_logoImageView setImage:logoImage];
    [self addSubview:_logoImageView];
}


- (void)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender ;
    if ([button isKindOfClass:[UIButton class]] && button.tag) {
        switch (button.tag) {
            case 0:
                [self postNotification:kPhotoButtonNotifaction];
                break;
            case 1:
                [self postNotification:kSubjectListButtonNotifaction];
                break;
            case 2:
                [self postNotification:kSubjectCountButtonNotifaction];
                break;
            default:
                break;
        }
        
    }
    NSLog(@"%@ button.tag:%d",NSStringFromSelector(_cmd),button.tag);

}

- (void)dealloc {
    #if !__has_feature(objc_arc)
        [_nameLabel  release];
        _nameLabel = nil;
        [_photoButton release];
        _photoButton = nil;
        [_subjectListButton release];
        _subjectListButton = nil;
        [_subjectCountButton release];
        _subjectCountButton = nil;
        [_iconImageView release];
        _iconImageView = nil;
        [_unreadMessageLabel release];
        _unreadMessageLabel = nil;
        [super dealloc];
    #endif
  
}


@end
