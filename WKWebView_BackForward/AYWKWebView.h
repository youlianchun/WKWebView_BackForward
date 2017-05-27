//
//  AYWKWebView.h
//  WKWebView_BackForward
//
//  Created by YLCHUN on 2017/5/27.
//  Copyright © 2017年 ylchun. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface AYWKWebView : WKWebView

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wobjc-property-synthesis"
@property (nonatomic) BOOL allowsBackForwardNavigationGestures NS_UNAVAILABLE;
#pragma clang diagnostic pop

@property (nonatomic) BOOL allowsBackNavigationGestures;
@property (nonatomic) BOOL allowsForwardNavigationGestures;

@end
