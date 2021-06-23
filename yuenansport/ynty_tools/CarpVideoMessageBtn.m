//
//  CarpVideoMessageBtn.m
//  Carpvideo
//
//  Created by zjlk03 on 2021/6/9.
//

#import "CarpVideoMessageBtn.h"
@interface CarpVideoMessageBtn  ()

@end
@implementation CarpVideoMessageBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor whiteColor];
        [self addSubview:self.CarpVideo_ContentView];
        [_CarpVideo_ContentView addSubview:self.CarpImgView];
        [self addSubview:self.CarpBtomlb];

        [_CarpVideo_ContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.top.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(RealWidth(40), RealWidth(40)));
        }];
        [_CarpImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(RealWidth(8), RealWidth(8), RealWidth(8), RealWidth(8)));
        }];
        [_CarpBtomlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(_CarpVideo_ContentView.mas_bottom).offset(RealWidth(5));
        }];
        
    }
    return self;
}
- (UIView *)CarpVideo_ContentView{
    if (!_CarpVideo_ContentView) {
        _CarpVideo_ContentView = [UIView new];
        _CarpVideo_ContentView.backgroundColor = [UIColor redColor];
        _CarpVideo_ContentView.layer.cornerRadius = RealWidth(20);
        _CarpVideo_ContentView.layer.masksToBounds = YES;
        _CarpVideo_ContentView.userInteractionEnabled = NO;
    }
    return _CarpVideo_ContentView;
}
- (UIImageView *)CarpImgView{
    if (!_CarpImgView) {
        _CarpImgView = [UIImageView new];
        _CarpImgView.userInteractionEnabled = YES;
    }
    return _CarpImgView;
}
- (UILabel *)CarpBtomlb{
    if (!_CarpBtomlb) {
        _CarpBtomlb = [UILabel new];
        _CarpBtomlb.textAlignment = NSTextAlignmentCenter;
        _CarpBtomlb.textColor = LGDBLackColor;
        _CarpBtomlb.font = [UIFont systemFontOfSize:12];
    }
    return _CarpBtomlb;
}
@end
