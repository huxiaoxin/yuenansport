
#import "keqiangboyDetailBtn.h"

@implementation keqiangboyDetailBtn
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self addSubview:self.keqiangboyTopImgView];
        [self addSubview:self.keqiangboybtomlb];
    }
    return self;
}
-(UILabel *)keqiangboybtomlb{
    if (!_keqiangboybtomlb) {
        _keqiangboybtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_keqiangboyTopImgView.frame)+K(2), 0, K(24), K(12))];
        _keqiangboybtomlb.font = KSysFont(12);
    }
    return _keqiangboybtomlb;
}
-(UIImageView *)keqiangboyTopImgView{
    if (!_keqiangboyTopImgView) {
        _keqiangboyTopImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(15), K(15))];
    }
    return _keqiangboyTopImgView;
}
@end
