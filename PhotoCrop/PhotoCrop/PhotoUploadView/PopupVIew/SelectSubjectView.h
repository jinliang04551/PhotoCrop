//
//  SelectSubjectView.h
//  CropTest
//
//  Created by liu on 13-7-10.
//
//

#import <UIKit/UIKit.h>
#import  <QuartzCore/QuartzCore.h>
#import "SubjectItemCell.h"

@protocol SelectSubjectViewDelegate;
typedef void (^selectSubjectBlock)(NSString *subject);

@interface SelectSubjectView : UIView<UITableViewDataSource,UITableViewDelegate,SubjectItemDelegate> {
    UITableView *_tableView;
    id <SelectSubjectViewDelegate> _delegate;

}

@property (nonatomic,retain)NSMutableArray *dataArray;
@property (nonatomic,retain)id <SelectSubjectViewDelegate> delegate;

@end


@protocol SelectSubjectViewDelegate <NSObject>
- (void) selectItem:(NSString *)item;
@end
