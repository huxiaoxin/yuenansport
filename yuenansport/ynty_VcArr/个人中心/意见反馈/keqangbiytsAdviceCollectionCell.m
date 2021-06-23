#import "keqangbiytsAdviceCollectionCell.h"
@interface keqangbiytsAdviceCollectionCell ()
{
    UIButton * _shangchuanshanbut;
}
@end
@implementation keqangbiytsAdviceCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
        UIImageView * keqiangboyImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(0, K(7.5), K(150/2), K(150/2))];
        keqiangboyImgViews.layer.cornerRadius  =K(5);
        keqiangboyImgViews.layer.masksToBounds = YES;
        keqiangboyImgViews.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangboyImgViews];
        _keqiangboyImgViews = keqiangboyImgViews;
        
        
        UIButton * shangchuanshanbut = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangboyImgViews.frame)-K(7.5), K(0), K(15), K(15.5))];
        [shangchuanshanbut addTarget:self action:@selector(shangchuanshanbutnCliks) forControlEvents:UIControlEventTouchUpInside];
        [shangchuanshanbut setBackgroundImage:[UIImage imageNamed:@"删除图片"] forState:UIControlStateNormal];
        [self addSubview:shangchuanshanbut];
        _shangchuanshanbut  =shangchuanshanbut;
        
        
        
    }
    return self;
}
-(void)shangchuanshanbutnCliks{
    [self.Delegate  keqinagboysCollectionCellDelegateWithBtnCliocks:self.tag];
}
-(void)setKeqiangimmgs:(UIImage *)keqiangimmgs{
    _keqiangimmgs = keqiangimmgs;
    UIImage * keqiangbof = [UIImage imageNamed:@"yntydajhgdakdgaq"];
    if (keqiangbof  == keqiangimmgs) {
        _shangchuanshanbut.hidden = YES;
    }else{
        _shangchuanshanbut.hidden = NO;
    }
        _keqiangboyImgViews.image = keqiangimmgs;
}
@end
