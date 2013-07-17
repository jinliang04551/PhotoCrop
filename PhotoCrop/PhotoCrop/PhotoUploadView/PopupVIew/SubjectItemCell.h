//
//  SubjectItemCell.h
//  CropTest
//
//  Created by liu on 13-7-10.
//
//

#import <UIKit/UIKit.h>
@protocol SubjectItemDelegate;

@interface SubjectItemCell : UITableViewCell {
    id <SubjectItemDelegate> _delegate;
    
    
}

@property (nonatomic, retain) IBOutlet UILabel *subjectItemLabel;
@property (nonatomic, retain) IBOutlet UIButton *selectButton;
@property (nonatomic, retain) id delegate;

- (IBAction)selectButtonpressed:(UIButton *)sender;

@end

@protocol SubjectItemDelegate <NSObject>
- (void) selectButtonPressed:(UIButton *)sender withSelectItem:(NSString *)item;
@end