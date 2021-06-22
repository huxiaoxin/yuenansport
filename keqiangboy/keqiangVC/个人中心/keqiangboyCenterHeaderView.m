//
//  keqiangboyCenterHeaderView.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyCenterHeaderView.h"

@implementation keqiangboyCenterHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =  [UIColor whiteColor];
        
        UIImageView * keqiangboyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(180))];
        keqiangboyImgView.userInteractionEnabled = YES;
        keqiangboyImgView.backgroundColor = LGDMianColor;
        [self addSubview:keqiangboyImgView];
        
        UIImageView * keqiangboyHeaderImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(35), K(50), K(70), K(70))];
        keqiangboyHeaderImgView.layer.cornerRadius = K(35);
        keqiangboyHeaderImgView.layer.masksToBounds = YES;
        keqiangboyHeaderImgView.userInteractionEnabled = YES;
        keqiangboyHeaderImgView.backgroundColor = LGDLightGaryColor;
        [keqiangboyImgView addSubview:keqiangboyHeaderImgView];
        _keqiangboyHeaderImgView = keqiangboyHeaderImgView;
        UITapGestureRecognizer * keqiangboyInfoTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keqiangboyinfoTapClcs)];
        [keqiangboyHeaderImgView addGestureRecognizer:keqiangboyInfoTap];
        
        UILabel * keqiangboylb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(keqiangboyHeaderImgView.frame)+K(10), SCREEN_Width, K(15))];
        keqiangboylb.textAlignment = NSTextAlignmentCenter;
        keqiangboylb.textColor = [UIColor whiteColor];
        keqiangboylb.font = KBlFont(15);
        keqiangboylb.text = @"A8体育";
        [keqiangboyImgView addSubview:keqiangboylb];
        _keqiangboylb = keqiangboylb;
        
        
    }
    return self;
}
-(void)keqiangboyinfoTapClcs{
    [self.delegate keqiangboyCenterHeaderViewDidTapClicks];
}
@end
