//
//  keqianboyrommTableViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqianboyrommTableViewCell.h"
@interface keqianboyrommTableViewCell ()
{
    UIImageView * _keqangImgView;
    UILabel * _keqiangTitle;
    UILabel * _keiqangboyadredlb;
    UILabel * _keqiangPrcielb;
}
@end
@implementation keqianboyrommTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIView * keqiangContentView  = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(10), SCREEN_Width-K(30), K(180))];
        keqiangContentView.backgroundColor = [UIColor whiteColor];
        keqiangContentView.layer.cornerRadius = K(5);
        
        [self.contentView addSubview:keqiangContentView];
        [keqiangContentView viewShadowPathWithColor:LGDGaryColor shadowOpacity:0.4 shadowRadius:K(5) shadowPathType:LeShadowPathAround shadowPathWidth:K(5)];
        
        UIImageView * keqangImgView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width-K(30), K(130))];
        keqangImgView.backgroundColor = LGDLightGaryColor;
        keqangImgView.layer.cornerRadius = K(5);
        keqangImgView.layer.masksToBounds = YES;
        [keqiangContentView addSubview:keqangImgView];
        _keqangImgView = keqangImgView;
        
        
        UILabel * keqiangTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqangImgView.frame)+K(8), K(200), K(15))];
        keqiangTitle.textColor = LGDBLackColor;
        keqiangTitle.font = KBlFont(16);
        keqiangTitle.text = @"艾瑞克镇冰化学中心";
        [keqiangContentView addSubview:keqiangTitle];
        _keqiangTitle = keqiangTitle;
        
        
        UIImageView * keiqnagadressImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqiangTitle.frame)+K(8), K(14), K(14))];
        keiqnagadressImgView.image = [UIImage imageNamed:@"weizhi"];
        [keqiangContentView addSubview:keiqnagadressImgView];
        
        
        UILabel * keiqangboyadredlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keiqnagadressImgView.frame)+K(5), CGRectGetMaxY(keqiangTitle.frame)+K(9), K(200), K(13))];
        keiqangboyadredlb.textColor = LGDLightBLackColor;
        keiqangboyadredlb.font = KSysFont(12);
        keiqangboyadredlb.text =  @"松江区荣岁路1396号A11-1（芸窗院内）";
        [keqiangContentView addSubview:keiqangboyadredlb];
        _keiqangboyadredlb = keiqangboyadredlb;
        
        
        
        UILabel *keqiangPrcielb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangContentView.frame)-K(120), CGRectGetMaxY(keqangImgView.frame)+K(8), K(105), K(15))];
        keqiangPrcielb.textAlignment = NSTextAlignmentRight;
        keqiangPrcielb.font = KBlFont(15);
        keqiangPrcielb.textColor = [UIColor redColor];
        keqiangPrcielb.text = @"¥25/h";
        [keqiangContentView addSubview:keqiangPrcielb];
        _keqiangPrcielb = keqiangPrcielb;
        
    }
    return self;
}
-(void)setKeqnagMidol:(keqiangChangdiModel *)keqnagMidol{
    _keqnagMidol = keqnagMidol;
    [_keqangImgView sd_setImageWithURL:[NSURL URLWithString:keqnagMidol.img]];
    _keqiangTitle.text = keqnagMidol.name;
    _keiqangboyadredlb.text =  keqnagMidol.adress;
    _keqiangPrcielb.text =  keqnagMidol.price;
}
@end
