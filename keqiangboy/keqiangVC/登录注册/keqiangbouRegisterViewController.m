#import "keqiangbouRegisterViewController.h"

@interface keqiangbouRegisterViewController ()
{
    UITextField * _keqiangboysRegisterTextPhoneField;
    UITextField * _keqiangboysRegisterCodeTextField;
    UITextField * _keqiangboysRegisterPassWordTextField;
    NSTimer *    _keqiangboysRegisterTimers;
    NSInteger _keqiangboysRegisterNums;
    UIButton * _keqioagboysRegisterCodebtn;
}
@end

@implementation keqiangbouRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"注册";
    _keqiangboysRegisterNums = 60;
    UIImageView * keqiangregisyrImgRegisterImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    keqiangregisyrImgRegisterImgView.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:keqiangregisyrImgRegisterImgView];
    
    UILabel * keqiangboydTtles = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangregisyrImgRegisterImgView.frame)+K(10), CGRectGetMidY(keqiangregisyrImgRegisterImgView.frame)-K(12.5), K(350), K(25))];
    keqiangboydTtles.font = KBlFont(25);
    keqiangboydTtles.textColor = LGDBLackColor;
    keqiangboydTtles.text = @"欢迎来到A8体育";
    [self.view addSubview:keqiangboydTtles];
    
    
    UIView * keqiangboFieldsRegisterFieldView =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangboydTtles.frame)+K(40), SCREEN_Width-K(50), K(150))];
    keqiangboFieldsRegisterFieldView.layer.borderColor = LGDGaryColor.CGColor;
    keqiangboFieldsRegisterFieldView.layer.cornerRadius = K(8);
    keqiangboFieldsRegisterFieldView.layer.masksToBounds = YES;
    keqiangboFieldsRegisterFieldView.layer.borderWidth = K(1);
    [self.view addSubview:keqiangboFieldsRegisterFieldView];
    
    UIView * keqiangboysRegisteLines = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(20), K(1))];
    keqiangboysRegisteLines.backgroundColor =  LGDLightGaryColor;
    [keqiangboFieldsRegisterFieldView addSubview:keqiangboysRegisteLines];
    
    
    UITextField * keqiangboysRegisterTextPhoneField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(10), K(40))];
    keqiangboysRegisterTextPhoneField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysRegisterTextPhoneField.textColor = LGDBLackColor;
    keqiangboysRegisterTextPhoneField.font = KSysFont(15);
    keqiangboysRegisterTextPhoneField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangboFieldsRegisterFieldView addSubview:keqiangboysRegisterTextPhoneField];
    _keqiangboysRegisterTextPhoneField =  keqiangboysRegisterTextPhoneField;
    
    
    UIView * keqiangboysRegisteLinesSecond = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(keqiangboysRegisteLines.frame), CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(20), K(1))];
    keqiangboysRegisteLinesSecond.backgroundColor =  LGDLightGaryColor;
    [keqiangboFieldsRegisterFieldView addSubview:keqiangboysRegisteLinesSecond];
    
    
    UITextField * keqiangboysRegisterCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10)+CGRectGetMaxY(keqiangboysRegisteLines.frame), CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(10), K(40))];
    keqiangboysRegisterCodeTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysRegisterCodeTextField.textColor = LGDBLackColor;
    keqiangboysRegisterCodeTextField.font = KSysFont(15);
    keqiangboysRegisterCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangboFieldsRegisterFieldView addSubview:keqiangboysRegisterCodeTextField];
    _keqiangboysRegisterCodeTextField = keqiangboysRegisterCodeTextField;
    
    
    
    UIButton * keqioagboysRegisterCodebtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(80), CGRectGetMaxY(keqiangboysRegisteLines.frame)+K(20), K(70), K(20))];
    [keqioagboysRegisterCodebtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    keqioagboysRegisterCodebtn.titleLabel.font = KSysFont(12);
    [keqioagboysRegisterCodebtn addTarget:self action:@selector(keqioagboysRegisterCodebtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [keqioagboysRegisterCodebtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [keqiangboFieldsRegisterFieldView addSubview:keqioagboysRegisterCodebtn];
    _keqioagboysRegisterCodebtn = keqioagboysRegisterCodebtn;
    
    
    
    UITextField * keqiangboysRegisterPassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(keqiangboysRegisteLinesSecond.frame), CGRectGetWidth(keqiangboFieldsRegisterFieldView.frame)-K(10), K(40))];
    keqiangboysRegisterPassWordTextField.clearButtonMode = UITextFieldViewModeAlways;
    keqiangboysRegisterPassWordTextField.textColor = LGDBLackColor;
    keqiangboysRegisterPassWordTextField.font = KSysFont(15);
    keqiangboysRegisterPassWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请设置密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [keqiangboFieldsRegisterFieldView addSubview:keqiangboysRegisterPassWordTextField];
    _keqiangboysRegisterPassWordTextField = keqiangboysRegisterPassWordTextField;
    
    
    UIButton * keqiangboysRegistnextBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(keqiangboFieldsRegisterFieldView.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [keqiangboysRegistnextBtn setBackgroundColor:LGDMianColor];
    keqiangboysRegistnextBtn.layer.cornerRadius = K(5);
    keqiangboysRegistnextBtn.layer.masksToBounds = YES;
    keqiangboysRegistnextBtn.titleLabel.font = KSysFont(15);
    [keqiangboysRegistnextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keqiangboysRegistnextBtn addTarget:self action:@selector(keqiangboysRegistnextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboysRegistnextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:keqiangboysRegistnextBtn];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)keqiangboysRegistnextBtnClick{
    if (_keqiangboysRegisterTextPhoneField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_keqiangboysRegisterTextPhoneField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_keqiangboysRegisterCodeTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入验证码"];
        return;
    }
    if (_keqiangboysRegisterCodeTextField.text.length != 4) {
        [LCProgressHUD showInfoMsg:@"请输入正确的验证码"];
        return;
    }
    if (_keqiangboysRegisterPassWordTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请设置密码"];
        return;
    }
    NSMutableDictionary *keqiangboiysRegisterParmters = [[NSMutableDictionary alloc]initWithDictionary:@{@"code":_keqiangboysRegisterCodeTextField.text,@"passwords":_keqiangboysRegisterPassWordTextField.text,@"username":_keqiangboysRegisterTextPhoneField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/register2" Parameters:keqiangboiysRegisterParmters Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [LCProgressHUD showSuccess:@"注册成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [LCProgressHUD showInfoMsg:@"注册失败"];
        }
    } Failure:^(id  _Nonnull fail) {
        
    }];
    
}
-(void)keqioagboysRegisterCodebtnClick:(UIButton * )keqiangbotBtn{
    if (_keqiangboysRegisterTextPhoneField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_keqiangboysRegisterTextPhoneField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    NSMutableDictionary * keqiangboiysRegisterParmters = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_keqiangboysRegisterTextPhoneField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/registerCode" Parameters:keqiangboiysRegisterParmters Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [LCProgressHUD showSuccess:@"发送成功"];
            self->_keqiangboysRegisterTimers = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(keqiangouyysRegisterSendCodeAction) userInfo:nil repeats:YES];
            [self->_keqiangboysRegisterTimers fire];
        }else{
            [LCProgressHUD showInfoMsg:@"发送失败"];
        }
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
    }];
    
}
-(void)keqiangouyysRegisterSendCodeAction{
    _keqiangboysRegisterNums--;
    _keqioagboysRegisterCodebtn.enabled = NO;
    [_keqioagboysRegisterCodebtn setTitle:[NSString stringWithFormat:@"%lds后可重发",(long)_keqiangboysRegisterNums] forState:UIControlStateNormal];
    if (_keqiangboysRegisterNums == 0) {
        [_keqiangboysRegisterTimers invalidate];
        [_keqioagboysRegisterCodebtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        _keqioagboysRegisterCodebtn.enabled = YES;
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

