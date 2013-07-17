//
//  SubjectItemCell.m
//  CropTest
//
//  Created by liu on 13-7-10.
//
//

#import "SubjectItemCell.h"

@implementation SubjectItemCell
@synthesize subjectItemLabel = _subjectItemLabel;
@synthesize selectButton = _selectButton;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor grayColor]];
        [self.selectButton setImage:[UIImage imageNamed:@"Selected1.png"] forState:UIControlStateNormal];
        self.subjectItemLabel.font = [UIFont systemFontOfSize:25];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        [self.selectButton setImage:[UIImage imageNamed:@"Selected2.png"] forState:UIControlStateHighlighted];
    }
}

- (IBAction)selectButtonpressed:(UIButton *)sender{
    UIButton *button  = (UIButton *)sender;
    
    [UIView animateWithDuration:0.1f animations:^{
        [self.selectButton setImage:[UIImage imageNamed:@"Selected2.png"] forState:UIControlStateHighlighted];
    }
    completion:^(BOOL finished) {
        [_delegate selectButtonPressed:button withSelectItem:self.subjectItemLabel.text];

    }];
   
}

- (void)dealloc {
#if !__has_feature(objc_arc)
    KLRelease(_subjectItemLabel);
    KLRelease(_selectButton);
    [super dealloc];
#endif
    
}

@end
