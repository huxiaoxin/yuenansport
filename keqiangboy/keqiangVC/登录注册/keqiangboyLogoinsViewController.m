#import "keqiangboyLogoinsViewController.h"
#import "keqiangbouRegisterViewController.h"
#import "keqiangboyaboutusViewController.h"
#import "keqiangFindpasswordViewController.h"
@interface keqiangboyLogoinsViewController ()
{
    UITextField * _keqiangboysLoginTextField;
    UITextField * _keqiangboysLoginPassWordTextField;
}
@end

@implementation keqiangboyLogoinsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    UIView * keqiangboysDissmisViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    UIButton * keqiangboysdissClosebtn = [[UIButton alloc]initWithFrame:CGRectMake(K(30), K(10), K(13), K(13))];
    [keqiangboysdissClosebtn setBackgroundImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
    [keqiangboysdissClosebtn addTarget:self action:@selector(keqiangboysdissClosebtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysDissmisViews addSubview:keqiangboysdissClosebtn];
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangboysDissmisViews];
    
    UIView * keqiangboysLoginRegisterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    
    UIButton * keqiangbyclogontexregiebtns = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(5), K(40), K(20))];
    [keqiangbyclogontexregiebtns setTitle:@"注册" forState:UIControlStateNormal];
    keqiangbyclogontexregiebtns.titleLabel.font = KSysFont(15);
    [keqiangbyclogontexregiebtns setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keqiangbyclogontexregiebtns addTarget:self action:@selector(keqiangbycLogNbtnctoins) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysLoginRegisterView addSubview:keqiangbyclogontexregiebtns];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangboysLoginRegisterView];
    
    
    UIImageView * keqiangboyslogoImgViews = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    keqiangboyslogoImgViews.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:keqiangboyslogoImgViews];
    
    UILabel * keqiangboysLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboyslogoImgViews.frame)+K(10), CGRectGetMidY(keqiangboyslogoImgViews.frame)-K(12.5), K(350), K(25))];
    keqiangboysLogoTitle.font = KBlFont(25);
    keqiangboysLogoTitle.textColor = LGDBLackColor;
    keqiangboysLogoTitle.text = @"欢迎来到A8体育";
    [self.view addSubview:keqiangboysLogoTitle];
    
    
    UIView * keqiangbyclogontextFieldViews =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangboysLogoTitle.frame)+K(40), SCREEN_Width-K(50), K(100))];
    keqiangbyclogontextFieldViews.layer.borderColor = LGDGaryColor.CGColor;
    keqiangbyclogontextFieldViews.layer.cornerRadius = K(8);
    keqiangbyclogontextFieldViews.layer.masksToBounds = YES;
    keqiangbyclogontextFieldViews.layer.borderWidth = K(1);
    [self.view addSubview:keqiangbyclogontextFieldViews];
    
    
    UIView * SanXiaTextLines = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(keqiangbyclogontextFieldViews.frame)-K(20), K(1))];
    SanXiaTextLines.backgroundColor =  LGDLightGaryColor;
    [keqiangbyclogontextFieldViews addSubview:SanXiaTextLines];
    
    
    UITextField * keqiangboysLoginTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(keqiangbyclogontextFieldViews.frame)-K(10), K(40))];
    keqiangboysLoginTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysLoginTextField.textColor = LGDBLackColor;
    keqiangboysLoginTextField.font = KSysFont(15);
    keqiangboysLoginTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbyclogontextFieldViews addSubview:keqiangboysLoginTextField];
    _keqiangboysLoginTextField = keqiangboysLoginTextField;
    
    
    UITextField * keqiangboysLoginPassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(SanXiaTextLines.frame), CGRectGetWidth(keqiangbyclogontextFieldViews.frame)-K(10), K(40))];
    keqiangboysLoginPassWordTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysLoginPassWordTextField.textColor = LGDBLackColor;
    keqiangboysLoginPassWordTextField.font = KSysFont(15);
    keqiangboysLoginPassWordTextField.secureTextEntry = YES;
    keqiangboysLoginPassWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbyclogontextFieldViews addSubview:keqiangboysLoginPassWordTextField];
    _keqiangboysLoginPassWordTextField = keqiangboysLoginPassWordTextField;
    
    
    UIButton * keqiangboysLogobtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangbyclogontextFieldViews.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [keqiangboysLogobtn setBackgroundColor:LGDMianColor];
    keqiangboysLogobtn.layer.cornerRadius = K(5);
    keqiangboysLogobtn.layer.masksToBounds = YES;
    keqiangboysLogobtn.titleLabel.font = KSysFont(15);
    [keqiangboysLogobtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keqiangboysLogobtn addTarget:self action:@selector(keqiangboysLogobtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysLogobtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:keqiangboysLogobtn];
    
    
    CGSize keqiangbychangepwdSzies =[@"修改账户密码" cxl_sizeWithString:KSysFont(14)];
    UIButton * keqiangbychangpwsBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangboysLogobtn.frame)+K(15), keqiangbychangepwdSzies.width, K(15))];
    [keqiangbychangpwsBtn setTitle:@"修改账户密码" forState:UIControlStateNormal];
    keqiangbychangpwsBtn.titleLabel.font = KSysFont(14);
    [keqiangbychangpwsBtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [keqiangbychangpwsBtn addTarget:self action:@selector(keqiangbychangpwsBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:keqiangbychangpwsBtn];
    
    
    CGSize keqiangbychprotolSize = [@"登录即表示同意《使用协议》" cxl_sizeWithString:KSysFont(14)];
    UILabel * keqiangbychprotolb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-keqiangbychprotolSize.width-K(25), CGRectGetMaxY(keqiangboysLogobtn.frame)+K(15), keqiangbychprotolSize.width, K(15))];
    keqiangbychprotolb.font = KSysFont(14);
    keqiangbychprotolb.userInteractionEnabled = YES;
    [self.view addSubview:keqiangbychprotolb];
    
    NSMutableAttributedString * keqiangbychpatebueye = [[NSMutableAttributedString alloc]initWithString:@"登录即表示同意《使用协议》"];
    [keqiangbychpatebueye addAttribute:NSForegroundColorAttributeName value:LGDLightBLackColor range:NSMakeRange(0, 7)];
    [keqiangbychpatebueye addAttribute:NSForegroundColorAttributeName value:LGDMianColor range:NSMakeRange(7, 6)];

    keqiangbychprotolb.attributedText = keqiangbychpatebueye;
    UITapGestureRecognizer * keqiangbychpatebueyeTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keqiangbychpatebueyeTapClicks)];
    [keqiangbychprotolb addGestureRecognizer:keqiangbychpatebueyeTap];
    
    
  
    
    
}
#pragma mark -- 协议
-(void)keqiangbychpatebueyeTapClicks{
    keqiangboyaboutusViewController * keqiangbycVcs = [[keqiangboyaboutusViewController alloc]init];
    keqiangbycVcs.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqiangbycVcs animated:YES];
}
#pragma mark--修改密码
-(void)keqiangbychangpwsBtnClick{
    keqiangFindpasswordViewController * keqiangbycchanegVcs = [[keqiangFindpasswordViewController alloc]init];
    keqiangbycchanegVcs.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqiangbycchanegVcs animated:YES];
}
#pragma mark--登录
-(void)keqiangboysLogobtnClick{
    if (_keqiangboysLoginTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_keqiangboysLoginTextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_keqiangboysLoginPassWordTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入密码"];
        return;
    }
    [LCProgressHUD showLoading:@"登录中...."];
    MJWeakSelf;
    NSMutableDictionary * keqiangbycchanparmtrs = [[NSMutableDictionary alloc]initWithDictionary:@{@"userName":_keqiangboysLoginTextField.text,@"passWords":_keqiangboysLoginPassWordTextField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/login" Parameters:keqiangbycchanparmtrs Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"keqiangboyLoginsSucced" object:nil];
            [LCProgressHUD showSuccess:@"登录成功"];
            NSString * userId = [NSString stringWithFormat:@"%@",[[object objectForKey:@"data"] objectForKey:@"id"]];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"USERID"];
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"ISLogin"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }else{
            [LCProgressHUD showInfoMsg:@"账号或密码错误"];
        }
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:@"登录失败"];
    }];

}
#pragma mark--注册
-(void)keqiangbycLogNbtnctoins{
    
    keqiangbouRegisterViewController * keqiangbyccharegVcs = [[keqiangbouRegisterViewController alloc]init];
    keqiangbyccharegVcs.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:keqiangbyccharegVcs animated:YES];
}
-(void)keqiangboysdissClosebtnClick{
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


