//
//  ShowCropImageViewController.m
//  CropTest
//
//  Created by liu on 13-6-20.
//
//

#import "ShowCropImageViewController.h"

@interface ShowCropImageViewController ()

@end

@implementation ShowCropImageViewController

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
    // Do any additional setup after loading the view from its nib.
    [self setNavigationBarHidden:NO];

    
    CGRect  frameReact = self.view.frame;
    CGFloat originX =  CGOriginX(frameReact) + 10.f;    
    CGFloat originY =  CGOriginY(frameReact) + 10.f;
    CGFloat width =  CGWidth(frameReact)/2;
    CGFloat height = CGHeight(frameReact)/2;
    
//    _imageView = [[UIImageView alloc]init];
//    [_imageView setFrame:CGRectMake((CGWidth(frameReact)-width)/2, originY, width, height + 50)];
//    [self.view addSubview:_imageView];
    
//    [self showCropImage];
//    [self scaleImage:[UIImage imageNamed:@"NavLogo.png"]];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarHidden:NO];
}

- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)popupView:(CGPoint)point withFrame:(CGRect )rect{
    
    TSPopoverPopoverView* popoverView = [[TSPopoverPopoverView alloc] init];
    popoverView.arrowDirection = TSPopoverArrowDirectionTop;
    popoverView.arrowPosition = TSPopoverArrowPositionVertical;
    popoverView.arrowPoint = point;
    popoverView.alpha = 0;

    
    [self.view addSubview:popoverView];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point =  [[touches anyObject] locationInView:self.view];
    CGRect rect = CGRectMake(point.x+10, point.y+10, 100, 60);
    NSLog(@"pointX:%f Y:%f",point.x,point.y);
    [self popupView:point withFrame:rect];
    
}

- (void)customNavigationBar {
    
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
        //自定义NavBar背景
    KLNavigationBar *customBar = [[KLNavigationBar alloc]initWithFrame:self.navigationController.navigationBar.frame];
//    customBar.landscapeBarBackground = [UIImage imageNamed:@"nav@2x.png"];
    [customBar setLandscapeBarBackground:[UIImage imageNamed:@"nav@2x.png"]];
//    customBar.portraitBarBackground = [UIImage imageNamed:@"nav@2x.png"];
    [customBar setBackgroundForDeviceOrientation:[[UIDevice currentDevice] orientation]];
    
    
}

- (void)showCropImage {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSLog(@"self imageArray:%@",[[UserDataManager sharedManager] imageArray]);
    
    _imageArray = [[UserDataManager sharedManager] imageArray];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSBundle documentDirectory]]) {
        for (int i = 0 ; i < [_imageArray count]; i++) {
          UIImage *image = [self loadImage:[_imageArray objectAtIndex:i]   inDirectory:[NSBundle documentDirectory]];
            CGSize  imageSize = image.size;
            
            /*根据图片数量创建相同数量的UIImageView*/
//            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(originX+i*width+10, originY+i*height+10, width, height)];
//            [imageView setImage:image];
//            [self.view addSubview:imageView];
            
//            BJImageCropper *bJImageCropper = [[BJImageCropper alloc]initWithFrame:CGRectMake(originX+i*width+10, originY+i*height+10, width, height)];
            
        }
    }
    
    NSLog(@"self imageArrayCount:%d",[[self imageArray] count]);
    
}

- (void)scaleImage:(UIImage *)image {
 
    if (image.size.width > 50) {
       [image resizeTo:CGSizeMake(50, 30)];
    }
    if (image.size.height > 30) {
        [image resizeTo:CGSizeMake(50, 30)];
    }
    [_imageView setImage:image];
    
    NSLog(@"image.size width:%f height:%f",image.size.width,image.size.height);
}

@end
