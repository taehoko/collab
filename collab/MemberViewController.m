//
//  MemberViewController.m
//  collab
//
//  Created by Taeho Ko on 7/18/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "MemberViewController.h"
#import "DiscoverViewController.h"
#import "VideoViewController.h"

@interface MemberViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *scrollViewPageControl;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
- (IBAction)onTap:(id)sender;

@end

@implementation MemberViewController

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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIImage *rightButtonImage = [[UIImage imageNamed:@"button_share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.scrollViewPageControl.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [self setupScrollView];
    
    self.bgImageView.image = [UIImage imageNamed:[NSString stringWithFormat: @"bg_image_0%d",self.currentImageIndex]];
    
}

- (void)doNothing {
    
}

- (void)setupScrollView {
    //add the scrollview to the view
    self.scrollView.center = CGPointMake(160, 243);
    
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setAlwaysBounceVertical:NO];
    //setup internal views
    NSInteger numberOfViews = 5;
    for (int i = 0; i < numberOfViews; i++) {
        CGFloat xOrigin = i * self.view.frame.size.width;
        UIImageView *image = [[UIImageView alloc] initWithFrame: CGRectMake(xOrigin, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat: @"0%d_image_0%d", self.currentImageIndex, i+1]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:image];
    }
    //set the scroll view content size
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.scrollView.frame.size.height);
    //add the scrollview to this view
    [self.view addSubview:self.scrollView];
    [self.scrollView setDelegate:self];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.scrollViewPageControl.currentPage = page;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    int page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (page == 4) {
        VideoViewController *vc = [[VideoViewController alloc] init];
        vc.currentImageIndex = self.currentImageIndex;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
