//
//  ResetOrGetPasswordViewController.m
//  CropTest
//
//  Created by liu on 13-7-11.
//
//

#import "ResetOrGetPasswordViewController.h"

@interface ResetOrGetPasswordViewController ()

@end

@implementation ResetOrGetPasswordViewController
@synthesize backgroudView = _backgroudView;
@synthesize isResetPasswordView = _isResetPasswordView;
@synthesize titleLabel = _titleLabel;
@synthesize firstLabel = _firstLabel;
@synthesize secondLabel = _secondLabel;
@synthesize firstTextField = _firstTextField;
@synthesize secondTextField = _secondTextField;
@synthesize firstButton = _firstButton;
@synthesize secondButton = _secondButton;


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
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5f]];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGFloat screenWidth = keyWindow.frame.size.width;
    CGFloat screenHeight = keyWindow.frame.size.height;
    self.backgroudView.frame = self.view.frame;
    self.backgroudView.center = CGPointMake(screenWidth / 2, screenHeight / 2);
    [self.backgroudView setSize:CGSizeMake(100, 50)];
    
    [self.backgroudView setFrame:CGRectMake(0, 0,screenWidth, screenHeight)];
//    [self.backgroudView setBackgroundColor:[UIColor colorWithPatternImage:kGetImageWithKey(@"DiTu{660_310}.png")]];
    
    if (_isResetPasswordView) {
        _titleLabel.text = @"密码重置";
        _firstLabel.text = @"新密码";
        _secondLabel.text = @"确认密码";
        _firstTextField.placeholder = @"请输入密码";
        _secondTextField.placeholder =@"请重复输入密码";
        
        _firstButton.hidden = YES;
        kSetButtonNormalStateImageWithKey(_secondButton,@"ConfirmButton.png");
        kSetButtonPressedImageWithKey(_secondButton,@"ConfirmButtonHighLight.png");
    }
    else {
        _titleLabel.text = @"密码找回";
        _firstLabel.text = @"手机";
        _secondLabel.text = @"密码";
        _firstTextField.placeholder = @"请输入注册手机号";
        _secondTextField.placeholder =@"请输入接收到的随机密码";
        
        kSetButtonNormalStateImageWithKey(_firstButton, @"HuoQuMiMa.png");
        kSetButtonPressedImageWithKey(_firstButton,@"HuoQuMiMaHighLight.png");
        kSetButtonNormalStateImageWithKey(_secondButton, @"XiaYiBu.png");
        kSetButtonPressedImageWithKey(_secondButton,@"XiaYiBuHighLight.png");
        
    }

}

- (IBAction)buttonPressed:(id)sender {
        
    
    
}


#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [UIView animateWithDuration:1.0f animations:^{
            [_backgroudView setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
            
        }];
        return NO;
    }
    
    return YES;
}


- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    /*view整体上移*/
    if(textView) {
        [UIView animateWithDuration:1.0f animations:^{
            [_backgroudView setFrame:CGRectMake(0,-100, self.view.frame.size.width, self.view.frame.size.height)];
            
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
    KLRelease(_backgroudView);
    KLRelease(_titleLabel);
    KLRelease(_firstLabel);
    KLRelease(_secondLabel);
    KLRelease(_firstTextField);
    KLRelease(_secondTextField);
    KLRelease(_firstButton);
    KLRelease(_secondButton);
    [super dealloc];
#endif
    
}


@end
