#import "yntySprotRegisterViewController.h"

@interface yntySprotRegisterViewController ()
{
    UITextField * _yntySportRegisterTextPhoneField;
    UITextField * _yntySportRegisterCodeTextField;
    UITextField * _yntySportRegisterPassWordTextField;
    NSTimer *    _yntySportRegisterTimers;
    NSInteger _yntySportRegisterNums;
    UIButton * _yntysportRegisterCodebtn;
}
@end

@implementation yntySprotRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"注册";
    _yntySportRegisterNums = 60;
    UIImageView * yntysportlogiMgview = [[UIImageView alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), K(25), K(25))];
    yntysportlogiMgview.image =[UIImage imageNamed:@"logo"];
    [self.view addSubview:yntysportlogiMgview];
    
    UILabel * yntysogufsddTtles = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(yntysportlogiMgview.frame)+K(10), CGRectGetMidY(yntysportlogiMgview.frame)-K(12.5), K(350), K(25))];
    yntysogufsddTtles.font = KBlFont(25);
    yntysogufsddTtles.textColor = LGDBLackColor;
    yntysogufsddTtles.text = @"欢迎来到i体育";
    [self.view addSubview:yntysogufsddTtles];
    
    
    UIView * ytiyusdgaRegisterFieldView =[[UIView alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(yntysogufsddTtles.frame)+K(40), SCREEN_Width-K(50), K(150))];
    ytiyusdgaRegisterFieldView.layer.borderColor = LGDGaryColor.CGColor;
    ytiyusdgaRegisterFieldView.layer.cornerRadius = K(8);
    ytiyusdgaRegisterFieldView.layer.masksToBounds = YES;
    ytiyusdgaRegisterFieldView.layer.borderWidth = K(1);
    [self.view addSubview:ytiyusdgaRegisterFieldView];
    
    UIView * yndasgkibes = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50), CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(20), K(1))];
    yndasgkibes.backgroundColor =  LGDLightGaryColor;
    [ytiyusdgaRegisterFieldView addSubview:yndasgkibes];
    
    
    UITextField * yntySportRegisterTextPhoneField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10), CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(10), K(40))];
    yntySportRegisterTextPhoneField.clearButtonMode = UITextFieldViewModeAlways;
    yntySportRegisterTextPhoneField.textColor = LGDBLackColor;
    yntySportRegisterTextPhoneField.font = KSysFont(15);
    yntySportRegisterTextPhoneField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [ytiyusdgaRegisterFieldView addSubview:yntySportRegisterTextPhoneField];
    _yntySportRegisterTextPhoneField =  yntySportRegisterTextPhoneField;
    
    
    UIView * yndasgkibesSecond = [[UIView alloc]initWithFrame:CGRectMake(K(10), K(50)+CGRectGetMaxY(yndasgkibes.frame), CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(20), K(1))];
    yndasgkibesSecond.backgroundColor =  LGDLightGaryColor;
    [ytiyusdgaRegisterFieldView addSubview:yndasgkibesSecond];
    
    
    UITextField * yntySportRegisterCodeTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(10)+CGRectGetMaxY(yndasgkibes.frame), CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(10), K(40))];
    yntySportRegisterCodeTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntySportRegisterCodeTextField.textColor = LGDBLackColor;
    yntySportRegisterCodeTextField.font = KSysFont(15);
    yntySportRegisterCodeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [ytiyusdgaRegisterFieldView addSubview:yntySportRegisterCodeTextField];
    _yntySportRegisterCodeTextField = yntySportRegisterCodeTextField;
    
    
    
    UIButton * yntysportRegisterCodebtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(80), CGRectGetMaxY(yndasgkibes.frame)+K(20), K(70), K(20))];
    [yntysportRegisterCodebtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    yntysportRegisterCodebtn.titleLabel.font = KSysFont(12);
    [yntysportRegisterCodebtn addTarget:self action:@selector(yntysportRegisterCodebtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [yntysportRegisterCodebtn setTitleColor:LGDLightBLackColor forState:UIControlStateNormal];
    [ytiyusdgaRegisterFieldView addSubview:yntysportRegisterCodebtn];
    _yntysportRegisterCodebtn = yntysportRegisterCodebtn;
    
    
    
    UITextField * yntySportRegisterPassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(K(10), K(5)+CGRectGetMaxY(yndasgkibesSecond.frame), CGRectGetWidth(ytiyusdgaRegisterFieldView.frame)-K(10), K(40))];
    yntySportRegisterPassWordTextField.clearButtonMode = UITextFieldViewModeAlways;
    yntySportRegisterPassWordTextField.textColor = LGDBLackColor;
    yntySportRegisterPassWordTextField.font = KSysFont(15);
    yntySportRegisterPassWordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请设置密码" attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    [ytiyusdgaRegisterFieldView addSubview:yntySportRegisterPassWordTextField];
    _yntySportRegisterPassWordTextField = yntySportRegisterPassWordTextField;
    
    
    UIButton * ynstyudadRegistnextBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), CGRectGetMaxY(ytiyusdgaRegisterFieldView.frame)+K(25), SCREEN_Width-K(50), K(45))];
    [ynstyudadRegistnextBtn setBackgroundColor:LGDMianColor];
    ynstyudadRegistnextBtn.layer.cornerRadius = K(5);
    ynstyudadRegistnextBtn.layer.masksToBounds = YES;
    ynstyudadRegistnextBtn.titleLabel.font = KSysFont(15);
    [ynstyudadRegistnextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ynstyudadRegistnextBtn addTarget:self action:@selector(ynstyudadRegistnextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [ynstyudadRegistnextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:ynstyudadRegistnextBtn];
    
    
    
    
    // Do any additional setup after loading the view.
}
-(void)ynstyudadRegistnextBtnClick{
    if (_yntySportRegisterTextPhoneField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_yntySportRegisterTextPhoneField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    if (_yntySportRegisterCodeTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入验证码"];
        return;
    }
    if (_yntySportRegisterCodeTextField.text.length != 4) {
        [LCProgressHUD showInfoMsg:@"请输入正确的验证码"];
        return;
    }
    if (_yntySportRegisterPassWordTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请设置密码"];
        return;
    }
    NSMutableDictionary *ynfsutrfepafhd = [[NSMutableDictionary alloc]initWithDictionary:@{@"code":_yntySportRegisterCodeTextField.text,@"passwords":_yntySportRegisterPassWordTextField.text,@"username":_yntySportRegisterTextPhoneField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/register2" Parameters:ynfsutrfepafhd Success:^(id  _Nonnull object) {
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
-(void)yntysportRegisterCodebtnClick:(UIButton * )keqiangbotBtn{
    if (_yntySportRegisterTextPhoneField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入手机号"];
        return;
    }
    if (_yntySportRegisterTextPhoneField.text.length != 11) {
        [LCProgressHUD showInfoMsg:@"请输入正确的手机号"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    NSMutableDictionary * ynfsutrfepafhd = [NSMutableDictionary dictionaryWithDictionary:@{@"phone":_yntySportRegisterTextPhoneField.text}];
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://119.23.47.244:8088/applyjob/registerCode" Parameters:ynfsutrfepafhd Success:^(id  _Nonnull object) {
        NSString * Code = [NSString stringWithFormat:@"%@",[object objectForKey:@"code"]];
        if ([Code isEqualToString:@"200"]) {
            [LCProgressHUD showSuccess:@"发送成功"];
            self->_yntySportRegisterTimers = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(yudsguAcutihs) userInfo:nil repeats:YES];
            [self->_yntySportRegisterTimers fire];
        }else{
            [LCProgressHUD showInfoMsg:@"发送失败"];
        }
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
    }];
    
}
-(void)yudsguAcutihs{
    _yntySportRegisterNums--;
    _yntysportRegisterCodebtn.enabled = NO;
    [_yntysportRegisterCodebtn setTitle:[NSString stringWithFormat:@"%lds后可重发",(long)_yntySportRegisterNums] forState:UIControlStateNormal];
    if (_yntySportRegisterNums == 0) {
        [_yntySportRegisterTimers invalidate];
        [_yntysportRegisterCodebtn setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        _yntysportRegisterCodebtn.enabled = YES;
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

