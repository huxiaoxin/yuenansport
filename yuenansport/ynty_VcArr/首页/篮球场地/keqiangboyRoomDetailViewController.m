//
//  keqiangboyRoomDetailViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyRoomDetailViewController.h"
#import "keqiangboyLijiyuyeViewController.h"
#import <HUPhotoBrowser/HUPhotoBrowser.h>
@interface keqiangboyRoomDetailViewController ()
@property(nonatomic,strong)UITableView * keqiangoyRoomTableView;
@property(nonatomic,strong) UIView * keqiangRoomHeaderView;
@property(nonatomic,strong) UIButton * keqiangyuyeBtn;
@property(nonatomic,strong) UIImageView * keqiangThubImgView;
@property(nonatomic,strong) UIButton * keqiangcolltecdBtn;
@end

@implementation keqiangboyRoomDetailViewController
-(void)keqiangboyLoginsSucced{
    [self->_keqiangyuyeBtn setBackgroundColor:self.keqnagMidol.isyuyue ? LGDGaryColor : LGDMianColor];
    [self->_keqiangyuyeBtn setTitle:self.keqnagMidol.isyuyue ? @"已预约" : @"立即预约" forState:UIControlStateNormal];
    [_keqiangcolltecdBtn setTitle:self.keqnagMidol.isColltecd ? @"已收藏" : @"收藏" forState:UIControlStateNormal];

}
-(void)keqiangboyTapClicks{
    [HUPhotoBrowser showFromImageView:_keqiangThubImgView withURLStrings:@[self.keqnagMidol.img] atIndex:0];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"场馆详情";
    self.gk_navLineHidden = YES;
    [self.view addSubview:self.keqiangoyRoomTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keqiangboyLoginsSucced) name:@"keqiangboyLoginsSucced" object:nil];
    UIButton * keqiangyuyeBtn  = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(44), SCREEN_Width-K(120), K(44))];
    [keqiangyuyeBtn setBackgroundColor:[UIColor colorWithHexString:@"#6495ED"]];
    [keqiangyuyeBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    keqiangyuyeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [keqiangyuyeBtn addTarget:self action:@selector(keqiangyuyeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangyuyeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    keqiangyuyeBtn.titleLabel.font = KSysFont(15);
    [keqiangyuyeBtn addTarget:self action:@selector(keqiangyuyeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:keqiangyuyeBtn];
    _keqiangyuyeBtn = keqiangyuyeBtn;
    
    UIButton * keqiangcolltecdBtn  = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width-K(120), SCREEN_Height-K(44),K(120), K(44))];
    [keqiangcolltecdBtn setBackgroundColor:[UIColor colorWithHexString:@"#FF69B4"]];
    [keqiangcolltecdBtn setTitle:@"收藏" forState:UIControlStateNormal];
    keqiangcolltecdBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [keqiangcolltecdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    keqiangcolltecdBtn.titleLabel.font = KSysFont(15);
    [keqiangcolltecdBtn addTarget:self action:@selector(keqiangcolltecdBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:keqiangcolltecdBtn];
    _keqiangcolltecdBtn = keqiangcolltecdBtn;

    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD hide];
        self->_keqiangoyRoomTableView.tableHeaderView = self.keqiangRoomHeaderView;
        UIImageView *  keqiangSectionImgView =  [self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(15), K(20), K(20)) keqaingimgname:@"ynty_biaoqian"];
        [self->_keqiangRoomHeaderView addSubview:keqiangSectionImgView];
        
        UILabel * keqiangtitle =  [self keqiagigmCofnierSecitonlbWith:@"场地简介" lbframe:CGRectMake(CGRectGetMaxX(keqiangSectionImgView.frame)+K(5), K(15), K(200), K(15))];
        [self->_keqiangRoomHeaderView addSubview:keqiangtitle];
        
        UIView * keqiangFirstTopView = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangSectionImgView.frame)+K(15), SCREEN_Width-K(30), K(180))];
        keqiangFirstTopView.backgroundColor = [UIColor whiteColor];
        [self->_keqiangRoomHeaderView addSubview:keqiangFirstTopView];
        [keqiangFirstTopView viewShadowPathWithColor:LGDGaryColor shadowOpacity:0.4 shadowRadius:K(4) shadowPathType:LeShadowPathAround shadowPathWidth:K(3)];
        
        UIImageView * keqiangThubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(60), K(20), CGRectGetWidth(keqiangFirstTopView.frame)-K(120), K(100))];
        [keqiangThubImgView sd_setImageWithURL:[NSURL URLWithString:self.keqnagMidol.img]];
        keqiangThubImgView.userInteractionEnabled = YES;
        [keqiangFirstTopView addSubview:keqiangThubImgView];
        self->_keqiangThubImgView=  keqiangThubImgView;
        
        
        UITapGestureRecognizer * keqiangboyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keqiangboyTapClicks)];
        [keqiangThubImgView addGestureRecognizer:keqiangboyTap];
        
        
        UILabel * keqiangTopTtiel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(keqiangThubImgView.frame)+K(20), CGRectGetWidth(keqiangFirstTopView.frame), K(15))];
        keqiangTopTtiel.textAlignment = NSTextAlignmentCenter;
        keqiangTopTtiel.textColor =  LGDBLackColor;
        keqiangTopTtiel.font = KBlFont(14);
        keqiangTopTtiel.text =self.keqnagMidol.name;
        [keqiangFirstTopView addSubview:keqiangTopTtiel];
        
        
        
        
        UIImageView *  keqiangSectionSecondImgView =  [self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(20)+CGRectGetMaxY(keqiangFirstTopView.frame), K(20), K(20)) keqaingimgname:@"xiangqing"];
        [self->_keqiangRoomHeaderView addSubview:keqiangSectionSecondImgView];
        
        
        UILabel * keqiangdetoaltitle =  [self keqiagigmCofnierSecitonlbWith:@"场地详情" lbframe:CGRectMake(CGRectGetMaxX(keqiangSectionSecondImgView.frame)+K(5), K(22)+CGRectGetMaxY(keqiangFirstTopView.frame), K(200), K(15))];
        [self->_keqiangRoomHeaderView addSubview:keqiangdetoaltitle];
        
        
        
        UIView * keqiangSeocndContnView  = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangdetoaltitle.frame)+K(18), SCREEN_Width-K(30), K(200))];
        keqiangSeocndContnView.backgroundColor = [UIColor whiteColor];
        keqiangSeocndContnView.layer.cornerRadius = K(5);
        [self->_keqiangRoomHeaderView addSubview:keqiangSeocndContnView];
        [keqiangSeocndContnView viewShadowPathWithColor:LGDGaryColor shadowOpacity:0.4 shadowRadius:K(4) shadowPathType:LeShadowPathAround shadowPathWidth:K(3)];
        [keqiangSeocndContnView addSubview:[self keqiangboyCofigerlines:CGRectMake(0, K(40), CGRectGetWidth(keqiangSeocndContnView.frame), K(1))]];
        [keqiangSeocndContnView addSubview:[self keqiangboyCofigerlines:CGRectMake(0, K(80), CGRectGetWidth(keqiangSeocndContnView.frame), K(1))]];
        [keqiangSeocndContnView addSubview:[self keqiangboyCofigerlines:CGRectMake(0, K(120), CGRectGetWidth(keqiangSeocndContnView.frame), K(1))]];
        [keqiangSeocndContnView addSubview:[self keqiangboyCofigerlines:CGRectMake(0, K(160), CGRectGetWidth(keqiangSeocndContnView.frame), K(1))]];
        
        
        [keqiangSeocndContnView addSubview:[self keqiangleftCofiferWithImg:CGRectMake(K(15), K(10), K(20), K(20)) keqiangboyImg:@"ynty_price"]];
        
        [keqiangSeocndContnView addSubview:[self keqiangleftCofiferWithImg:CGRectMake(K(15), K(10)+K(40), K(20), K(20)) keqiangboyImg:@"ynty_loactions"]];
        
        [keqiangSeocndContnView addSubview:[self keqiangleftCofiferWithImg:CGRectMake(K(15), K(10)+K(40+40), K(20), K(20)) keqiangboyImg:@"yntytimeicon"]];
        
        [keqiangSeocndContnView addSubview:[self keqiangleftCofiferWithImg:CGRectMake(K(15), K(10)+K(40+40+40), K(20), K(20)) keqiangboyImg:@"yntynsdau"]];
        
        [keqiangSeocndContnView addSubview:[self keqiangleftCofiferWithImg:CGRectMake(K(15), K(10)+K(40+40+40+40), K(20), K(20)) keqiangboyImg:@"ynty_phone"]];
        [keqiangSeocndContnView addSubview:[self keqiangboyconfigerleftlb:@"价格:" keqiangFrame:CGRectMake(K(40), K(12.5), K(60), K(15))]];
        
        [keqiangSeocndContnView addSubview:[self keqiangboyconfigerleftlb:@"地址:" keqiangFrame:CGRectMake(K(40), K(12.5)+K(40), K(60), K(15))]];
        
        [keqiangSeocndContnView addSubview:[self keqiangboyconfigerleftlb:@"营业时间:" keqiangFrame:CGRectMake(K(40), K(12.5)+K(40+40), K(60), K(15))]];
        
        [keqiangSeocndContnView addSubview:[self keqiangboyconfigerleftlb:@"容纳人数:" keqiangFrame:CGRectMake(K(40), K(12.5)+K(40+40+40), K(60), K(15))]];
        
        [keqiangSeocndContnView addSubview:[self keqiangboyconfigerleftlb:@"联系电话:" keqiangFrame:CGRectMake(K(40), K(12.5)+K(40+40+40+40), K(60), K(15))]];
        
        UILabel * keqiangboylb1 =[self keqiangboyrightConfihrRightlbs:self.keqnagMidol.price keqiangFrame:CGRectMake(K(120), K(12.5), K(200), K(15))];
        keqiangboylb1.textColor = [UIColor redColor];
        [keqiangSeocndContnView addSubview:keqiangboylb1];
        
        
        UILabel * keqiangboylb2 =[self keqiangboyrightConfihrRightlbs:self.keqnagMidol.adress keqiangFrame:CGRectMake(K(120), K(12.5)+K(40), K(200), K(15))];
        [keqiangSeocndContnView addSubview:keqiangboylb2];
        
        
        UILabel * keqiangboylb3 =[self keqiangboyrightConfihrRightlbs:@"早9点 - 晚十点" keqiangFrame:CGRectMake(K(120), K(12.5)+K(40+40), K(200), K(15))];
        [keqiangSeocndContnView addSubview:keqiangboylb3];
        
        
        UILabel * keqiangboylb4 =[self keqiangboyrightConfihrRightlbs:[NSString stringWithFormat:@"%@人",self.keqnagMidol.peopleNum] keqiangFrame:CGRectMake(K(120), K(12.5)+K(40+40+40), K(200), K(15))];
        [keqiangSeocndContnView addSubview:keqiangboylb4];
        
        UILabel * keqiangboylb5 =[self keqiangboyrightConfihrRightlbs:self.keqnagMidol.phone keqiangFrame:CGRectMake(K(120), K(12.5)+K(40+40+40+40), K(200), K(15))];
        [keqiangSeocndContnView addSubview:keqiangboylb5];
        
        
        
        
        UIImageView *  keqiangSectionSecondImgView2 =  [self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(20)+CGRectGetMaxY(keqiangSeocndContnView.frame), K(20), K(20)) keqaingimgname:@"xiangqing"];
        [self->_keqiangRoomHeaderView addSubview:keqiangSectionSecondImgView2];
        
        
        UILabel * keqiangdetoaltitle3 =  [self keqiagigmCofnierSecitonlbWith:@"租场规则" lbframe:CGRectMake(CGRectGetMaxX(keqiangSectionSecondImgView.frame)+K(5), K(22)+CGRectGetMaxY(keqiangSeocndContnView.frame), K(200), K(15))];
        [self->_keqiangRoomHeaderView addSubview:keqiangdetoaltitle3];
        
        UILabel * keqianhgboymshlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangdetoaltitle3.frame)+K(15), SCREEN_Width-K(15), K(14))];
        keqianhgboymshlb.textColor  = [UIColor redColor];
        keqianhgboymshlb.font = KSysFont(13);
        keqianhgboymshlb.text = @"本场馆严禁用于商业活动，一经发现立即终止租赁";
        [self->_keqiangRoomHeaderView addSubview:keqianhgboymshlb];
        NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
        if ([keqiangboyState isEqualToString:@"1"]) {
    [self->_keqiangyuyeBtn setBackgroundColor:self.keqnagMidol.isyuyue ? LGDGaryColor : LGDMianColor];
    [self->_keqiangyuyeBtn setTitle:self.keqnagMidol.isyuyue ? @"已预约" : @"立即预约" forState:UIControlStateNormal];
            [keqiangcolltecdBtn setTitle:self.keqnagMidol.isColltecd ? @"已收藏" : @"收藏" forState:UIControlStateNormal];
        }else{
            [keqiangcolltecdBtn setTitle:@"收藏" forState:UIControlStateNormal];
            [self->_keqiangyuyeBtn setBackgroundColor:LGDMianColor];
            [self->_keqiangyuyeBtn setTitle:@"立即预约" forState:UIControlStateNormal];
        }
       
    });

    
}
#pragma mark--预约
-(void)keqiangyuyeBtnClick{
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if (![keqiangboyState isEqualToString:@"1"]) {
        [self ymtySportShowloginVc];
        return;
    }
    if (self.keqnagMidol.isyuyue) {
        [LCProgressHUD showInfoMsg:@"您已预约，请注意查收场馆短信通知"];
        return;
    }
    keqiangboyLijiyuyeViewController * keqangbytYueVc = [[keqiangboyLijiyuyeViewController alloc]init];
    keqangbytYueVc.keqiangModel = self.keqnagMidol;
    keqangbytYueVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangbytYueVc animated:YES];
}
#pragma mark--收藏
-(void)keqiangcolltecdBtnClick{
//
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if (![keqiangboyState isEqualToString:@"1"]) {
        [self ymtySportShowloginVc];
        return;
    }
    MJWeakSelf;
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD hide];
        weakSelf.keqnagMidol.isColltecd = !weakSelf.keqnagMidol.isColltecd;
    [WHC_ModelSqlite update:[yntyHomeYundonModel class] value:[NSString stringWithFormat:@" isColltecd = '%@'",@(weakSelf.keqnagMidol.isColltecd)] where:[NSString stringWithFormat:@"ContentID = '%ld'",weakSelf.keqnagMidol.ContentID]];

        [_keqiangcolltecdBtn setTitle:weakSelf.keqnagMidol.isColltecd ? @"已收藏" : @"收藏" forState:UIControlStateNormal];
    });
}
-(UILabel * )keqiangboyrightConfihrRightlbs:(NSString *)keqaigtext keqiangFrame:(CGRect)frame{
    UILabel * keqiannlb = [[UILabel alloc]initWithFrame:frame];
    keqiannlb.text = keqaigtext;
    keqiannlb.textColor = LGDBLackColor;
    keqiannlb.font = KSysFont(13);
    return keqiannlb;
}
-(UILabel *)keqiangboyconfigerleftlb:(NSString *)keqiangText keqiangFrame:(CGRect)keqiangframe{
    UILabel * keqiangCofherlb = [[UILabel alloc]initWithFrame:keqiangframe];
    keqiangCofherlb.textColor = LGDBLackColor;
    keqiangCofherlb.font =KSysFont(13);
    keqiangCofherlb.text =  keqiangText;
    return keqiangCofherlb;
}
-(UIView *)keqiangboyCofigerlines:(CGRect)keqiFrame{
    UIView * keiqvie = [[UIView alloc]initWithFrame:keqiFrame];
    keiqvie.backgroundColor = LGDLightGaryColor;
    return keiqvie;
}
-(UIImageView *)keqiangleftCofiferWithImg:(CGRect)orimg keqiangboyImg:(NSString *)keImg{
    UIImageView * kefiConfgeImg = [[UIImageView alloc]initWithFrame:orimg];
    kefiConfgeImg.image = [UIImage imageNamed:keImg];
    return kefiConfgeImg;
}
-(UIView *)keqiangRoomHeaderView{
    if (!_keqiangRoomHeaderView) {
        _keqiangRoomHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(200))];
        _keqiangRoomHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _keqiangRoomHeaderView;
}
-(UIImageView * )keqiangboyConfigerSectionImg:(CGRect)Frme keqaingimgname:(NSString *)keqiang{
    UIImageView *keimg =[[UIImageView alloc]initWithFrame:Frme];
    keimg.image = [UIImage imageNamed:keqiang];
    return keimg;
}
-(UILabel *)keqiagigmCofnierSecitonlbWith:(NSString *)lbStr lbframe:(CGRect)lbFrame{
    UILabel * keqiaglbFrae = [[UILabel  alloc]initWithFrame:lbFrame];
    keqiaglbFrae.textColor = LGDBLackColor;
    keqiaglbFrae.font = KBlFont(16);
    keqiaglbFrae.text = lbStr;
    return keqiaglbFrae;
}
-(UITableView *)keqiangoyRoomTableView{
    if (!_keqiangoyRoomTableView) {
        _keqiangoyRoomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height-K(44)) style:UITableViewStylePlain];
        _keqiangoyRoomTableView.showsVerticalScrollIndicator = NO;
        _keqiangoyRoomTableView.showsHorizontalScrollIndicator = NO;
        _keqiangoyRoomTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangoyRoomTableView.backgroundColor = [UIColor whiteColor];
    }
    return _keqiangoyRoomTableView;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
