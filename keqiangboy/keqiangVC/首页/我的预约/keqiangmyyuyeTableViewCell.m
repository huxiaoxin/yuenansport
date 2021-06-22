//
//  keqiangmyyuyeTableViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangmyyuyeTableViewCell.h"
@interface keqiangmyyuyeTableViewCell ()
{
    UILabel * _keqiangsourelb;
    UIImageView * _keqiangThubImgView;
    UILabel * _keqiangContenlb;
    UILabel * _keqiangtaglb;
}
@end
@implementation keqiangmyyuyeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        
              self.selectionStyle =  UITableViewCellSelectionStyleNone;
         UIImageView * keqiangThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(135), K(10), K(120), K(80))];
         keqiangThubImgView.backgroundColor = LGDLightGaryColor;
         [self.contentView addSubview:keqiangThubImgView];
         _keqiangThubImgView = keqiangThubImgView;
        
        
        //
        UIView * keqiangbobofangView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(120), K(80))];
        keqiangbobofangView.backgroundColor = LGDBLackColor;
        keqiangbobofangView.alpha = 0.4;
        [keqiangThubImgView addSubview:keqiangbobofangView];
        
        UIImageView *keqoboimgview= [[UIImageView alloc]initWithFrame:CGRectMake(K(45), K(25), K(30), K(30))];
        keqoboimgview.image = [UIImage imageNamed:@"bofang"];
        [keqiangThubImgView addSubview:keqoboimgview];
        
         
         UIView * keqiangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(99), SCREEN_Width-K(30), K(1))];
         keqiangline.backgroundColor =  LGDLightGaryColor;
         [self.contentView addSubview:keqiangline];
         
         
         UILabel * keqiangtaglb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(keqiangThubImgView.frame)-K(100), CGRectGetMaxY(keqiangThubImgView.frame)-K(18), K(90), K(15))];
         keqiangtaglb.textAlignment = NSTextAlignmentRight;
         keqiangtaglb.textColor = LGDGaryColor;
         keqiangtaglb.text = @"民间联赛";
         keqiangtaglb.font = KBlFont(14);
         [self.contentView addSubview:keqiangtaglb];
        _keqiangtaglb= keqiangtaglb;
         
         UILabel * keqiangsourelb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangThubImgView.frame)-K(20), K(200), K(13))];
         keqiangsourelb.textColor = LGDGaryColor;
         keqiangsourelb.font = KBlFont(11);
         keqiangsourelb.text =  @"82次阅读 27条评论";
         [self.contentView addSubview:keqiangsourelb];
         _keqiangsourelb = keqiangsourelb;
         
         
         UILabel * keqiangContenlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(10), SCREEN_Width-K(30+5)-CGRectGetWidth(keqiangThubImgView.frame), K(50))];
         keqiangContenlb.textColor = LGDBLackColor;
         keqiangContenlb.font = KBlFont(15);
         keqiangContenlb.numberOfLines = 0;
         keqiangContenlb.text = @"今年全市新增体育场100万平方米，争取1座体育公园";
         [self.contentView addSubview:keqiangContenlb];
         _keqiangContenlb  = keqiangContenlb;

        
        
    }
    return self;
}
-(void)setKeqoangModle:(keqiangboyVideomModel *)keqoangModle{
    _keqoangModle = keqoangModle;
  NSString * keqiangText =  [keqoangModle.publishTime stringByReplacingOccurrencesOfString:@"T" withString:@" "];
   NSString * keqiangFirstText =   [keqiangText componentsSeparatedByString:@"."].firstObject;
    _keqiangsourelb.text =  keqiangFirstText;
    _keqiangContenlb.text =  keqoangModle.title;
    _keqiangtaglb.text =  [NSString stringWithFormat:@"%@人浏览",keqoangModle.viewCount];
}
-(void)setKeqoangImgArr:(NSString *)keqoangImgArr{
    _keqoangImgArr = keqoangImgArr;
    [_keqiangThubImgView sd_setImageWithURL:[NSURL URLWithString:keqoangImgArr]];
}
@end
