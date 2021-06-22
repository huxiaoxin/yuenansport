#import "keqiangboymsgDetailController.h"
@interface keqiangboymsgDetailController ()
@end
@implementation keqiangboymsgDetailController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle =_keqiangboydDics[@"title"];
    UILabel *keqiangboymsgTtle = [[UILabel alloc]initWithFrame:CGRectMake(0, K(10)+NaviH, SCREEN_Width, K(20))];
    keqiangboymsgTtle.textColor = [UIColor blackColor];
    keqiangboymsgTtle.textAlignment =  NSTextAlignmentCenter;
    keqiangboymsgTtle.font =[UIFont boldSystemFontOfSize:K(15)];
    keqiangboymsgTtle.text = _keqiangboydDics[@"title"];
    [self.view addSubview:keqiangboymsgTtle];
    CGRect keqiangboymsgTtleRect = [_keqiangboydDics[@"cotent"] cxl_sizeWithMoreString:[UIFont systemFontOfSize:K(14)] maxWidth:SCREEN_Width-K(20)];
    UILabel *keqiangboyocnlb = [[UILabel alloc]initWithFrame:CGRectMake(K(10),CGRectGetMaxY(keqiangboymsgTtle.frame)+K(10), keqiangboymsgTtleRect.size.width, keqiangboymsgTtleRect.size.height)];
    keqiangboyocnlb.textColor = [UIColor lightGrayColor];
    keqiangboyocnlb.textAlignment =  NSTextAlignmentCenter;
    keqiangboyocnlb.font =[UIFont systemFontOfSize:K(14)];
    keqiangboyocnlb.numberOfLines = 0;
    keqiangboyocnlb.text = _keqiangboydDics[@"cotent"];
    [self.view addSubview:keqiangboyocnlb];
    UIImageView * keqiangboimgView =[[UIImageView alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(keqiangboyocnlb.frame)+K(10), SCREEN_Width-K(20), K(180))];
    keqiangboimgView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:keqiangboimgView];
    UILabel *keqiangbobtomlb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(80), CGRectGetMaxY(keqiangboimgView.frame)+K(10), K(70), K(20))];
    keqiangbobtomlb.textColor = [UIColor lightGrayColor];
    keqiangbobtomlb.textAlignment =  NSTextAlignmentRight;
    keqiangbobtomlb.font =[UIFont boldSystemFontOfSize:K(15)];
    keqiangbobtomlb.text = @"A8体育";
    [self.view addSubview:keqiangbobtomlb];
}
@end

