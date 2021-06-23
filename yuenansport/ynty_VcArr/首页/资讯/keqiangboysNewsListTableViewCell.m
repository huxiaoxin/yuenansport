#import "keqiangboysNewsListTableViewCell.h"
@interface keqiangboysNewsListTableViewCell  ()
{
    UILabel * _keqianboysNewsTitle;
    UILabel * _keqianboysNewsBtomTitle;
    UIImageView * _keqingbiyaNewsImgView;
    UILabel * _keqianboysNewsTimelb;
}
@end
@implementation keqiangboysNewsListTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =   UITableViewCellSelectionStyleNone;
        
        UILabel * keqianboysNewsTitle =[[UILabel alloc]initWithFrame:CGRectMake(K(10), K(10), SCREEN_Width-K(110), K(15))];
        keqianboysNewsTitle.font = KBlFont(14);
        keqianboysNewsTitle.textColor  =LGDBLackColor;
        [self.contentView addSubview:keqianboysNewsTitle];
        _keqianboysNewsTitle = keqianboysNewsTitle;
        
        UILabel * keqianboysNewsBtomTitle =[[UILabel alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(keqianboysNewsTitle.frame), SCREEN_Width-K(110), K(45))];
        keqianboysNewsBtomTitle.font = KSysFont(12);
        keqianboysNewsBtomTitle.numberOfLines = 0;
        keqianboysNewsBtomTitle.textColor  =LGDGaryColor;
        [self.contentView addSubview:keqianboysNewsBtomTitle];
        _keqianboysNewsBtomTitle = keqianboysNewsBtomTitle;
        
        UIImageView * keqingbiyaNewsImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(95), K(10), K(80), K(80))];
        keqingbiyaNewsImgView.backgroundColor = LGDLightGaryColor;
        keqingbiyaNewsImgView.layer.cornerRadius = K(5);
        keqingbiyaNewsImgView.layer.masksToBounds  =YES;
        [self.contentView addSubview:keqingbiyaNewsImgView];
        _keqingbiyaNewsImgView = keqingbiyaNewsImgView;
        
        UILabel * keqianboysNewsTimelb  = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqianboysNewsBtomTitle.frame)+K(10), K(120), K(12))];
        keqianboysNewsTimelb.font = KSysFont(12);
        keqianboysNewsTimelb.textColor = LGDGaryColor;
        [self.contentView addSubview:keqianboysNewsTimelb];
        _keqianboysNewsTimelb =keqianboysNewsTimelb;
        
        
    }
    return self;
}
-(void)setKeqiangboiysNewsItem:(keqiangboysNewsListModel *)keqiangboiysNewsItem{
    _keqiangboiysNewsItem  = keqiangboiysNewsItem;
    _keqianboysNewsTitle.text = keqiangboiysNewsItem.title;
    _keqianboysNewsBtomTitle.text =  [self removeHtmlWithString:keqiangboiysNewsItem.content];
    if ([keqiangboiysNewsItem.pic isEqualToString:@"https://n.sinaimg.cn/default/2fb77759/20151125/320X320.png"]) {
        _keqingbiyaNewsImgView.hidden = YES;
    }else{
        _keqingbiyaNewsImgView.hidden = NO;
    }
    [_keqingbiyaNewsImgView sd_setImageWithURL:[NSURL URLWithString:keqiangboiysNewsItem.pic]];
    _keqianboysNewsTimelb.text = keqiangboiysNewsItem.time;
}

-(NSString *)removeHtmlWithString:(NSString *)htmlString{
    NSRegularExpression * regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n" options:0 error:nil];
    htmlString = [regularExpretion stringByReplacingMatchesInString:htmlString options:NSMatchingReportProgress range:NSMakeRange(0, htmlString.length) withTemplate:@""];
    return htmlString;
}
@end
