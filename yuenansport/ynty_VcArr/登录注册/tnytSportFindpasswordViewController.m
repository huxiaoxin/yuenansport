
#import "tnytSportFindpasswordViewController.h"

@interface tnytSportFindpasswordViewController ()
{
    UITextField * _yntySporyeFindPasswordtextField;
    UITextField * _yntySportPasswordCodeTextField;
    UIButton * _yntysporeFindPasswordCodeBtn;
    UITextField * _yntysporyesPasswordPassworTextField;
    UITextField * _yntyuspoewsFindPasswordPasswordAgain;
    NSTimer *    _yntyspjrieaFindPasswordPassworTimers;
    NSInteger _yntydfuiwerwFindPasswordPassworNums;
}
@end

@implementation tnytSportFindpasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"找回密码";
    _yntydfuiwerwFindPasswordPassworNums = 60;
    UIImageView * yntypsoruewFindPasswordImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    yntypsoruewFindPasswordImgView.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:yntypsoruewFindPasswordImgView];
    
    UILabel * yntyspoiuryewFindPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(yntypsoruewFindPasswordImgView.frame)+K(10), CGRectGetMidY(yntypsoruewFindPasswordImgView.frame)-K(12.5), K(350), K(25))];
    yntyspoiuryewFindPasswordTitle.font = KBlFont(25);
    yntyspoiuryewFindPasswordTitle.textColor = LGDBLackColor;
    yntyspoiuryewFindPasswordTitle.text = @"欢迎来到i体育";
    [self.view addSubview:yntyspoiuryewFindPasswordTitle];
    
    
    UIView * yntyspirfedaFindPasswordFieldView =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(yntyspoiuryewFindPasswordTitle.frame)+K(40), SCREEN_Width-K(50), K(200))];
    yntyspirfedaFindPasswordFieldView.layer.borderColor = LGDGaryColor.CGColor;
    yntyspirfedaFindPasswordFieldView.layer.cornerRadius = K(8);
    yntyspirfedaFindPasswordFieldView.layer.masksToBounds = YES;
    yntyspirfedaFindPasswordFieldView.layer.borderWidth = K(1);
    [self.view addSubview:yntyspirfedaFindPasswordFieldView];
    
    UIView * SanXiaFindPasswordlines = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(20), K(1))];
    SanXiaFindPasswordlines.backgroundColor =  LGDLightGaryColor;
    [yntyspirfedaFindPasswordFieldView addSubview:SanXiaFindPasswordlines];
    
    
    UITextField * yntySporyeFindPasswordtextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(10), K(40))];
    yntySporyeFindPasswordtextField.clearButtonMode = UITextFieldViewModeAlways;
    yntySporyeFindPasswordtextField.textColor = LGDBLackColor;
    yntySporyeFindPasswordtextField.font = KSysFont(15);
    yntySporyeFindPasswordtextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [yntyspirfedaFindPasswordFieldView addSubview:yntySporyeFindPasswordtextField];
    _yntySporyeFindPasswordtextField = yntySporyeFindPasswordtextField;
    
    
    UIView * keoqnseolviewsindPasswordlinesSecond = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(SanXiaFindPasswordlines.frame), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(20), K(1))];
    keoqnseolviewsindPasswordlinesSecond.backgroundColor =  LGDLightGaryColor;
    [yntyspirfedaFindPasswordFieldView addSubview:keoqnseolviewsindPasswordlinesSecond];
    
    
    UITextField * yntySportPasswordCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10)+CGRectGetMaxY(SanXiaFindPasswordlines.frame), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(10), K(40))];
    yntySportPasswordCodeTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntySportPasswordCodeTextField.textColor = LGDBLackColor;
    yntySportPasswordCodeTextField.font = KSysFont(15);
    yntySportPasswordCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [yntyspirfedaFindPasswordFieldView addSubview:yntySportPasswordCodeTextField];
    _yntySportPasswordCodeTextField = yntySportPasswordCodeTextField;
    
    
    UIButton * yntysporeFindPasswordCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(80), CGRectGetMaxY(SanXiaFindPasswordlines.frame)+K(20), K(70), K(20))];
    [yntysporeFindPasswordCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    yntysporeFindPasswordCodeBtn.titleLabel.font = KSysFont(12);
    [yntysporeFindPasswordCodeBtn addTarget:self action:@selector(yntysporeFindPasswordCodeBtnClck) forControlEvents:UIControlEventTouchUpInside];
    [yntysporeFindPasswordCodeBtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [yntyspirfedaFindPasswordFieldView addSubview:yntysporeFindPasswordCodeBtn];
    _yntysporeFindPasswordCodeBtn = yntysporeFindPasswordCodeBtn;
    
    
    UITextField * yntyuspoewsFindPasswordPasswordAgain = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(keoqnseolviewsindPasswordlinesSecond.frame), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(10), K(40))];
    yntyuspoewsFindPasswordPasswordAgain.clearButtonMode = UITextFieldViewModeAlways;
    yntyuspoewsFindPasswordPasswordAgain.textColor = LGDBLackColor;
    yntyuspoewsFindPasswordPasswordAgain.font = KSysFont(15);
    yntyuspoewsFindPasswordPasswordAgain.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请重新设置密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [yntyspirfedaFindPasswordFieldView addSubview:yntyuspoewsFindPasswordPasswordAgain];
    _yntyuspoewsFindPasswordPasswordAgain = yntyuspoewsFindPasswordPasswordAgain;
    
    
    UIView * yntstudealobsThreeline = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(keoqnseolviewsindPasswordlinesSecond.frame), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(20), K(1))];
    yntstudealobsThreeline.backgroundColor =  LGDLightGaryColor;
    [yntyspirfedaFindPasswordFieldView addSubview:yntstudealobsThreeline];
    
    
    UITextField * yntysporyesPasswordPassworTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(yntstudealobsThreeline.frame), CGRectGetWidth(yntyspirfedaFindPasswordFieldView.frame)-K(10), K(40))];
    yntysporyesPasswordPassworTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntysporyesPasswordPassworTextField.textColor = LGDBLackColor;
    yntysporyesPasswordPassworTextField.font = KSysFont(15);
    yntysporyesPasswordPassworTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请再次输入密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [yntyspirfedaFindPasswordFieldView addSubview:yntysporyesPasswordPassworTextField];
    _yntysporyesPasswordPassworTextField = yntysporyesPasswordPassworTextField;
    
    
    UIButton * ytyspiuewoFindPasswordlinesNextBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(yntyspirfedaFindPasswordFieldView.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [ytyspiuewoFindPasswordlinesNextBtn setBackgroundColor:LGDMianColor];
    ytyspiuewoFindPasswordlinesNextBtn.layer.cornerRadius = K(5);
    ytyspiuewoFindPasswordlinesNextBtn.layer.masksToBounds = YES;
    ytyspiuewoFindPasswordlinesNextBtn.titleLabel.font = KSysFont(15);
    [ytyspiuewoFindPasswordlinesNextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ytyspiuewoFindPasswordlinesNextBtn addTarget:self action:@selector(ytyspiuewoFindPasswordlinesNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [ytyspiuewoFindPasswordlinesNextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:ytyspiuewoFindPasswordlinesNextBtn];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)ytyspiuewoFindPasswordlinesNextBtnClick{
    if (_yntySporyeFindPasswordtextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_yntySporyeFindPasswordtextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_yntySportPasswordCodeTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入验证码"];
        return;
    }
    if (_yntySportPasswordCodeTextField.text.length != 4) {
        [LCProgressHUD showInfoMsg:@"请输入正确的验证码"];
        return;
    }
    if (_yntyuspoewsFindPasswordPasswordAgain.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请设置密码"];
        return;
    }
    if (![_yntyuspoewsFindPasswordPasswordAgain.text isEqualToString:_yntysporyesPasswordPassworTextField.text]) {
        [LCProgressHUD showInfoMsg:@"密码不一致"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showInfoMsg:@"稍后重试"];
    });
}
-(void)yntysporeFindPasswordCodeBtnClck{
    if (_yntySporyeFindPasswordtextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_yntySporyeFindPasswordtextField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    NSMutableDictionary * ynsyrtueaFindPasswordlinesParmters = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_yntySporyeFindPasswordtextField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/resetPdCode" Parameters:ynsyrtueaFindPasswordlinesParmters Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [LCProgressHUD showSuccess:@"发送成功"];
            self->_yntyspjrieaFindPasswordPassworTimers = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ynsyutFihdindPasswordlineAction) userInfo:nil repeats:YES];
            [self->_yntyspjrieaFindPasswordPassworTimers fire];
        }else{
            [LCProgressHUD showInfoMsg:@"发送失败"];
        }
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
    }];
    
    
}
-(void)ynsyutFihdindPasswordlineAction{
    _yntydfuiwerwFindPasswordPassworNums--;
    _yntysporeFindPasswordCodeBtn.enabled = NO;
    [_yntysporeFindPasswordCodeBtn setTitle:[NSString stringWithFormat:@"%lds后可重发",(long)_yntydfuiwerwFindPasswordPassworNums] forState:UIControlStateNormal];
    if (_yntydfuiwerwFindPasswordPassworNums == 0) {
        [_yntyspjrieaFindPasswordPassworTimers invalidate];
        [_yntysporeFindPasswordCodeBtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        _yntysporeFindPasswordCodeBtn.enabled = YES;
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



