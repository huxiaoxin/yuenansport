//
//  keqiangboyHomeTableViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyHomeTableViewCell.h"
#import "WWStarView.h"
@interface keqiangboyHomeTableViewCell ()
{
    UILabel * _keqiangsourelb;
    UIImageView * _keqiangThubImgView;
    UILabel * _keqianpricelblb;
    UILabel * _keqiangtaglb;
    UILabel * _keqiangsadresslb;
    WWStarView * _WindoItemTopStalb;
    UIButton * _keqiangboyyuyeBtn;
}
@end
@implementation keqiangboyHomeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
                
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIImageView * keqiangThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(10), K(120), K(80))];
        keqiangThubImgView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangThubImgView];
        _keqiangThubImgView = keqiangThubImgView;
        
        UIView * keqiangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), K(99), SCREEN_Width-K(30), K(1))];
        keqiangline.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:keqiangline];
        
        
        UILabel * keqiangtaglb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangThubImgView.frame)+K(5), K(10),SCREEN_Width-CGRectGetMaxX(keqiangThubImgView.frame)-K(10), K(15))];
      keqiangtaglb.textColor = LGDBLackColor;
        keqiangtaglb.text = @"民间联赛民间联赛民间联赛民间联赛民间联赛民间联赛民间联赛民间联赛";
        keqiangtaglb.font = KBlFont(14);
        [self.contentView addSubview:keqiangtaglb];
        _keqiangtaglb = keqiangtaglb;
        
        
        UILabel * keqianpricelblb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangThubImgView.frame)+K(10), CGRectGetMaxY(keqiangtaglb.frame)+K(10), K(200), K(13))];
        keqianpricelblb.textColor = [UIColor redColor];
        keqianpricelblb.font = KBlFont(11);
        keqianpricelblb.text =  @"¥ 12/h";
        [self.contentView addSubview:keqianpricelblb];
        _keqianpricelblb = keqianpricelblb;
        
        
        UILabel * keqiangsadresslb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangThubImgView.frame)+K(5), CGRectGetMaxY(keqianpricelblb.frame)+K(5), K(200), K(13))];
        keqiangsadresslb.textColor = LGDGaryColor;
        keqiangsadresslb.font = KBlFont(11);
        keqiangsadresslb.text =  @"平海路122号";
        [self.contentView addSubview:keqiangsadresslb];
        _keqiangsadresslb=  keqiangsadresslb;
        
        
        WWStarView * WindoItemTopStalb =[[WWStarView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangThubImgView.frame)+K(5), CGRectGetMaxY(keqiangsadresslb.frame)+K(5),K(124), K(15)) numberOfStars:5 currentStar:0 rateStyle:WholeStar isAnination:NO andamptyImageName:@"w" fullImageName:@"q" finish:^(CGFloat currentStar) {
              }];
        WindoItemTopStalb.userInteractionEnabled = NO;
        [self.contentView addSubview:WindoItemTopStalb];
        _WindoItemTopStalb=  WindoItemTopStalb;
        
        
        UIButton * keqiangboyyuyeBtn  =  [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(90), K(10), K(70), K(30))];
        [keqiangboyyuyeBtn setBackgroundColor:LGDMianColor];
        keqiangboyyuyeBtn.titleLabel.font = KSysFont(14);
        [keqiangboyyuyeBtn addTarget:self action:@selector(keqiangboyyuyeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [keqiangboyyuyeBtn setTitle:@"立即预约" forState:UIControlStateNormal];
        keqiangboyyuyeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        keqiangboyyuyeBtn.layer.cornerRadius = K(5);
        keqiangboyyuyeBtn.layer.masksToBounds = YES;
        [keqiangboyyuyeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.contentView addSubview:keqiangboyyuyeBtn];
        _keqiangboyyuyeBtn = keqiangboyyuyeBtn;
        
    }
    return self;
}
-(void)setKeqnagMidol:(keqiangChangdiModel *)keqnagMidol{
    _keqnagMidol = keqnagMidol;
    [_keqiangThubImgView sd_setImageWithURL:[NSURL URLWithString:keqnagMidol.img]];
    _keqiangtaglb.text = keqnagMidol.name;
    _keqianpricelblb.text = keqnagMidol.currentpirce;
    _keqiangsadresslb.text = keqnagMidol.adress;
    _WindoItemTopStalb.currentStar = keqnagMidol.stareNum;
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
 
    if ([keqiangboyState isEqualToString:@"1"]) {
        [_keqiangboyyuyeBtn setTitle:keqnagMidol.isyuyue ? @"已预约" : @"立即预约" forState:UIControlStateNormal];
        [_keqiangboyyuyeBtn setBackgroundColor:keqnagMidol.isyuyue ? LGDGaryColor : LGDMianColor];
    }else{
        [_keqiangboyyuyeBtn setTitle:@"立即预约" forState:UIControlStateNormal];
        [_keqiangboyyuyeBtn setBackgroundColor:LGDMianColor];
    }
    
}
-(void)keqiangboyyuyeBtnClick{
    [self.delegate keqiangboyHomeTableViewCellbtndidSeltecdWithCellindex:self.tag];
}
@end
