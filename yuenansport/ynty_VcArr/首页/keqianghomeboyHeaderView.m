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
#import "CarpVideoMessageBtn.h"
@interface keqianghomeboyHeaderView ()
@property(nonatomic,strong) CarpVideoMessageBtn * keBtn;
@end
@implementation keqianghomeboyHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        SDCycleScrollView  * keqiangSdc =[[SDCycleScrollView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_Width-K(30), K(140))];
        keqiangSdc.backgroundColor = LGDLightGaryColor;
        keqiangSdc.layer.cornerRadius = K(5);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            keqiangSdc.imageURLStringsGroup = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.yunhuzx.com%2Ffiles%2Fuploads%2F2020%2F01-13%2F15788862819198ff168461.jpg&refer=http%3A%2F%2Fimg.yunhuzx.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024647&t=c6d41fe0b31b1403d88fe39f0a96c53a"];
        });
        keqiangSdc.layer.masksToBounds = YES;
        [self addSubview:keqiangSdc];
        
        NSArray * ketitleArr = @[@"足球场地",@"篮球场地",@"高光时刻",@"赛事资讯",@"在线客服"];
        NSArray * colorArr = @[@"20C826",@"FFBF00",@"FC305A",@"0cbbbb",@"6B9838"];
        for (int keqiangindex =0 ; keqiangindex < ketitleArr.count; keqiangindex++) {
            CarpVideoMessageBtn * carpBtn =  [[CarpVideoMessageBtn alloc]initWithFrame:CGRectMake(SCREEN_Width/ketitleArr.count* keqiangindex, RealWidth(20)+CGRectGetMaxY(keqiangSdc.frame), SCREEN_Width/ketitleArr.count, RealWidth(70))];
            carpBtn.tag =  keqiangindex;
            carpBtn.CarpVideo_ContentView.backgroundColor = [UIColor colorWithHexString:colorArr[keqiangindex] Alpha:0.15];
            carpBtn.CarpBtomlb.text =  ketitleArr[keqiangindex];
            carpBtn.CarpImgView.image  = [UIImage imageNamed:ketitleArr[keqiangindex]];
            [carpBtn addTarget:self action:@selector(keqiangcboyBtnClicks:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:carpBtn];
            _keBtn = carpBtn;
        }
        UIView * keqiangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(_keBtn.frame)+K(10), SCREEN_Width-K(30), K(1))];
        keqiangline.backgroundColor =  LGDLightGaryColor;
        [self addSubview:keqiangline];
        
        
    }
    return self;
}

-(void)keqiangcboyBtnClicks:(CarpVideoMessageBtn * )keqiangBtn{
    [self.delegate keqianghomeboyHeaderViewDidbtnClicksWithIndex:keqiangBtn.tag];
}
@end
