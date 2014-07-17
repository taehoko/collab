//
//  TabViewController.h
//  collab
//
//  Created by Taeho Ko on 7/13/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabViewController : UIViewController

@property (nonatomic, strong) NSArray *viewControllers;
- (IBAction)onDiscoverButton:(id)sender;
- (IBAction)onChatButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;

@end
