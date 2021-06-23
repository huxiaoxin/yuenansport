#import "yntySportLogoinsViewController.h"
#import "yntySprotRegisterViewController.h"
#import "keqiangboyaboutusViewController.h"
#import "tnytSportFindpasswordViewController.h"
@interface yntySportLogoinsViewController ()
{
    UITextField * _yntysportLoginTextField;
    UITextField * _yntySporytLoginPassWordTextField;
}
@end

@implementation yntySportLogoinsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    UIView * yntycloisView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    UIButton * yntyCoubvtns = [[UIButton alloc]initWithFrame:CGRectMake(K(30), K(10), K(13), K(13))];
    [yntyCoubvtns setBackgroundImage:[UIImage imageNamed:@"ynty_guanbi"] forState:UIControlStateNormal];
    [yntyCoubvtns addTarget:self action:@selector(yntyCoubvtnsClick) forControlEvents:UIControlEventTouchUpInside];
    [yntycloisView addSubview:yntyCoubvtns];
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:yntycloisView];
    
    UIView * yntyzhuceViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    
    UIButton * yntyzhuczhuVtbs = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(5), K(40), K(20))];
    [yntyzhuczhuVtbs setTitle:@"注册" forState:UIControlStateNormal];
    yntyzhuczhuVtbs.titleLabel.font = KSysFont(15);
    [yntyzhuczhuVtbs setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [yntyzhuczhuVtbs addTarget:self action:@selector(yntyzhuczhuVtbsActions) forControlEvents:UIControlEventTouchUpInside];
    [yntyzhuceViews addSubview:yntyzhuczhuVtbs];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:yntyzhuceViews];
    
    
    UIImageView * keqiangboyslogoImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    keqiangboyslogoImgViews.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:keqiangboyslogoImgViews];
    
    UILabel * ytgyabsizdafetiekdas = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyslogoImgViews.frame)+K(10), CGRectGetMidY(keqiangboyslogoImgViews.frame)-K(12.5), K(350), K(25))];
    ytgyabsizdafetiekdas.font = KBlFont(25);
    ytgyabsizdafetiekdas.textColor = LGDBLackColor;
    ytgyabsizdafetiekdas.text = @"欢迎来到i体育";
    [self.view addSubview:ytgyabsizdafetiekdas];
    
    
    UIView * ytgyabsizdafesfvews =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(ytgyabsizdafetiekdas.frame)+K(40), SCREEN_Width-K(50), K(100))];
    ytgyabsizdafesfvews.layer.borderColor = LGDGaryColor.CGColor;
    ytgyabsizdafesfvews.layer.cornerRadius = K(8);
    ytgyabsizdafesfvews.layer.masksToBounds = YES;
    ytgyabsizdafesfvews.layer.borderWidth = K(1);
    [self.view addSubview:ytgyabsizdafesfvews];
    
    
    UIView * SanXiaTextLines = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(ytgyabsizdafesfvews.frame)-K(20), K(1))];
    SanXiaTextLines.backgroundColor =  LGDLightGaryColor;
    [ytgyabsizdafesfvews addSubview:SanXiaTextLines];
    
    
    UITextField * yntysportLoginTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(ytgyabsizdafesfvews.frame)-K(10), K(40))];
    yntysportLoginTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntysportLoginTextField.textColor = LGDBLackColor;
    yntysportLoginTextField.font = KSysFont(15);
    yntysportLoginTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [ytgyabsizdafesfvews addSubview:yntysportLoginTextField];
    _yntysportLoginTextField = yntysportLoginTextField;
    
    
    UITextField * yntySporytLoginPassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(SanXiaTextLines.frame), CGRectGetWidth(ytgyabsizdafesfvews.frame)-K(10), K(40))];
    yntySporytLoginPassWordTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntySporytLoginPassWordTextField.textColor = LGDBLackColor;
    yntySporytLoginPassWordTextField.font = KSysFont(15);
    yntySporytLoginPassWordTextField.secureTextEntry = YES;
    yntySporytLoginPassWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [ytgyabsizdafesfvews addSubview:yntySporytLoginPassWordTextField];
    _yntySporytLoginPassWordTextField = yntySporytLoginPassWordTextField;
    
    
    UIButton * ytgyabsizkoghsdug = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(ytgyabsizdafesfvews.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [ytgyabsizkoghsdug setBackgroundColor:LGDMianColor];
    ytgyabsizkoghsdug.layer.cornerRadius = K(5);
    ytgyabsizkoghsdug.layer.masksToBounds = YES;
    ytgyabsizkoghsdug.titleLabel.font = KSysFont(15);
    [ytgyabsizkoghsdug setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ytgyabsizkoghsdug addTarget:self action:@selector(ytgyabsizkoghsdugClick) forControlEvents:UIControlEventTouchUpInside];
    [ytgyabsizkoghsdug setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:ytgyabsizkoghsdug];
    
    
    CGSize ytgyabsizgoxiydahu =[@"修改账户密码" cxl_sizeWithString:KSysFont(14)];
    UIButton * ytgyabsizgdadewr = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(ytgyabsizkoghsdug.frame)+K(15), ytgyabsizgoxiydahu.width, K(15))];
    [ytgyabsizgdadewr setTitle:@"修改账户密码" forState:UIControlStateNormal];
    ytgyabsizgdadewr.titleLabel.font = KSysFont(14);
    [ytgyabsizgdadewr setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [ytgyabsizgdadewr addTarget:self action:@selector(ytgyabsizgdadewrClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ytgyabsizgdadewr];
    
    
    CGSize ytgyabsizgfs = [@"登录即表示同意《使用协议》" cxl_sizeWithString:KSysFont(14)];
    UILabel * ytgyabsizgofhbilb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-ytgyabsizgfs.width-K(25), CGRectGetMaxY(ytgyabsizkoghsdug.frame)+K(15), ytgyabsizgfs.width, K(15))];
    ytgyabsizgofhbilb.font = KSysFont(14);
    ytgyabsizgofhbilb.userInteractionEnabled = YES;
    [self.view addSubview:ytgyabsizgofhbilb];
    
    NSMutableAttributedString * ytgyabutVcs = [[NSMutableAttributedString alloc]initWithString:@"登录即表示同意《使用协议》"];
    [ytgyabutVcs addAttribute:NSForegroundColorAttributeName value:LGDLightBLackColor range:NSMakeRange(0, 7)];
    [ytgyabutVcs addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(7, 6)];

    ytgyabsizgofhbilb.attributedText = ytgyabutVcs;
    UITapGestureRecognizer * ytgyabutVcsTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ytgyabutVcsTapClicks)];
    [ytgyabsizgofhbilb addGestureRecognizer:ytgyabutVcsTap];
    
    
  
    
    
}
#pragma mark -- 协议
-(void)ytgyabutVcsTapClicks{
    keqiangboyaboutusViewController * yntyzhxixieyivc = [[keqiangboyaboutusViewController alloc]init];
    yntyzhxixieyivc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:yntyzhxixieyivc animated:YES];
}
#pragma mark--修改密码
-(void)ytgyabsizgdadewrClick{
    tnytSportFindpasswordViewController * yntyzhxiuVcs = [[tnytSportFindpasswordViewController alloc]init];
    yntyzhxiuVcs.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:yntyzhxiuVcs animated:YES];
}
#pragma mark--登录
-(void)ytgyabsizkoghsdugClick{
    if (_yntysportLoginTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_yntysportLoginTextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_yntySporytLoginPassWordTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入密码"];
        return;
    }
    [LCProgressHUD showLoading:@"登录中...."];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self->_yntysportLoginTextField.text isEqualToString:@"15068761251"] && [_yntySporytLoginPassWordTextField.text isEqualToString:@"test001"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"keqiangboyLoginsSucced" object:nil];
            [LCProgressHUD showSuccess:@"登录成功"];
            [[NSUserDefaults standardUserDefaults] setObject:@"1321" forKey:@"USERID"];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"ISLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }else{
            [LCProgressHUD showInfoMsg:@"密码错误"];
        }
        
    });
}
#pragma mark--注册
-(void)yntyzhuczhuVtbsActions{
    
    yntySprotRegisterViewController * yntyzhuczVcs = [[yntySprotRegisterViewController alloc]init];
    yntyzhuczVcs.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:yntyzhuczVcs animated:YES];
}
-(void)yntyCoubvtnsClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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


