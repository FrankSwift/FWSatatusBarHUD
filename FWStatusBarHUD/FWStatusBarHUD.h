//
//  FWStatusBarHUD.h
//  FWStatusBarHUDDemo
//
//  Created by 沈方伟 on 16/5/25.
//  Copyright © 2016年 沈方伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWStatusBarHUD : NSObject
/**
 *  显示文字信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示带图片的文字信息
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示错误信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  正在加载
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)dismiss;



@end
