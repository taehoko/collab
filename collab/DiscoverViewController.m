//
//  DiscoverViewController.m
//  collab
//
//  Created by Taeho Ko on 7/13/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "DiscoverViewController.h"
#import "MemberViewController.h"
#import "MatchViewController.h"

@interface DiscoverViewController ()
@property (nonatomic) int currentImageIndex;
@property (weak, nonatomic) UIImageView *currentImage;
@property (weak, nonatomic) UIImageView *nextImage;
@property (weak, nonatomic) IBOutlet UIImageView *likeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dislikeImageView;
- (IBAction)onLike:(id)sender;
- (IBAction)onDislike:(id)sender;
@property (nonatomic) int randomMatchIndex;
@property (nonatomic) int randomMatchCurrent;
@end

@implementation DiscoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Discover";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.currentImageIndex = 0;
    
    // Add images
    self.nextImage = [self createNewImageView];
    self.nextImage.center = CGPointMake(160, self.nextImage.center.y);
    
    self.randomMatchIndex = 3;
    self.randomMatchCurrent = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLike:(id)sender {
    self.currentImage = self.nextImage;
    self.nextImage = [self createNewImageView];
    
    self.randomMatchCurrent++;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.likeImageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.likeImageView.image = [UIImage imageNamed:(@"thumb_up_green")];
            self.likeImageView.transform = CGAffineTransformMakeScale(1, 1);
            self.likeImageView.alpha = 1;
        } completion:^(BOOL finished) {
            
            if (self.randomMatchIndex == self.randomMatchCurrent) {
                self.randomMatchIndex = (arc4random() %(3)) + 3;
                self.randomMatchCurrent = 0;
                
                MatchViewController *matchVC = [[MatchViewController alloc] init];
                matchVC.currentImageIndex = self.currentImageIndex;
                self.modalPresentationStyle = UIModalPresentationCurrentContext;
                [self presentViewController:matchVC animated:YES completion:nil];
            }
            
            [UIView animateWithDuration:0.3 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.currentImage.alpha = 0;
                self.currentImage.center = CGPointMake(-160, self.nextImage.center.y);
                self.currentImage.transform = CGAffineTransformMakeScale(0.8, 0.8);
                self.nextImage.center = CGPointMake(160, self.nextImage.center.y);
                
                
            } completion:^(BOOL finished) {
                self.likeImageView.image = [UIImage imageNamed:(@"thumb_up_blk")];
                self.likeImageView.alpha = 0.4;
            }];
        }];
        
    }];
}

- (IBAction)onDislike:(id)sender {
    self.currentImage = self.nextImage;
    self.nextImage = [self createNewImageView];
    
    [UIView animateWithDuration:0.1 animations:^{
        self.dislikeImageView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.dislikeImageView.image = [UIImage imageNamed:(@"thumb_dn_red")];
            self.dislikeImageView.transform = CGAffineTransformMakeScale(1, 1);
            self.dislikeImageView.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0.6 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.currentImage.alpha = 0;
                self.currentImage.center = CGPointMake(-160, self.nextImage.center.y);
                self.currentImage.transform = CGAffineTransformMakeScale(0.8, 0.8);
                self.nextImage.center = CGPointMake(160, self.nextImage.center.y);
                
                
            } completion:^(BOOL finished) {
                self.dislikeImageView.image = [UIImage imageNamed:(@"thumb_dn_blk")];
                self.dislikeImageView.alpha = 0.4;
            }];
        }];
        
    }];
}

- (UIImageView *)createNewImageView {
    self.currentImageIndex++;
    if (self.currentImageIndex > 5) {
        self.currentImageIndex = 1;
    }
    
    UIImageView *newImage = [[UIImageView alloc] initWithFrame:CGRectMake(320,10,320,347)];
    
    if (self.currentImageIndex == 1) {
        newImage.image = [UIImage imageNamed:(@"card_01")];
    } else if (self.currentImageIndex == 2) {
        newImage.image = [UIImage imageNamed:(@"card_02")];
    } else if (self.currentImageIndex == 3) {
        newImage.image = [UIImage imageNamed:(@"card_03")];
    } else if (self.currentImageIndex == 4) {
        newImage.image = [UIImage imageNamed:(@"card_04")];
    } else if (self.currentImageIndex == 5) {
        newImage.image = [UIImage imageNamed:(@"card_05")];
    }
    
    newImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapCard:)];
    [newImage addGestureRecognizer:tapGestureRecognizer];
    
    newImage.tag = self.currentImageIndex;
    [self.view addSubview:newImage];
    return newImage;
}

- (void)onTapCard:(UITapGestureRecognizer *)tapGestureRecognizer {
    MemberViewController *vc = [[MemberViewController alloc] init];
    vc.currentImageIndex = self.currentImageIndex;
    [self.navigationController pushViewController:vc animated:YES];
}

@end

