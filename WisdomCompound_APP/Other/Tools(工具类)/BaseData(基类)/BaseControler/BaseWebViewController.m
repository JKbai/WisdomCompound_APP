//
//  BaseWebViewController.m
//  WisdomCompound_APP
//
//  Created by 白印潇 on 2018/6/1.
//  Copyright © 2018年 白印潇. All rights reserved.
//

#import "BaseWebViewController.h"
#import "XBWKWebView.h"
@interface BaseWebViewController ()<WKNavigationDelegate>
@property(nonatomic,strong)XBWKWebView *webViewManager;
@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)webViewloadRequestWithURLString:(NSString *)URLSting
{
    [self.webViewManager.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLSting]]];
}

#pragma mark - <WKNavigationDelegate>
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //"webViewDidStartLoad"
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //"webViewDidFinishLoad"
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    //"webViewDidFailLoad"
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    //"webViewWillLoadData"
    decisionHandler(WKNavigationResponsePolicyAllow);
}
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    //"webViewWillAuthentication"
    completionHandler(NSURLSessionAuthChallengePerformDefaultHandling , nil);
}

#pragma mark - lazy
-(XBWKWebView *)webViewManager
{
    if (!_webViewManager) {
        
        _webViewManager = [[XBWKWebView alloc] initWithFrame:self.view.bounds];
        _webViewManager.webView.navigationDelegate = self;
        [self.view addSubview:_webViewManager];
    }
    return _webViewManager;
}


@end
