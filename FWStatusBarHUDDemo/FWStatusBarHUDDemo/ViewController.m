//
//  ViewController.m
//  FWStatusBarHUDDemo
//
//  Created by 沈方伟 on 16/5/25.
//  Copyright © 2016年 沈方伟. All rights reserved.
//

#import "ViewController.h"
#import "FWStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)success:(id)sender {
    [FWStatusBarHUD showSuccess:@"成功!"];
}
- (IBAction)error:(id)sender {
    [FWStatusBarHUD showError:@"失败!"];
}
- (IBAction)normal:(id)sender {
    [FWStatusBarHUD showMessage:@"普通文字!"];
}
- (IBAction)dismiss:(id)sender {
    [FWStatusBarHUD dismiss];
}
- (IBAction)loading:(id)sender {
    [FWStatusBarHUD showLoading:@"正在加载"];
}

@end
