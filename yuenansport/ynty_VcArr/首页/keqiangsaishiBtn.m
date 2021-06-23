//
//  keqiangsaishiBtn.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangsaishiBtn.h"
@interface keqiangsaishiBtn ()

@end
@implementation keqiangsaishiBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.keqianglb];
        [self addSubview:self.keqiangsaourImg];
    }
    return self;
}
-(UILabel *)keqianglb{
    if (!_keqianglb) {
        
        _keqianglb = [[UILabel alloc]initWithFrame:CGRectMake(K(0), 0, K(50), K(15))];
        _keqianglb.textColor = LGDGaryColor;
        _keqianglb.text = @"查看全部";
        _keqianglb.font = KSysFont(13);
        
    }
    return _keqianglb;
}
-(UIImageView *)keqiangsaourImg{
    if (!_keqiangsaourImg) {
        _keqiangsaourImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_keqianglb.frame)+K(0), 0, K(15), K(15))];
        _keqiangsaourImg.image = [UIImage imageNamed:@"left"];
    }
    return _keqiangsaourImg;
}
@end
