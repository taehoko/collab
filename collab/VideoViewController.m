//
//  VideoViewController.m
//  collab
//
//  Created by Taeho Ko on 7/18/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 120, 320, 213)];
    [webView setAllowsInlineMediaPlayback:YES];
    [webView setMediaPlaybackRequiresUserAction:NO];
    
    [self.view addSubview:webView];
    NSString* embedHTML;
    
    if (self.currentImageIndex == 1) {
        embedHTML = [NSString stringWithFormat:@"\
                               <html>\
                               <body style='margin:0px;padding:0px;'>\
                               <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                               <script type='text/javascript'>\
                               function onYouTubeIframeAPIReady()\
                               {\
                               ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                               }\
                               function onPlayerReady(a)\
                               { \
                               a.target.playVideo(); \
                               }\
                               </script>\
                               <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                               </body>\
                               </html>", 320, 213, @"FAvbEnyJsLQ"];
    } else if (self.currentImageIndex == 2) {
        embedHTML = [NSString stringWithFormat:@"\
                               <html>\
                               <body style='margin:0px;padding:0px;'>\
                               <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                               <script type='text/javascript'>\
                               function onYouTubeIframeAPIReady()\
                               {\
                               ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                               }\
                               function onPlayerReady(a)\
                               { \
                               a.target.playVideo(); \
                               }\
                               </script>\
                               <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                               </body>\
                               </html>", 320, 213, @"RaHdXpFeb6k"];
    } else if (self.currentImageIndex == 3) {
        embedHTML = [NSString stringWithFormat:@"\
                               <html>\
                               <body style='margin:0px;padding:0px;'>\
                               <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                               <script type='text/javascript'>\
                               function onYouTubeIframeAPIReady()\
                               {\
                               ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                               }\
                               function onPlayerReady(a)\
                               { \
                               a.target.playVideo(); \
                               }\
                               </script>\
                               <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                               </body>\
                               </html>", 320, 213, @"EoakbXJmcto"];
    } else if (self.currentImageIndex == 4) {
        embedHTML = [NSString stringWithFormat:@"\
                               <html>\
                               <body style='margin:0px;padding:0px;'>\
                               <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                               <script type='text/javascript'>\
                               function onYouTubeIframeAPIReady()\
                               {\
                               ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                               }\
                               function onPlayerReady(a)\
                               { \
                               a.target.playVideo(); \
                               }\
                               </script>\
                               <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                               </body>\
                               </html>", 320, 213, @"TbY_YVg0nzw"];
    } else if (self.currentImageIndex == 5) {
        embedHTML = [NSString stringWithFormat:@"\
                               <html>\
                               <body style='margin:0px;padding:0px;'>\
                               <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                               <script type='text/javascript'>\
                               function onYouTubeIframeAPIReady()\
                               {\
                               ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                               }\
                               function onPlayerReady(a)\
                               { \
                               a.target.playVideo(); \
                               }\
                               </script>\
                               <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                               </body>\
                               </html>", 320, 213, @"slydIJ62xnI"];
    };
    
    
    [webView loadHTMLString:embedHTML baseURL:[[NSBundle mainBundle] resourceURL]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
