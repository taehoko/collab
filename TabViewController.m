//
//  TabViewController.m
//  collab
//
//  Created by Taeho Ko on 7/13/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "TabViewController.h"
#import "DiscoverViewController.h"
#import "ChatViewController.h"
#import "ProfileViewController.h"

@interface TabViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tabSelectedIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *tabDiscoverImage;
@property (weak, nonatomic) IBOutlet UIImageView *tabChatImage;
@property (weak, nonatomic) IBOutlet UIImageView *tabProfileImage;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation TabViewController

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
    
    [self onDiscoverButton:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDiscoverButton:(id)sender {
    DiscoverViewController *discoverVC = self.viewControllers[0];
    [self.view addSubview:discoverVC.view];
    discoverVC.view.frame = self.contentView.frame;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tabSelectedIndicator.center = CGPointMake(107/2, 1.5);
        self.tabDiscoverImage.alpha = 0.8;
        self.tabChatImage.alpha = 0.5;
        self.tabProfileImage.alpha = 0.5;
    }];
}

- (IBAction)onChatButton:(id)sender {
    ChatViewController *chatVC = self.viewControllers[1];
    [self.view addSubview:chatVC.view];
    chatVC.view.frame = self.contentView.frame;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tabSelectedIndicator.center = CGPointMake(320/2, 1.5);
        self.tabDiscoverImage.alpha = 0.5;
        self.tabChatImage.alpha = 0.8;
        self.tabProfileImage.alpha = 0.5;
    }];
}

- (IBAction)onProfileButton:(id)sender {
    ProfileViewController *profileVC = self.viewControllers[2];
    [self.view addSubview:profileVC.view];
    profileVC.view.frame = self.contentView.frame;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tabSelectedIndicator.center = CGPointMake(320-107/2, 1.5);
        self.tabDiscoverImage.alpha = 0.5;
        self.tabChatImage.alpha = 0.5;
        self.tabProfileImage.alpha = 0.8;
    }];
}


@end
