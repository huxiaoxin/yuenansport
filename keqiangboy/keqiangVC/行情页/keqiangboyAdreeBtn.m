//
//  keqiangboyAdreeBtn.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyAdreeBtn.h"
@interface keqiangboyAdreeBtn ()

@end
@implementation keqiangboyAdreeBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self addSubview:self.keqianImg];
        [self addSubview:self.kelb];
    }
    return self;
}
-(UIImageView *)keqianImg{
    if (!_keqianImg) {
        _keqianImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(15), K(15))];
    }
    return _keqianImg;
}
-(UILabel *)kelb{
    if (!_kelb) {
        _kelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_keqianImg.frame)+K(2), 0, K(40), K(15))];
        _kelb.textColor = LGDGaryColor;
        _kelb.font = KSysFont(14);
    }
    return _kelb;
}
@end
