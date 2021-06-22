
#import "keqiangFindpasswordViewController.h"

@interface keqiangFindpasswordViewController ()
{
    UITextField * _keqiangboysFindPasswordtextField;
    UITextField * _keqiangboysPasswordCodeTextField;
    UIButton * _keqiangboysFindPasswordCodeBtn;
    UITextField * _keqiangboysPasswordPassworTextField;
    UITextField * _keqiangbiysFindPasswordPasswordAgain;
    NSTimer *    _KeqiangboysFindPasswordPassworTimers;
    NSInteger _keqiangbyisFindPasswordPassworNums;
}
@end

@implementation keqiangFindpasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"找回密码";
    _keqiangbyisFindPasswordPassworNums = 60;
    UIImageView * keqiangboysFindPasswordImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    keqiangboysFindPasswordImgView.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:keqiangboysFindPasswordImgView];
    
    UILabel * keqiangbiysFindPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangboysFindPasswordImgView.frame)+K(10), CGRectGetMidY(keqiangboysFindPasswordImgView.frame)-K(12.5), K(350), K(25))];
    keqiangbiysFindPasswordTitle.font = KBlFont(25);
    keqiangbiysFindPasswordTitle.textColor = LGDBLackColor;
    keqiangbiysFindPasswordTitle.text = @"欢迎来到A8体育";
    [self.view addSubview:keqiangbiysFindPasswordTitle];
    
    
    UIView * keqiangbiysFindPasswordFieldView =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangbiysFindPasswordTitle.frame)+K(40), SCREEN_Width-K(50), K(200))];
    keqiangbiysFindPasswordFieldView.layer.borderColor = LGDGaryColor.CGColor;
    keqiangbiysFindPasswordFieldView.layer.cornerRadius = K(8);
    keqiangbiysFindPasswordFieldView.layer.masksToBounds = YES;
    keqiangbiysFindPasswordFieldView.layer.borderWidth = K(1);
    [self.view addSubview:keqiangbiysFindPasswordFieldView];
    
    UIView * SanXiaFindPasswordlines = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(20), K(1))];
    SanXiaFindPasswordlines.backgroundColor =  LGDLightGaryColor;
    [keqiangbiysFindPasswordFieldView addSubview:SanXiaFindPasswordlines];
    
    
    UITextField * keqiangboysFindPasswordtextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(10), K(40))];
    keqiangboysFindPasswordtextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysFindPasswordtextField.textColor = LGDBLackColor;
    keqiangboysFindPasswordtextField.font = KSysFont(15);
    keqiangboysFindPasswordtextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbiysFindPasswordFieldView addSubview:keqiangboysFindPasswordtextField];
    _keqiangboysFindPasswordtextField = keqiangboysFindPasswordtextField;
    
    
    UIView * keoqnseolviewsindPasswordlinesSecond = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(SanXiaFindPasswordlines.frame), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(20), K(1))];
    keoqnseolviewsindPasswordlinesSecond.backgroundColor =  LGDLightGaryColor;
    [keqiangbiysFindPasswordFieldView addSubview:keoqnseolviewsindPasswordlinesSecond];
    
    
    UITextField * keqiangboysPasswordCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10)+CGRectGetMaxY(SanXiaFindPasswordlines.frame), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(10), K(40))];
    keqiangboysPasswordCodeTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysPasswordCodeTextField.textColor = LGDBLackColor;
    keqiangboysPasswordCodeTextField.font = KSysFont(15);
    keqiangboysPasswordCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbiysFindPasswordFieldView addSubview:keqiangboysPasswordCodeTextField];
    _keqiangboysPasswordCodeTextField = keqiangboysPasswordCodeTextField;
    
    
    UIButton * keqiangboysFindPasswordCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(80), CGRectGetMaxY(SanXiaFindPasswordlines.frame)+K(20), K(70), K(20))];
    [keqiangboysFindPasswordCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    keqiangboysFindPasswordCodeBtn.titleLabel.font = KSysFont(12);
    [keqiangboysFindPasswordCodeBtn addTarget:self action:@selector(keqiangboysFindPasswordCodeBtnClck) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysFindPasswordCodeBtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [keqiangbiysFindPasswordFieldView addSubview:keqiangboysFindPasswordCodeBtn];
    _keqiangboysFindPasswordCodeBtn = keqiangboysFindPasswordCodeBtn;
    
    
    UITextField * keqiangbiysFindPasswordPasswordAgain = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(keoqnseolviewsindPasswordlinesSecond.frame), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(10), K(40))];
    keqiangbiysFindPasswordPasswordAgain.clearButtonMode = UITextFieldViewModeAlways;
    keqiangbiysFindPasswordPasswordAgain.textColor = LGDBLackColor;
    keqiangbiysFindPasswordPasswordAgain.font = KSysFont(15);
    keqiangbiysFindPasswordPasswordAgain.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请重新设置密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbiysFindPasswordFieldView addSubview:keqiangbiysFindPasswordPasswordAgain];
    _keqiangbiysFindPasswordPasswordAgain = keqiangbiysFindPasswordPasswordAgain;
    
    
    UIView * keiqanglobsThreeline = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(keoqnseolviewsindPasswordlinesSecond.frame), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(20), K(1))];
    keiqanglobsThreeline.backgroundColor =  LGDLightGaryColor;
    [keqiangbiysFindPasswordFieldView addSubview:keiqanglobsThreeline];
    
    
    UITextField * keqiangboysPasswordPassworTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(keiqanglobsThreeline.frame), CGRectGetWidth(keqiangbiysFindPasswordFieldView.frame)-K(10), K(40))];
    keqiangboysPasswordPassworTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysPasswordPassworTextField.textColor = LGDBLackColor;
    keqiangboysPasswordPassworTextField.font = KSysFont(15);
    keqiangboysPasswordPassworTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请再次输入密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangbiysFindPasswordFieldView addSubview:keqiangboysPasswordPassworTextField];
    _keqiangboysPasswordPassworTextField = keqiangboysPasswordPassworTextField;
    
    
    UIButton * keqiangboysFindPasswordlinesNextBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangbiysFindPasswordFieldView.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [keqiangboysFindPasswordlinesNextBtn setBackgroundColor:LGDMianColor];
    keqiangboysFindPasswordlinesNextBtn.layer.cornerRadius = K(5);
    keqiangboysFindPasswordlinesNextBtn.layer.masksToBounds = YES;
    keqiangboysFindPasswordlinesNextBtn.titleLabel.font = KSysFont(15);
    [keqiangboysFindPasswordlinesNextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keqiangboysFindPasswordlinesNextBtn addTarget:self action:@selector(keqiangboysFindPasswordlinesNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysFindPasswordlinesNextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:keqiangboysFindPasswordlinesNextBtn];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)keqiangboysFindPasswordlinesNextBtnClick{
    if (_keqiangboysFindPasswordtextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_keqiangboysFindPasswordtextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_keqiangboysPasswordCodeTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入验证码"];
        return;
    }
    if (_keqiangboysPasswordCodeTextField.text.length != 4) {
        [LCProgressHUD showInfoMsg:@"请输入正确的验证码"];
        return;
    }
    if (_keqiangbiysFindPasswordPasswordAgain.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请设置密码"];
        return;
    }
    if (![_keqiangbiysFindPasswordPasswordAgain.text isEqualToString:_keqiangboysPasswordPassworTextField.text]) {
        [LCProgressHUD showInfoMsg:@"密码不一致"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showInfoMsg:@"稍后重试"];
    });
}
-(void)keqiangboysFindPasswordCodeBtnClck{
    if (_keqiangboysFindPasswordtextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_keqiangboysFindPasswordtextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    NSMutableDictionary * keqiangoysFindPasswordlinesParmters = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_keqiangboysFindPasswordtextField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/resetPdCode" Parameters:keqiangoysFindPasswordlinesParmters Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [LCProgressHUD showSuccess:@"发送成功"];
            self->_KeqiangboysFindPasswordPassworTimers = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(keqiangoysFindPasswordlineAction) userInfo:nil repeats:YES];
            [self->_KeqiangboysFindPasswordPassworTimers fire];
        }else{
            [LCProgressHUD showInfoMsg:@"发送失败"];
        }
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
    }];
    
    
}
-(void)keqiangoysFindPasswordlineAction{
    _keqiangbyisFindPasswordPassworNums--;
    _keqiangboysFindPasswordCodeBtn.enabled = NO;
    [_keqiangboysFindPasswordCodeBtn setTitle:[NSString stringWithFormat:@"%lds后可重发",(long)_keqiangbyisFindPasswordPassworNums] forState:UIControlStateNormal];
    if (_keqiangbyisFindPasswordPassworNums == 0) {
        [_KeqiangboysFindPasswordPassworTimers invalidate];
        [_keqiangboysFindPasswordCodeBtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        _keqiangboysFindPasswordCodeBtn.enabled = YES;
    }
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



