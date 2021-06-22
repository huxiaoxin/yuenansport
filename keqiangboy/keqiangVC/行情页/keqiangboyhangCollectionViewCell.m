//
//  keqiangboyhangCollectionViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyhangCollectionViewCell.h"

@implementation keqiangboyhangCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView * keqiangsoureImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(5), 0, K(100), K(100))];
        keqiangsoureImgView.backgroundColor =  LGDLightGaryColor;
        keqiangsoureImgView.layer.cornerRadius = K(5);
        keqiangsoureImgView.layer.masksToBounds = YES;
        [self.contentView addSubview:keqiangsoureImgView];
        _keqiangsoureImgView = keqiangsoureImgView;
        
    }
    return self;
}

@end
