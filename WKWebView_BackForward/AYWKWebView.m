//
//  AYWKWebView.m
//  WKWebView_BackForward
//
//  Created by YLCHUN on 2017/5/27.
//  Copyright © 2017年 ylchun. All rights reserved.
//

#import "AYWKWebView.h"

@interface AYWKWebView ()

@property (nonatomic, assign) BOOL didInit;
@property (nonatomic, assign) UIScreenEdgePanGestureRecognizer *backNavigationGestures;
@property (nonatomic, assign) UIScreenEdgePanGestureRecognizer *forwardNavigationGestures;
@property (nonatomic, assign) BOOL allowsBackNavigationGesturesSet;

@end

@implementation AYWKWebView

-(instancetype)init {
    self = [super init];
    if (self) {
        [self customIntitialization];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self customIntitialization];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customIntitialization];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    self = [super initWithFrame:frame configuration:configuration];
    if (self) {
        [self customIntitialization];
    }
    return self;
}
- (void)customIntitialization{
    if (!self.didInit) {
        self.didInit = YES;
        [self _allowsBackForwardNavigationGestures];
    }
}

-(void)dealloc {
    self.backNavigationGestures = nil;
    self.forwardNavigationGestures = nil;
}

-(void)_allowsBackForwardNavigationGestures {
    self.allowsBackNavigationGesturesSet = YES;
    [super setAllowsBackForwardNavigationGestures:YES];
    self.allowsBackNavigationGesturesSet = NO;
}

-(void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (self.allowsBackNavigationGesturesSet && [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        UIScreenEdgePanGestureRecognizer *navigationGestures = (UIScreenEdgePanGestureRecognizer*)gestureRecognizer;
        navigationGestures.enabled = NO;
        if (navigationGestures.edges == UIRectEdgeLeft) {
            self.backNavigationGestures = navigationGestures;
        }
        if (navigationGestures.edges == UIRectEdgeRight) {
            self.forwardNavigationGestures = navigationGestures;
        }
    }
    [super addGestureRecognizer:gestureRecognizer];
}

-(BOOL)allowsBackNavigationGestures {
    return  self.backNavigationGestures.enabled;
}

-(void)setAllowsBackNavigationGestures:(BOOL)allowsBackNavigationGestures {
    if (self.allowsBackNavigationGestures != allowsBackNavigationGestures) {
        self.backNavigationGestures.enabled = allowsBackNavigationGestures;
    }
}

-(BOOL)allowsForwardNavigationGestures {
    return self.forwardNavigationGestures.enabled;
}

-(void)setAllowsForwardNavigationGestures:(BOOL)allowsForwardNavigationGestures {
    if (self.allowsForwardNavigationGestures != allowsForwardNavigationGestures) {
        self.forwardNavigationGestures.enabled = allowsForwardNavigationGestures;
    }
}

@end
