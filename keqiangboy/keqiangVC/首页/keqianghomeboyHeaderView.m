//
//  keqianghomeboyHeaderView.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqianghomeboyHeaderView.h"
#import <SDCycleScrollView.h>
#import "keqianghomeBtn.h"

@interface keqianghomeboyHeaderView ()
@property(nonatomic,strong) keqianghomeBtn * keBtn;
@end
@implementation keqianghomeboyHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        SDCycleScrollView  * keqiangSdc =[[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_Width-K(30), K(120))];
        keqiangSdc.backgroundColor = LGDLightGaryColor;
        keqiangSdc.layer.cornerRadius = K(5);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            keqiangSdc.localizationImageNamesGroup = @[@"banner"];
        });
        keqiangSdc.layer.masksToBounds = YES;
        [self addSubview:keqiangSdc];
        
        NSArray * ketitleArr = @[@"足球场地",@"篮球场地",@"视频集锦",@"赛事资讯",@"在线客服"];
        
        for (int keqiangindex =0 ; keqiangindex < ketitleArr.count; keqiangindex++) {
            keqianghomeBtn * keBtn = [[keqianghomeBtn alloc]initWithFrame:CGRectMake(SCREEN_Width/ketitleArr.count*keqiangindex, CGRectGetMaxY(keqiangSdc.frame)+K(20), SCREEN_Width/ketitleArr.count, K(70))];
            keBtn.keqiangBtomlb.text = ketitleArr[keqiangindex];
            keBtn.keqiangTopImg.image = [UIImage imageNamed:ketitleArr[keqiangindex]];
            keBtn.tag = keqiangindex;
            [keBtn addTarget:self action:@selector(keqiangcboyBtnClicks:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:keBtn];
            _keBtn = keBtn;
        }
        UIView * keqiangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_keBtn.frame)+K(10), SCREEN_Width-K(30), K(1))];
        keqiangline.backgroundColor =  LGDLightGaryColor;
        [self addSubview:keqiangline];
        
        
    }
    return self;
}
-(void)keqiangcboyBtnClicks:(keqianghomeBtn * )keqiangBtn{
    [self.delegate keqianghomeboyHeaderViewDidbtnClicksWithIndex:keqiangBtn.tag];
}
@end
