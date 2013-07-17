//
//  SelectSubjectView.m
//  CropTest
//
//  Created by liu on 13-7-10.
//
//

#import "SelectSubjectView.h"

@implementation SelectSubjectView
@synthesize dataArray = _dataArray;
@synthesize delegate = _delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		_tableView.delegate = self;
		_tableView.dataSource = self;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        [self addSubview:_tableView];
        
    }
    return self;
}

- (id)init {
    
    if (self = [super init]) {

        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 8.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[UIColor brownColor] CGColor];
        
        [self addSubview:_tableView];
        
    }
    return self;
    
}


- (void)dealloc {
#if !__has_feature(objc_arc)
    KLRelease(_dataArray);
    [super dealloc];
#endif
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"SubjectItemCell";
    SubjectItemCell *cell  = (SubjectItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell){
        NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"SubjectItemCell"
                                                       owner:self
                                                     options:nil];
        cell = [cells objectAtIndex:0];
    }
	cell.subjectItemLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.subjectItemLabel.font = [UIFont systemFontOfSize:13.0f];
    [cell.selectButton setImage:[UIImage imageNamed:@"Selected1.png"] forState:UIControlStateNormal];
    cell.delegate = self;
    
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 35.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:1.0f animations:^{
        [_delegate selectItem:[_dataArray objectAtIndex:indexPath.row]];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark - SubjectItemDelegate
- (void)selectButtonPressed:(UIButton *)sender withSelectItem:(NSString *)item {
        [UIView animateWithDuration:1.0f animations:^{
            [_delegate selectItem:item];
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
}

@end
