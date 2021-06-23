
#import "keqiangboySendingCollectionCell.h"
@interface keqiangboySendingCollectionCell ()
{
    
}
@end
@implementation keqiangboySendingCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * keqiangboyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K(50), K(50))];
        keqiangboyImgView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangboyImgView];
        _keqiangboysImgView = keqiangboyImgView;
        
    }
    return self;
}
-(void)setKeqiangboyImg:(UIImage *)keqiangboyImg{
    _keqiangboyImg = keqiangboyImg;
    _keqiangboysImgView .image = keqiangboyImg;
}
@end
