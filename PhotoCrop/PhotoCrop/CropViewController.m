//
//  CropTestViewController.m
//  CropTest
//
//  Created by Barrett Jacobsen on 6/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// preview slows down frame rate (it's generating a new UIImage very frequently)

/*06/15/2013 modify by liu*/

#define SHOW_PREVIEW NO

#import "CropViewController.h"
#import <QuartzCore/QuartzCore.h>

#ifndef CGWidth
#define CGWidth(rect)                   rect.size.width
#endif

#ifndef CGHeight
#define CGHeight(rect)                  rect.size.height
#endif

#ifndef CGOriginX
#define CGOriginX(rect)                 rect.origin.x
#endif

#ifndef CGOriginY
#define CGOriginY(rect)                 rect.origin.y
#endif

static  NSInteger  photoIndex = 0;

@implementation CropViewController
@synthesize imageCropper = _imageCropper;
@synthesize preview = _preview;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)updateDisplay {

    if (SHOW_PREVIEW) {
        self.preview.image = [self.imageCropper getCroppedImage];
        self.preview.frame = CGRectMake(10,10,self.imageCropper.crop.size.width * 0.1, self.imageCropper.crop.size.height * 0.1);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:self.imageCropper] && [keyPath isEqualToString:@"crop"]) {
        [self updateDisplay];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tactile_noise.png"]];
    NSLog(@"self.view.frame.size.width %f",self.view.frame.size.width);
    [self.navigationController setNavigationBarHidden:YES];
   
    [_confirmButton setTag:3001];
    [_cancelButton setTag:3002];
    
    CGSize maxSize = CGSizeMake(1024, 600);
    if ([self currentDeviceIsIPhone]) {
        CGRect rect = [UIScreen mainScreen].bounds;
        NSLog(@"rect.width:%f  height:%f",rect.size.width,rect.size.height);
        maxSize = CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
        
    }
    self.imageCropper = [[BJImageCropper alloc] initWithImage:[UIImage imageNamed:@"gavandme.jpg"] andMaxSize:maxSize];
    
    [self.view addSubview:self.imageCropper];
    self.imageCropper.center = self.view.center;
    self.imageCropper.imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.imageCropper.imageView.layer.shadowRadius = 3.0f;
    self.imageCropper.imageView.layer.shadowOpacity = 0.8f;
    self.imageCropper.imageView.layer.shadowOffset = CGSizeMake(1, 1);
    
    [self.imageCropper addObserver:self forKeyPath:@"crop" options:NSKeyValueObservingOptionNew context:nil];
    
    if (SHOW_PREVIEW) {
        self.preview = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,self.imageCropper.crop.size.width * 0.1, self.imageCropper.crop.size.height * 0.1)];
        self.preview.image = [self.imageCropper getCroppedImage];
        self.preview.clipsToBounds = YES;
        self.preview.layer.borderColor = [[UIColor whiteColor] CGColor];
        self.preview.layer.borderWidth = 2.0;
        [self.view addSubview:self.preview];
    }
    
    [self imageDictionary];
}


- (NSMutableDictionary *)imageDictionary {
    if (_imageDirectory == nil) {
        _imageDirectory = [[NSMutableDictionary alloc]init];
    }
    return _imageDirectory;
}

- (BOOL)currentDeviceIsIPhone {
    BOOL isIphone = NO;
    NSString *nibTitle = @"CropTestViewController"; //默认是ipad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        { //如果当前设备是iphone 就改为iphone的nib文件
            nibTitle = @"CropTestViewController_IPhone";
            isIphone = YES;
        }
    [[NSBundle mainBundle] loadNibNamed:nibTitle owner:self options:nil];//加载nib
    return isIphone;
}


- (IBAction)buttonPressed:(id)sender {
    NSLog(@"%@",NSStringFromSelector(_cmd));

    UIButton *button = (UIButton *)sender;
    if (button.tag = 3001) {
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
        
        dispatch_group_async(group, queue, ^{
            [self saveImage:[_imageCropper getCroppedImage] withFileName:[NSString stringWithFormat:@"%d",photoIndex++] inDirectory:[NSBundle documentDirectory]];
            //            [self saveImage:[imageCropper getCroppedImage] withFileName:[NSString stringWithFormat:@"%d",photoIndex++] ofType:@"png" inDirectory:[NSBundle documentDirectory]];
            
        });
        dispatch_group_notify(group, queue, ^{
            [_imageCropper setMoveable:YES];
        });
        dispatch_release(group);

        
    }
    else {
        
        
        
    }
}

- (void)saveImage:(UIImage *)image withFileName:(NSString *)filename inDirectory:(NSString *)directory {
    if ([self saveImage:image withImageName:filename ofType:@"png" inDirectory:directory]) {
        [[[UserDataManager sharedManager] imageArray] addObject:[NSString stringWithFormat:@"%@.png",filename]];
        
    }

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateDisplay];

}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)dealloc {
#if !__has_feature(objc_arc)
    KLRelease(_imageCropper);
    KLRelease(_confirmButton);
    KLRelease(_cancelButton);    
    KLRelease(_imageDirectory);
    KLRelease(_preview);
    [super dealloc];
#endif
    
}


@end
