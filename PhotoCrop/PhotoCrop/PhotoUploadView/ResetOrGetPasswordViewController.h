//
//  ResetOrGetPasswordViewController.h
//  CropTest
//
//  Created by liu on 13-7-11.
//
//

#import <UIKit/UIKit.h>
#import "KLAddition.h"

@interface ResetOrGetPasswordViewController : UIViewController<UITextFieldDelegate>


@property (nonatomic,assign)BOOL     isResetPasswordView;
@property (nonatomic,retain)IBOutlet UIView   *backgroudView;
@property (nonatomic,retain)IBOutlet UILabel  *titleLabel;
@property (nonatomic,retain)IBOutlet UILabel  *firstLabel;;
@property (nonatomic,retain)IBOutlet UILabel  *secondLabel;
@property (nonatomic,retain)IBOutlet UITextField *firstTextField;
@property (nonatomic,retain)IBOutlet UITextField *secondTextField;

@property (nonatomic,retain)IBOutlet UIButton *firstButton;
@property (nonatomic,retain)IBOutlet UIButton *secondButton;

- (IBAction)buttonPressed:(id)sender;

@end
