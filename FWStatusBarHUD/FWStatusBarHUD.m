//
//  FWStatusBarHUD.m
//  FWStatusBarHUDDemo
//
//  Created by 沈方伟 on 16/5/25.
//  Copyright © 2016年 沈方伟. All rights reserved.
//

#import "FWStatusBarHUD.h"

#define kFWStatusBarHUDTextFont  [UIFont systemFontOfSize:12]
@implementation FWStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

+ (void)setupWindow{
    window_.hidden = YES;
    window_ = [[UIWindow alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20)];
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor blackColor];
    
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect = window_.frame;
        rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
        window_.frame = rect;
    }];
    
}

+ (void)action{
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect = window_.frame;
        rect = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 20);
        window_.frame = rect;
    } completion:^(BOOL finished) {
        [self dismiss];
    }];
}

/**
 *  显示文字信息
 */
+ (void)showMessage:(NSString *)msg{
    [self showMessage:msg withImage:nil];
}

/**
 *  显示带图片的文字信息
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image{
    [self setupWindow];
    [timer_ invalidate];
    
/*

    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:iv.image forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    if (image) {
//        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    btn.frame = CGRectMake(0, 0, 200, 20);
    btn.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 10);
//    btn.frame = window_.bounds;
    
    [window_ addSubview:btn];
     */
    
    UIImageView *iv = [[UIImageView alloc] init];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.image = image;

    UILabel *label = [UILabel new];
    label.text = msg;
    label.font = kFWStatusBarHUDTextFont;
    label.textColor = [UIColor whiteColor];
    label.frame = CGRectMake(0, 0, 100, 20);
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width /2, 10);
    label.textAlignment = NSTextAlignmentCenter;
    
    iv.frame = CGRectMake([UIScreen mainScreen].bounds.size.width /2 - 50, 0, 20, 20);
    
    [window_ addSubview:iv];
    [window_ addSubview:label];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(action) userInfo:nil repeats:NO];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg{
    [self showMessage:msg withImage:[UIImage imageNamed:@"FWStatusBarHUDResource.bundle/success"]];
}

/**
 *  正在加载
 */
+ (void)showLoading:(NSString *)msg{
    [self setupWindow];
    
    [timer_ invalidate];
    timer_ = nil;
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView startAnimating];
    
    CGSize size = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = kFWStatusBarHUDTextFont;
    label.textColor = [UIColor redColor];
    label.frame = CGRectMake(0, 0, size.width, size.height);
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width /2, 10);
    
    indicatorView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width /2 - size.width / 2 - 20, 3, 10, 10);
    
    [window_ addSubview:label];
    [window_ addSubview:indicatorView];
}

/**
 *  显示错误信息
 */
+ (void)showError:(NSString *)msg{
    [self showMessage:msg withImage:[UIImage imageNamed:@"FWStatusBarHUDResource.bundle/error"]];
}

/**
 *  隐藏
 */
+ (void)dismiss{
    window_ = nil;
    timer_ = nil;
}

@end
