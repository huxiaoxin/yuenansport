//
//  keqiangboyhangqingTableViewCell.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyhangqingTableViewCell.h"
#import "keqiangboyhangCollectionViewCell.h"
#import "keqiangboyAdreeBtn.h"
#import <HUPhotoBrowser/HUPhotoBrowser.h>
@interface keqiangboyhangqingTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView * _keqangboyCollectionView;
    UILabel * _keqiangsoureTitle;
    UIImageView * _keqiangsoureImgView;
    UILabel * _keqiangsatimes;
    UILabel * _keqiangboyContentlb;
    UIImageView * _keqaingboyAdresImgView;
    UILabel * _keqiangadrelb;
    keqiangboyAdreeBtn * _keqiangcoemnbtn;
    keqiangboyAdreeBtn * _keqiangzanbtn;
    UIView * _keqiangline;
}
@end
@implementation keqiangboyhangqingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        UIImageView * keqiangsoureImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(15), K(35), K(35))];
        keqiangsoureImgView.backgroundColor = LGDLightGaryColor;
        keqiangsoureImgView.layer.cornerRadius = K(17.5);
        keqiangsoureImgView.layer.masksToBounds = YES;
        [self.contentView addSubview:keqiangsoureImgView];
        _keqiangsoureImgView = keqiangsoureImgView;
        
        
        UILabel * keqiangsoureTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangsoureImgView.frame)+K(5), CGRectGetMinY(keqiangsoureImgView.frame)+K(5), K(200), K(15))];
        keqiangsoureTitle.textColor = LGDBLackColor;
        keqiangsoureTitle.text = @"纯纯纯呢";
        keqiangsoureTitle.font = KSysFont(13);
        [self.contentView addSubview:keqiangsoureTitle];
        _keqiangsoureTitle = keqiangsoureTitle;
        
        
        UILabel * keqiangsatimes = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangsoureImgView.frame)+K(5), CGRectGetMaxY(keqiangsoureTitle.frame)+K(5), K(200), K(12))];
        keqiangsatimes.textColor = LGDGaryColor;
        keqiangsatimes.text = @"8月25日";
        keqiangsatimes.font = KSysFont(10);
        [self.contentView addSubview:keqiangsatimes];
        _keqiangsatimes = keqiangsatimes;
        
        
        UIButton * keqiangsouremoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(30), CGRectGetMidY(keqiangsoureImgView.frame)-K(7.5), K(15), K(15))];
        keqiangsouremoreBtn.tag = 2;
        [keqiangsouremoreBtn addTarget:self action:@selector(keqiangsouremoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [keqiangsouremoreBtn setBackgroundImage:[UIImage imageNamed:@"gengduo-copy"] forState:UIControlStateNormal];
        [self.contentView addSubview:keqiangsouremoreBtn];
        
        UILabel * keqiangboyContentlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangsoureImgView.frame)+K(10), SCREEN_Width-K(30), K(40))];
        keqiangboyContentlb.numberOfLines = 0 ;
        keqiangboyContentlb.textColor = LGDBLackColor;
        keqiangboyContentlb.font = KSysFont(14);
        keqiangboyContentlb.text  =@"keqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtnkeqiangsouremoreBtn";
        [self.contentView addSubview:keqiangboyContentlb];
        _keqiangboyContentlb = keqiangboyContentlb;
        
        
        UICollectionViewFlowLayout * keqiangboyLayout = [[UICollectionViewFlowLayout alloc]init];
        keqiangboyLayout.itemSize = CGSizeMake(K(110), K(110));
        keqiangboyLayout.sectionInset =  UIEdgeInsetsMake(0, K(10), 0, K(10));
        keqiangboyLayout.minimumLineSpacing = K(0);
        keqiangboyLayout.minimumInteritemSpacing = K(0);
        UICollectionView * keqangboyCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(keqiangboyContentlb.frame)+K(10), SCREEN_Width, K(120)) collectionViewLayout:keqiangboyLayout];
        keqangboyCollectionView.delegate = self;
        keqangboyCollectionView.dataSource= self;
        keqangboyCollectionView.showsVerticalScrollIndicator = NO;
        keqangboyCollectionView.showsHorizontalScrollIndicator = NO;
        keqangboyCollectionView.backgroundColor =[UIColor whiteColor];
        [self.contentView addSubview:keqangboyCollectionView];
        _keqangboyCollectionView  = keqangboyCollectionView;
        
        [keqangboyCollectionView registerClass:[keqiangboyhangCollectionViewCell class] forCellWithReuseIdentifier:@"keqiangboyhangCollectionViewCell"];
        
        UIImageView * keqaingboyAdresImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqangboyCollectionView.frame)+K(10), K(15), K(15))];
        keqaingboyAdresImgView.image = [UIImage imageNamed:@"weizhi"];
        [self.contentView addSubview:keqaingboyAdresImgView];
        _keqaingboyAdresImgView = keqaingboyAdresImgView;
        
        
        UILabel * keqiangadrelb  =  [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqaingboyAdresImgView.frame)+K(2), CGRectGetMaxY(keqangboyCollectionView.frame)+K(10), K(150), K(15))];
        keqiangadrelb.textColor = LGDGaryColor;
        keqiangadrelb.font = KSysFont(13);
        keqiangadrelb.text = @"王梅路。侵害去";
        [self.contentView addSubview:keqiangadrelb];
        _keqiangadrelb = keqiangadrelb;
        
        
        keqiangboyAdreeBtn * keqiangcoemnbtn = [[keqiangboyAdreeBtn  alloc]initWithFrame:CGRectMake(SCREEN_Width-K(60), CGRectGetMaxY(keqangboyCollectionView.frame)+K(10), K(45), K(15))];
        keqiangcoemnbtn.kelb.text = @"评论";
        keqiangcoemnbtn.tag = 0;
        [keqiangcoemnbtn addTarget:self action:@selector(keqiangboyAdreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        keqiangcoemnbtn.keqianImg.image = [UIImage imageNamed:@"pinglun"];
        [self.contentView addSubview:keqiangcoemnbtn];
        _keqiangcoemnbtn = keqiangcoemnbtn;
        
        
        keqiangboyAdreeBtn * keqiangzanbtn = [[keqiangboyAdreeBtn  alloc]initWithFrame:CGRectMake(CGRectGetMinX(keqiangcoemnbtn.frame)-K(55), CGRectGetMaxY(keqangboyCollectionView.frame)+K(10), K(45), K(15))];
        keqiangzanbtn.kelb.text = @"12";
        keqiangzanbtn.tag = 1;
        [keqiangzanbtn addTarget:self action:@selector(keqiangboyAdreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        keqiangzanbtn.keqianImg.image = [UIImage imageNamed:@""];
        [self.contentView addSubview:keqiangzanbtn];
        _keqiangzanbtn = keqiangzanbtn;
        
        UIView * keqiangline = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangcoemnbtn.frame)+K(10), SCREEN_Width-K(30), K(1))];
        keqiangline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangline];
        _keqiangline = keqiangline;
        
        
    }
    return self;
}
-(void)keqiangboyAdreeBtnClick:(keqiangboyAdreeBtn *)keqiangBtn{
    [self.delegate keqiangboyhangqingTableViewCellWithBtnIndex:keqiangBtn.tag CellIndexed:self.tag];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _keqiangModel.photos.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyhangCollectionViewCell * keqiangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqiangboyhangCollectionViewCell" forIndexPath:indexPath];
    [keqiangCell.keqiangsoureImgView sd_setImageWithURL:[NSURL URLWithString:_keqiangModel.photos[indexPath.row]]];
    return keqiangCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyhangCollectionViewCell * keqiangCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqiangboyhangCollectionViewCell" forIndexPath:indexPath];
    [HUPhotoBrowser showFromImageView:keqiangCell.keqiangsoureImgView withURLStrings:_keqiangModel.photos.copy atIndex:indexPath.row];
}
-(void)setKeqiangModel:(keqiangboyHangqingModel *)keqiangModel{
    _keqiangModel = keqiangModel;
    [_keqangboyCollectionView reloadData];
    _keqiangsatimes.text = keqiangModel.time;
    _keqiangsoureTitle.text =  keqiangModel.name;
    _keqiangadrelb.text = keqiangModel.adress;
    NSString * ISLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if ([ISLogin isEqualToString:@"1"]) {
        _keqiangzanbtn.keqianImg.image = [UIImage imageNamed:keqiangModel.isZan ? @"点赞选中" : @"点赞"];
    }else{
        _keqiangzanbtn.keqianImg.image = [UIImage imageNamed:@"点赞"];

    }
    _keqiangzanbtn.kelb.text  = [NSString stringWithFormat:@"%ld",keqiangModel.zanNum];
    [_keqiangsoureImgView sd_setImageWithURL:[NSURL URLWithString:keqiangModel.header]];
    [_keqiangboyContentlb setText:keqiangModel.content lineSpacing:K(3)];
    _keqiangboyContentlb.height = [_keqiangboyContentlb getSpaceLabelHeight:keqiangModel.content withFont:KSysFont(14) withWidth:SCREEN_Width-K(30)].height;
    _keqangboyCollectionView.y = CGRectGetMaxY(_keqiangboyContentlb.frame)+K(10);
    _keqangboyCollectionView.height = _keqangboyCollectionView.collectionViewLayout.collectionViewContentSize.height;
    _keqaingboyAdresImgView.y = CGRectGetMaxY(_keqangboyCollectionView.frame)+K(10);
    _keqiangadrelb.y = CGRectGetMaxY(_keqangboyCollectionView.frame)+K(10);
    _keqiangcoemnbtn.y = CGRectGetMaxY(_keqangboyCollectionView.frame)+K(10);
    _keqiangzanbtn.y = CGRectGetMaxY(_keqangboyCollectionView.frame)+K(10);
    _keqiangline.y = CGRectGetMaxY(_keqiangcoemnbtn.frame)+K(10);
    keqiangModel.Cellheight = CGRectGetMaxY(_keqiangline.frame);
}
-(void)keqiangsouremoreBtnClick:(UIButton *)keqiangtBtn{
    [self.delegate keqiangboyhangqingTableViewCellWithBtnIndex:keqiangtBtn.tag CellIndexed:self.tag];

}
@end
