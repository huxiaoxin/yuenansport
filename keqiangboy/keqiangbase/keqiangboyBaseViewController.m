//
//  keqiangboyBaseViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyBaseViewController.h"
#import "keqiangboyLogoinsViewController.h"
@interface keqiangboyBaseViewController ()

@end

@implementation keqiangboyBaseViewController
-(void)keqiangboyShowloginVc{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangboyLogoinsViewController * keqangboyLoginvc = [[keqiangboyLogoinsViewController alloc]init];
        UINavigationController * keqiangboyNav = [UINavigationController rootVC:keqangboyLoginvc translationScale:YES];
        [weakSelf  presentViewController:keqiangboyNav animated:YES completion:nil];
        
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
