//
//  PhotoUploadViewController.m
//  CropTest
//
//  Created by liu on 13-7-8.
//
//

#import "PhotoUploadViewController.h"
#define degreesToRadinas(x) (M_PI * (x)/180.0)

@interface PhotoUploadViewController ()

@end

@implementation PhotoUploadViewController
@synthesize previewImageView = _previewImageView;
@synthesize photoButton = _photoButton;
@synthesize combineButton = _combineButton;
@synthesize needHelpButton = _needHelpButton;
@synthesize notNeedHelpButton = _notNeedHelpButton;
@synthesize selectSubjectButton = _selectSubjectButton;
@synthesize selectedSubjectLabel = _selectedSubjectLabel;
@synthesize noteTextView = _noteTextView;
@synthesize uploadButton = _uploadButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background.png"]]];
    [self.view setBackgroundColor:[UIColor brownColor]];
    
    _titleView = [[HaoTiBenNavgationItem alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,44)];
    [self.view addSubview:_titleView];
    _titleView.hidden = YES;
    
    _subjectItemArray = [[NSMutableArray alloc]initWithObjects:@"数学",@"语文",@"英语",@"化学", nil];

    _scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_scrollView setContentSize:CGSizeMake(640, self.view.frame.size.height)];
    _scrollView.alwaysBounceHorizontal = YES;
    [_scrollView setAlwaysBounceHorizontal:YES];
    [_scrollView setDecelerationRate:1.0f];
    [_scrollView setScrollEnabled:YES];
    [_scrollView setShowsHorizontalScrollIndicator:YES];
    
    
    //我的备注默认为空
    _noteTextView.text = @"";
    
    //设置背景图
    _previewImageView.image = [UIImage imageNamed:@"SuoLueTu.png"];
    kSetButtonNormalStateImageWithKey(_photoButton, @"PaiTi1.png");
    kSetButtonPressedImageWithKey(_photoButton,@"PaiTi2.png");

    kSetButtonNormalStateImageWithKey(_combineButton, @"PingJie1.png");
    kSetButtonPressedImageWithKey(_combineButton,@"PingJie2.png");
    
    //默认需要求助
    kSetButtonNormalStateImageWithKey(_needHelpButton, @"Selected1.png");
    
    _selectedSubjectLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ShuRuKuang{284_66}.png"]];
    kSetButtonNormalStateImageWithKey(_selectSubjectButton, @"XiaLa1.png");
    kSetButtonPressedImageWithKey(_selectSubjectButton,@"XiaLa2.png");

    _noteTextView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ShuRuKuang{284_118}.png"]];
    kSetButtonNormalStateImageWithKey(_uploadButton, @"ShangChuan1.png");
    kSetButtonPressedImageWithKey(_uploadButton,@"ShangChuan2.png");

    
    
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1001: //拍照
                [self photo];
            break;
        
        case 1002: //拼接图片
                [self conmbineImage];
            break;
        case 1003: //需要求助
            _needHelp = YES;
            [self needHelp:_needHelp];
            break;
            
        case 1004: //不需要求助
            _needHelp = NO;
            [self needHelp:_needHelp];
            break;
            
        case 1005: //选择学科
            [self displaySelectSubjectItemView];
            break;
        case 1006: //上传题目
            [self uploadItem];
            break;
        default:
            break;
    }
    NSLog(@"tag:%d",button.tag);
    
}

- (void)photo {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self presentModalViewController:picker animated:YES];
    #if !__has_feature(objc_arc)
        [picker release];
    #endif
    
}

- (void)conmbineImage{
    
    CombineImageViewController *combineImageCtoller =[[CombineImageViewController alloc]initWithNibName:@"CombineImageViewController" bundle:nil];
    [self.navigationController pushViewController:combineImageCtoller animated:YES];
    
}

#pragma mark －是否需要帮助
- (void)needHelp:(BOOL)needHelp {
    if (needHelp) {
        [_needHelpButton    setImage:[UIImage imageNamed:@"Selected2.png"] forState:UIControlStateNormal];
        [_notNeedHelpButton setImage:[UIImage imageNamed:@"Selected1.png"] forState:UIControlStateNormal];
    
        }
    else {
        [_needHelpButton    setImage:[UIImage imageNamed:@"Selected1.png"] forState:UIControlStateNormal];
        [_notNeedHelpButton setImage:[UIImage imageNamed:@"Selected2.png"] forState:UIControlStateNormal];
    
    }
    
}

- (void)displaySelectSubjectItemView {
   
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    NSArray *subViews = keyWindow.subviews;
    for (UIView *subView in subViews)
        {
        NSLog(@"%@",subView);
        
        if( [subView isKindOfClass:[SelectSubjectView class]] )
            {
            [subView removeFromSuperview];
            break;
            }
        }

    SelectSubjectView *popupView = [[SelectSubjectView alloc]initWithFrame:CGRectMake(20, 0, 320, 100)];
    popupView.dataArray = _subjectItemArray;
    popupView.delegate = self;
    
    CGFloat screenWidth = keyWindow.frame.size.width;
    CGFloat screenHeight = keyWindow.frame.size.height;
    popupView.center = CGPointMake(screenWidth / 2, screenHeight / 2);    
    popupView.transform= CGAffineTransformIdentity;
    popupView.transform= CGAffineTransformMakeRotation(degreesToRadinas(90));//旋转90度（将90度转换为弧度）
    
    [keyWindow addSubview: popupView];
    #if !__has_feature(objc_arc)
        [popupView release];
    #endif
}

- (void)uploadItem {
    ResetOrGetPasswordViewController *resetViewCtoller =[[ResetOrGetPasswordViewController alloc]initWithNibName:@"ResetOrGetPasswordViewController" bundle:nil];
    resetViewCtoller.isResetPasswordView = YES;
    [self presentModalViewController:resetViewCtoller animated:YES];
//    [self.navigationController pushViewController:resetViewCtoller animated:YES];
    
}


#pragma mark –
#pragma mark Camera View Delegate Methods
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissModalViewControllerAnimated:YES];
#if !__has_feature(objc_arc)

    UIImage *image = [[info objectForKey:UIImagePickerControllerEditedImage] retain];
#endif
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self performSelector:@selector(saveImage)
               withObject:image
               afterDelay:0.5];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)saveImage {
    
    CropViewController *cropController = [[CropViewController alloc]initWithNibName:@"CropViewController" bundle:nil];
    [self.navigationController pushViewController:cropController animated:YES];
    
}

#pragma mark - SelectSubjectViewDelegate
- (void)selectItem:(NSString *)item {
    self.selectedSubjectLabel.text = item;
    NSLog(@"item:%@",self.selectedSubjectLabel.text);
    
}

#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [UIView animateWithDuration:1.0f animations:^{
            [_scrollView setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
            
        }];
        return NO;
    }
    
    return YES;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    /*view整体上移*/
    if(textView) {
        [UIView animateWithDuration:1.0f animations:^{
            [_scrollView setFrame:CGRectMake(0,-100, self.view.frame.size.width, self.view.frame.size.height)];
            
        }];
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
#if !__has_feature(objc_arc)
    KLRelease(_scrollView);
    KLRelease(_subjectItemArray);
    KLRelease(_titleView);
    
    KLRelease(_previewImageView);
    KLRelease(_photoButton);
    KLRelease(_combineButton);
    KLRelease(_needHelpButton);
    KLRelease(_notNeedHelpButton);
    KLRelease(_selectSubjectButton);
    KLRelease(_selectedSubjectLabel);
    KLRelease(_noteTextView);
    KLRelease(_uploadButton);
    [super dealloc];
#endif
    
}

@end
