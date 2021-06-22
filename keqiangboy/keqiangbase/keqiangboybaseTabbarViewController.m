#import "keqiangboybaseTabbarViewController.h"
@interface keqiangboybaseTabbarViewController ()
@property (nonatomic,strong) NSMutableArray *MaryDataArr;
@property (nonatomic,strong) NSMutableArray *MaryClassDataArr;
@end
@implementation keqiangboybaseTabbarViewController
-(NSMutableArray *)MaryClassDataArr{
    if(!_MaryClassDataArr){
        _MaryClassDataArr =[[NSMutableArray alloc]initWithCapacity:4];
    }
    return _MaryClassDataArr;
}
-(NSMutableArray *)MaryDataArr{
    if (!_MaryDataArr) {
        _MaryDataArr =  [[NSMutableArray alloc]initWithObjects:
                         @"keqiangboyHomeViewController",@"keqiangboyhangViewController",@"keqiangmsgViewController",@"keqiangboyCenterViewController",nil];
    }
    return _MaryDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * MaryNomalImg = @[@"keqiangshouyeNomal",@"keqiangboyquanziNomal",@"keqiangboylishiNomal",@"keqiangbonomakcente"];
    NSArray * MarySeltecdlImg = @[@"keqiangshouyeSeltecd",@"keqiangboyquanziselted",@"keqiangboylishiSelted",@"keqanobosltecdcente"];
    NSArray * MaryTitleArr=  @[@"首页",@"圈子",@"历史",@"个人中心"];
    for (int a= 0; a<self.MaryDataArr.count; a++) {
        UIViewController * MaryControllerVc = [(UIViewController *)[NSClassFromString(_MaryDataArr[a]) alloc]init];
        UIImage *MaryNomal = [UIImage imageNamed:MaryNomalImg[a]];
        UIImage *MaryNameSeltecd = [UIImage imageNamed:MarySeltecdlImg[a]];
        MaryControllerVc.tabBarItem.image = [MaryNomal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        MaryControllerVc.tabBarItem.selectedImage = [MaryNameSeltecd imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        MaryControllerVc.tabBarItem.title = MaryTitleArr[a];
        UINavigationController  *BaoBaoNav = [UINavigationController rootVC:MaryControllerVc translationScale:NO];
        [self.MaryClassDataArr addObject:BaoBaoNav];
    }
    GKNavigationBarConfigure *MaryConfigers = [GKNavigationBarConfigure sharedInstance];
    [MaryConfigers setupDefaultConfigure];
    MaryConfigers.backStyle = GKNavigationBarBackStyleBlack;
    MaryConfigers.backgroundColor = [UIColor whiteColor];
    MaryConfigers.titleColor = LGDBLackColor;
    MaryConfigers.titleFont = KBlFont(19);
    MaryConfigers.gk_navItemLeftSpace = K(15);
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#9F9FA0"], NSFontAttributeName:[UIFont systemFontOfSize:11.0f]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:LGDMianColor, NSFontAttributeName:[UIFont systemFontOfSize:11.0f]} forState:UIControlStateSelected];
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(K(25), 0, 0, 0);
    self.viewControllers = _MaryClassDataArr;
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.translucent =NO;
}

@end



















