//
//  keqianghomeBtn.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqianghomeBtn.h"

@implementation keqianghomeBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.keqiangTopImg];
        [self addSubview:self.keqiangBtomlb];
    }
    return self;
}
-(UIImageView *)keqiangTopImg{
    if (!_keqiangTopImg) {
        CGFloat keqiangboyBtnWidth = SCREEN_Width/5;
        _keqiangTopImg = [[UIImageView alloc]initWithFrame:CGRectMake(keqiangboyBtnWidth/2-K(22.5), 0, K(45), K(45))];
    }
    return _keqiangTopImg;
}
-(UILabel *)keqiangBtomlb{
    if (!_keqiangBtomlb) {
        CGFloat keqiangboyBtnWidth = SCREEN_Width/5;
        _keqiangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_keqiangTopImg.frame)+K(5),keqiangboyBtnWidth, K(13))];
        _keqiangBtomlb.textAlignment = NSTextAlignmentCenter;
        _keqiangBtomlb.font = KBlFont(12);
        _keqiangBtomlb.textColor = LGDLightBLackColor;
        
    }
    return _keqiangBtomlb;
}
@end
