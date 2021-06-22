
#import "keqangboymsgTbaleviewCell.h"
@interface keqangboymsgTbaleviewCell ()
{
    UILabel * _keqiangboyTopTitle;
    UILabel * _keqiangboycenterTitle;
    UILabel * _keqiangboybtomTitle;
    UILabel * _keqiangboybtimelbe;
}
@end
@implementation keqangboymsgTbaleviewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView .backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        UIView * keqiangboybticonteview = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(10), SCREEN_Width-K(20), K(140))];
        keqiangboybticonteview.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:keqiangboybticonteview];
        UIImageView * keqiangboybticjianyiimg = [[UIImageView alloc]initWithFrame:CGRectMake(K(10), K(10), K(25), K(25))];
        keqiangboybticjianyiimg.image  =[UIImage imageNamed:@"xitongxiaoxi"];
        [keqiangboybticonteview addSubview:keqiangboybticjianyiimg];
        UILabel * keqiangboycenterTitle =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboybticjianyiimg.frame)+K(5), K(12), K(120), K(20))];
        keqiangboycenterTitle.textColor = [UIColor blackColor];
        keqiangboycenterTitle.font = [UIFont boldSystemFontOfSize:K(15)];
        keqiangboycenterTitle.text = @"系统消息";
        [keqiangboybticonteview addSubview:keqiangboycenterTitle];
        
        UILabel * keqiangboybtimelbe = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangboybticonteview.frame)-K(120), K(10), K(110), K(20))];
        keqiangboybtimelbe.textColor = [UIColor lightGrayColor];
        keqiangboybtimelbe.font  =[UIFont systemFontOfSize:K(13)];
        keqiangboybtimelbe.textAlignment = NSTextAlignmentRight;
        [keqiangboybticonteview addSubview:keqiangboybtimelbe];
        _keqiangboybtimelbe= keqiangboybtimelbe;
        
        UILabel * keqiangboyTopTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqiangboycenterTitle.frame)+K(10), CGRectGetWidth(keqiangboybticonteview.frame)-K(20), K(20))];
        keqiangboyTopTitle.textColor = [UIColor blackColor];
        keqiangboyTopTitle.font  =[UIFont systemFontOfSize:K(14)];
        [keqiangboybticonteview addSubview:keqiangboyTopTitle];
        
        _keqiangboyTopTitle= keqiangboyTopTitle;
        UILabel * keqiangboybtomTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqiangboyTopTitle.frame)+K(5), CGRectGetWidth(keqiangboybticonteview.frame)-K(20), K(20))];
        keqiangboybtomTitle.textColor = [UIColor lightGrayColor];
        keqiangboybtomTitle.font  =[UIFont systemFontOfSize:K(14)];
        [keqiangboybticonteview addSubview:keqiangboybtomTitle];
        _keqiangboybtomTitle=keqiangboybtomTitle;
        UIView * lienView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(keqiangboybtomTitle.frame)+K(15), CGRectGetWidth(keqiangboybticonteview.frame), K(1))];
        lienView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        [keqiangboybticonteview addSubview:lienView];
        UILabel * detail = [[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(lienView.frame)+K(7), CGRectGetWidth(keqiangboybticonteview.frame)-K(20), K(20))];
        keqiangboyTopTitle.textColor = [UIColor blackColor];
        detail.font  =[UIFont systemFontOfSize:K(14)];
        detail.text = @"查看详情";
        [keqiangboybticonteview addSubview:detail];
        UIImageView * rightimg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangboybticonteview.frame)-K(25), CGRectGetMaxY(lienView.frame)+K(8), K(16), K(16))];
        rightimg.image = [UIImage imageNamed:@"left"];
        [keqiangboybticonteview addSubview:rightimg];
    }
    return self;
}
-(void)setKeqiangboyDic:(NSMutableDictionary *)keqiangboyDic{
    _keqiangboyDic  =keqiangboyDic;
    _keqiangboyTopTitle.text = keqiangboyDic[@"title"];
    _keqiangboybtomTitle.text = keqiangboyDic[@"cotent"];
    _keqiangboybtimelbe.text = keqiangboyDic[@"time"];
}
@end
