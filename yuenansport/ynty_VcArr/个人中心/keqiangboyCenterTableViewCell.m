//
//  keqiangboyCenterTableViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyCenterTableViewCell.h"

@interface keqiangboyCenterTableViewCell ()
{
    UILabel * _keqiangbotleftlb;
    UIImageView * _keqiangboyImgView;
}
@end
@implementation keqiangboyCenterTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIImageView * keqiangboyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(15), K(20), K(20))];
        [self.contentView addSubview:keqiangboyImgView];
        _keqiangboyImgView = keqiangboyImgView;
        
        UILabel * keqiangbotleftlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyImgView.frame)+K(5), K(17.5), K(200), K(15))];
        keqiangbotleftlb.textColor = LGDBLackColor;
        keqiangbotleftlb.font = KSysFont(15);
        [self.contentView addSubview:keqiangbotleftlb];
        _keqiangbotleftlb =keqiangbotleftlb;
        
        UIView * keqingboyline = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyImgView.frame)+K(5), K(49), SCREEN_Width-K(30), K(1))];
        keqingboyline.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:keqingboyline];
        
        UIImageView * keqiangboyRightIcon = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(30), K(17.5), K(15), K(15))];
        keqiangboyRightIcon.image = [UIImage imageNamed:@"left"];
        [self.contentView addSubview:keqiangboyRightIcon];
        
        UILabel * keqiangboyRghtlb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(120), K(17.5), K(90), K(15))];
        keqiangboyRghtlb.textAlignment = NSTextAlignmentRight;
        keqiangboyRghtlb.font = KSysFont(13);
        keqiangboyRghtlb.textColor = LGDGaryColor;
        keqiangboyRghtlb.text  = @"0.12M";
        [self.contentView addSubview:keqiangboyRghtlb];
        _keqiangboyRghtlb = keqiangboyRghtlb;
        
    }
    return self;
}
-(void)setImgStr:(NSString *)imgStr{
    _imgStr = imgStr;
    _keqiangboyImgView.image = [UIImage imageNamed:imgStr];
}
-(void)setKeqiangbotText:(NSString *)keqiangbotText{
    _keqiangbotText = keqiangbotText;
    _keqiangbotleftlb.text = keqiangbotText;
}
@end
