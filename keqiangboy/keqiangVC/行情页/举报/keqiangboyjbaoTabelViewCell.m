
#import "keqiangboyjbaoTabelViewCell.h"
@interface keqiangboyjbaoTabelViewCell ()
{
    UILabel * _keqiangboyTitlws;
    UIImageView * _keqiangbiythubImgViews;
}
@end
@implementation keqiangboyjbaoTabelViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        
        UIView * gaoxiangqingline = [[UIView alloc]initWithFrame:CGRectMake(K(19), K(49), SCREEN_Width-K(38), K(1))];
        gaoxiangqingline.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:gaoxiangqingline];
        
        UILabel * keqiangboyTitlws = [[UILabel alloc]initWithFrame:CGRectMake(K(19), K(15), K(200), K(20))];
        keqiangboyTitlws.font = KSysFont(14);
        keqiangboyTitlws.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:keqiangboyTitlws];
        _keqiangboyTitlws = keqiangboyTitlws;
        
        UIImageView * keqiangbiythubImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(34), K(17.5), K(15), K(15))];
        
        [self.contentView addSubview:keqiangbiythubImgViews];
        _keqiangbiythubImgViews =keqiangbiythubImgViews;
        
        
    }
    return self;
}
-(void)setKeqiangModel:(keqiangboyjubaoModle *)keqiangModel{
    _keqiangModel = keqiangModel;
    _keqiangboyTitlws.text =  keqiangModel.keqiangboyStr;
    
    _keqiangbiythubImgViews.image =[UIImage imageNamed:keqiangModel.keqiangboyState ? @"对好" : @"不对好"];
}
@end
