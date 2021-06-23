#import "yntySportBaseTabbarViewController.h"
@interface yntySportBaseTabbarViewController ()
@property (nonatomic,strong) NSMutableArray *ynty_dataArr;
@property (nonatomic,strong) NSMutableArray *ynty_ClassdataArr;
@end
@implementation yntySportBaseTabbarViewController
-(NSMutableArray *)ynty_ClassdataArr{
    if(!_ynty_ClassdataArr){
        _ynty_ClassdataArr =[[NSMutableArray alloc]initWithCapacity:4];
    }
    return _ynty_ClassdataArr;
}
-(NSMutableArray *)ynty_dataArr{
    if (!_ynty_dataArr) {
        _ynty_dataArr =  [[NSMutableArray alloc]initWithObjects:
                         @"keqiangboyHomeViewController",@"keqiangboyhangViewController",@"keqiangmsgViewController",@"keqiangboyCenterViewController",nil];
    }
    return _ynty_dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * ynty_nomaImgArr = @[@"ynty_home_nomal",@"ynty_zone_nomal",@"ynty_history_nomal",@"ynty_center_nomal"];
    NSArray * ynty_seltecdimgArr = @[@"ynty_home_sel",@"ynty_zone_seltecd",@"ynty_history_seltecd",@"ynty_center_seltecd"];
    NSArray * ynty_titleArs=  @[@"首页",@"圈子",@"历史",@"个人中心"];
    for (int a= 0; a<self.ynty_dataArr.count; a++) {
        UIViewController * ynty_VCs = [(UIViewController *)[NSClassFromString(_ynty_dataArr[a]) alloc]init];
        UIImage *ynty_noaImg = [UIImage imageNamed:ynty_nomaImgArr[a]];
        UIImage *ynty_slteiMgs = [UIImage imageNamed:ynty_seltecdimgArr[a]];
        ynty_VCs.tabBarItem.image = [ynty_noaImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ynty_VCs.tabBarItem.selectedImage = [ynty_slteiMgs imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ynty_VCs.tabBarItem.title = ynty_titleArs[a];
        UINavigationController  *BaoBaoNav = [UINavigationController rootVC:ynty_VCs translationScale:NO];
        [self.ynty_ClassdataArr addObject:BaoBaoNav];
    }
    GKNavigationBarConfigure *ynty_defaichs = [GKNavigationBarConfigure sharedInstance];
    [ynty_defaichs setupDefaultConfigure];
    ynty_defaichs.backStyle = GKNavigationBarBackStyleBlack;
    ynty_defaichs.backgroundColor = [UIColor whiteColor];
    ynty_defaichs.titleColor = LGDBLackColor;
    ynty_defaichs.titleFont = KBlFont(19);
    ynty_defaichs.gk_navItemLeftSpace = K(15);
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#9F9FA0"], NSFontAttributeName:[UIFont systemFontOfSize:11.0f]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:LGDMianColor, NSFontAttributeName:[UIFont systemFontOfSize:11.0f]} forState:UIControlStateSelected];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(K(25), 0, 0, 0);
    self.viewControllers = _ynty_ClassdataArr;
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent =NO;
}

@end



















