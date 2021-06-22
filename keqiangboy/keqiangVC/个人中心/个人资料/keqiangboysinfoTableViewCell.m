
#import "keqiangboysinfoTableViewCell.h"
@interface keqiangboysinfoTableViewCell ()
{
 
}
@end
@implementation keqiangboysinfoTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        UILabel * keqiangbotBotmlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(15), K(200), K(20))];
        keqiangbotBotmlb.font =  KSysFont(14);
        keqiangbotBotmlb.textColor = LGDLightBLackColor;
        [self.contentView addSubview:keqiangbotBotmlb];
     _keqiangbotBotmlb= keqiangbotBotmlb;
        
        UIView * keqiangbolines = [[UIView alloc]initWithFrame:CGRectMake(0, K(49), SCREEN_Width, K(1))];
        keqiangbolines.backgroundColor = LGDLightGaryColor;
        [self.contentView addSubview:keqiangbolines];
        
        
        UIImageView * keqiangosaRightImg = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(25), K(14.5), K(15), K(15))];
        keqiangosaRightImg.image = [UIImage imageNamed:@"left"];
        [self.contentView addSubview:keqiangosaRightImg];
        
        UILabel * keqiangboysToplbs = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(200), K(14.5), K(170), K(15))];
        keqiangboysToplbs.textAlignment = NSTextAlignmentRight;
        keqiangboysToplbs.textColor = LGDGaryColor;
        keqiangboysToplbs.font = KSysFont(12);
        [self.contentView addSubview:keqiangboysToplbs];
        _keqiangboysToplbs = keqiangboysToplbs;
        
        
        
    }
    return self;
}
@end
