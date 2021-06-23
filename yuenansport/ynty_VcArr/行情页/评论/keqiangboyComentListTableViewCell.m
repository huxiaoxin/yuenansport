#import "keqiangboyComentListTableViewCell.h"
#import "keqiangboyDetailBtn.h"
@interface keqiangboyComentListTableViewCell ()
{
    UIImageView * _keqiangboyqingImgView;
    UILabel * _keqiangboyTitle;
    UILabel * _keqiangboysgqingTime;
    keqiangboyDetailBtn * _keqiangboyszanBtn;
    UILabel * _keqianboysContentlb;
    keqiangboyDetailBtn * _keqiangboylahieBtn;
    keqiangboyDetailBtn * _keqiangboysjubaoBtn;
    UIView * _keqiangboysbtomline ;
}
@end
@implementation keqiangboyComentListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView * keqiangboyqingImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(16), K(13.5), K(35), K(35))];
        keqiangboyqingImgView.layer.cornerRadius = K(17.5);
        keqiangboyqingImgView.layer.masksToBounds = YES;
        keqiangboyqingImgView.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangboyqingImgView];
        _keqiangboyqingImgView = keqiangboyqingImgView;
        
        
        UILabel * keqiangboyTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyqingImgView.frame)+K(5), K(13.5), K(200), K(20))];
        keqiangboyTitle.textColor = LGDBLackColor;
        keqiangboyTitle.font = KBlFont(15);
        keqiangboyTitle.text  =@"柳林东";
        [self.contentView addSubview:keqiangboyTitle];
        _keqiangboyTitle = keqiangboyTitle;
        
        
        UILabel * keqiangboysgqingTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyqingImgView.frame)+K(5), K(5)+CGRectGetMaxY(keqiangboyTitle.frame), K(200), K(14))];
        keqiangboysgqingTime.textColor = [UIColor colorWithHexString:@"#888888"];
        keqiangboysgqingTime.font = KSysFont(10);
        keqiangboysgqingTime.text  =@"2020-09-16 13:00:00";
        [self.contentView addSubview:keqiangboysgqingTime];
        _keqiangboysgqingTime = keqiangboysgqingTime;
        
        
        UILabel * keqianboysContentlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyqingImgView.frame)+K(5), CGRectGetMaxY(keqiangboysgqingTime.frame)+K(9.5), SCREEN_Width-CGRectGetMaxX(keqiangboyqingImgView.frame)-K(10), K(20))];
        keqianboysContentlb.numberOfLines = 0 ;
        keqianboysContentlb.font = KSysFont(15);
        keqianboysContentlb.text = @"火焰，是我追喜欢的玩具";
        keqianboysContentlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:keqianboysContentlb];
        _keqianboysContentlb = keqianboysContentlb;
        
        
        keqiangboyDetailBtn * keqiangboylahieBtn = [[keqiangboyDetailBtn alloc]initWithFrame:CGRectMake(SCREEN_Width-K(55), CGRectGetMaxY(keqianboysContentlb.frame)+K(15), K(40), K(15))];
        keqiangboylahieBtn.keqiangboyTopImgView.image = [UIImage imageNamed:@"ynty_laheisicon"];
        keqiangboylahieBtn.keqiangboybtomlb.text = @"拉黑";
        keqiangboylahieBtn.tag = 0;
        [keqiangboylahieBtn addTarget:self action:@selector(gaoxiangqingFindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        keqiangboylahieBtn.keqiangboybtomlb.textColor = [UIColor colorWithHexString:@"#FB5E02"];
        [self.contentView addSubview:keqiangboylahieBtn];
        _keqiangboylahieBtn = keqiangboylahieBtn;
        
        
        
        keqiangboyDetailBtn * keqiangboysjubaoBtn = [[keqiangboyDetailBtn alloc]initWithFrame:CGRectMake(CGRectGetMinX(keqiangboylahieBtn.frame)-K(85), CGRectGetMaxY(keqianboysContentlb.frame)+K(15), K(40), K(15))];
        keqiangboysjubaoBtn.keqiangboyTopImgView.image = [UIImage imageNamed:@"jubao"];
        keqiangboysjubaoBtn.keqiangboybtomlb.text = @"举报";
        keqiangboysjubaoBtn.tag = 1;
        [keqiangboysjubaoBtn addTarget:self action:@selector(gaoxiangqingFindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        keqiangboysjubaoBtn.keqiangboybtomlb.textColor = [UIColor colorWithHexString:@"#1343D0"];
        [self.contentView addSubview:keqiangboysjubaoBtn];
        _keqiangboysjubaoBtn = keqiangboysjubaoBtn;
        
        
        keqiangboyDetailBtn * keqiangboyszanBtn = [[keqiangboyDetailBtn alloc]initWithFrame:CGRectMake(CGRectGetMinX(keqiangboysjubaoBtn.frame)-K(85), CGRectGetMaxY(keqianboysContentlb.frame)+K(15), K(40), K(15))];
        keqiangboyszanBtn.keqiangboyTopImgView.image = [UIImage imageNamed:@"ynty_zan_nomal"];
        keqiangboyszanBtn.keqiangboybtomlb.text = @"ynty_zan_nomal";
        keqiangboyszanBtn.tag = 2;
        [keqiangboyszanBtn addTarget:self action:@selector(gaoxiangqingFindBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        keqiangboyszanBtn.keqiangboybtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:keqiangboyszanBtn];
        _keqiangboyszanBtn = keqiangboyszanBtn;
        
        
        UIView * keqiangboysbtomline = [[UIView alloc]initWithFrame:CGRectMake(K(15), CGRectGetMaxY(keqiangboyszanBtn.frame)+K(15), SCREEN_Width-K(30), K(1))];
        keqiangboysbtomline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangboysbtomline];
        _keqiangboysbtomline = keqiangboysbtomline;
        
    }
    return self;
}
-(void)setKeqiangModel:(keqiangboyDetailComenrModle *)keqiangModel{
    _keqiangModel = keqiangModel;
    [_keqiangboyqingImgView sd_setImageWithURL:[NSURL URLWithString:keqiangModel.header]];
    _keqiangboyTitle.text =  keqiangModel.name;
    _keqiangboysgqingTime.text = keqiangModel.time;
    NSString * ISLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if ([ISLogin isEqualToString:@"1"]) {
        _keqiangboyszanBtn.keqiangboyTopImgView.image = [UIImage imageNamed:keqiangModel.isZan ? @"yntyzan_sel" : @"ynty_zan_nomal"];
        
    }else{
        _keqiangboyszanBtn.keqiangboyTopImgView.image = [UIImage imageNamed:@"ynty_zan_nomal"];
        
    }
    _keqianboysContentlb.text =  keqiangModel.contetn;
    _keqianboysContentlb.size = [keqiangModel.contetn cxl_sizeWithMoreString:KSysFont(15) maxWidth:SCREEN_Width-CGRectGetMaxX(_keqiangboyqingImgView.frame)-K(10)].size;
    
    _keqiangboylahieBtn.y = CGRectGetMaxY(_keqianboysContentlb.frame)+K(15);
    
    _keqiangboysjubaoBtn.y = CGRectGetMaxY(_keqianboysContentlb.frame)+K(15);
    _keqiangboyszanBtn.y = CGRectGetMaxY(_keqianboysContentlb.frame)+K(15);
    _keqiangboysbtomline.y = CGRectGetMaxY(_keqiangboyszanBtn.frame)+K(15);
    
    keqiangModel.Cellheight = CGRectGetMaxY(_keqiangboysbtomline.frame);
    
    
}

-(void)gaoxiangqingFindBtnClick:(keqiangboyDetailBtn *)gaobtn{
    [self.delegate keqiangboyComentListTableViewCellDelegateWithCellIndex:self.tag keqiangboybtnActionIndex:gaobtn.tag];
}
@end
