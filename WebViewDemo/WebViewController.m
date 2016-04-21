//
//  WebViewController.m
//  WebViewDemo
//
//  Created by 吴昕 on 3/24/16.
//  Copyright © 2016 ChinaNetCenter. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@end

@implementation WebViewController
{
    BOOL _pageCacheDisable;
}
@synthesize webview;
@synthesize reloadButton;
@synthesize gobackButton;
@synthesize goforwardButton;

- (void)viewDidLoad {
    
    _pageCacheDisable = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webview.delegate = self;
    self.webview.scalesPageToFit = YES;
    
    self.webview.mediaPlaybackRequiresUserAction = YES;
    self.webview.allowsInlineMediaPlayback = NO;
    self.webview.backgroundColor = [UIColor redColor];
    
    [self.webview loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.toutiao.com"]]];
    
    if (_pageCacheDisable) {
        id webView = [self.webview valueForKeyPath:@"_internal.browserView._webView"];
        id preferences = [webView valueForKey:@"preferences"];
        [preferences performSelector:@selector(_postCacheModelChangedNotification)];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) onGoBack:(UIButton*)button {
    [self.webview goBack];
}

-(IBAction) onGoForward:(UIButton*)button {
    [self.webview goForward];
}

-(IBAction) onLoad:(UIButton*)button {
    [self.webview loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.toutiao.com"]]];
}

-(IBAction) onReload:(UIButton *)button {
    [self.webview reload];
}

@end
