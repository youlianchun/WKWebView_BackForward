//
//  ViewController.m
//  WKWebView_BackForward
//
//  Created by YLCHUN on 2017/5/27.
//  Copyright © 2017年 ylchun. All rights reserved.
//

#import "ViewController.h"
#import "AYWKWebView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    AYWKWebView *webView = [[AYWKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    
    webView.allowsBackNavigationGestures = YES;
    webView.allowsForwardNavigationGestures = NO;
    
    [self.view insertSubview:webView atIndex:0];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
