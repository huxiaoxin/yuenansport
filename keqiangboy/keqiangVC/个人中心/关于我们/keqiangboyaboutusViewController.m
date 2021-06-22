//
//  keqiangboyaboutusViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyaboutusViewController.h"
#import <WebKit/WebKit.h>

@interface keqiangboyaboutusViewController ()

@end

@implementation keqiangboyaboutusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"关于我们";
    WKWebViewConfiguration * keqiangboysCofifgers  = [[WKWebViewConfiguration alloc]init];
    WKWebView * keqiangboysCofifgweb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) configuration:keqiangboysCofifgers];
    keqiangboysCofifgweb.scrollView.showsVerticalScrollIndicator =  NO;
    [self.view addSubview:keqiangboysCofifgweb];
    NSString * keqoangboysCofifgSTr  = [[NSBundle mainBundle] pathForResource:@"keqiangboy" ofType:@"html"];
    [keqiangboysCofifgweb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:keqoangboysCofifgSTr]]];

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
