//
//  keqiangboyLijiyuyeViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyLijiyuyeViewController.h"
#import <MOFSPickerManager.h>
@interface keqiangboyLijiyuyeViewController ()
{
    UILabel *  _keqiangboyStarTimelb;
    UILabel *  _keqiangboyStarTimelb1;
    UITextField * _keqiangTextField;
    UITextField * _keqiangTextField1;
    UITextField * _keqiangTextField2;
}
@end

@implementation keqiangboyLijiyuyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"预约详情";
    self.gk_navLineHidden = YES;
    UIImageView *  keqiangSectionImgView =  [self keqiangboyConfigerSectionImg:CGRectMake(K(20), K(20)+NaviH, K(20), K(20)) keqaingimgname:@"123456"];
    [self.view addSubview:keqiangSectionImgView];
    
    UILabel * keqiangtitle =  [self keqiagigmCofnierSecitonlbWith:@"填写信息" lbframe:CGRectMake(CGRectGetMaxX(keqiangSectionImgView.frame)+K(5), K(24)+NaviH, K(200), K(15))];
    [self.view addSubview:keqiangtitle];
    
    
    UIView * keqiangboyContentView = [[UIView alloc]initWithFrame:CGRectMake(K(20), CGRectGetMaxY(keqiangtitle.frame)+K(10), SCREEN_Width-K(40), K(200))];
    keqiangboyContentView.backgroundColor = [UIColor whiteColor];
    keqiangboyContentView.layer.cornerRadius  = K(5);
    [self.view addSubview:keqiangboyContentView];
    [keqiangboyContentView viewShadowPathWithColor:LGDGaryColor shadowOpacity:0.4 shadowRadius:K(5) shadowPathType:LeShadowPathAround shadowPathWidth:K(5)];
    
    [keqiangboyContentView addSubview:[self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(12.5), K(15), K(15)) keqaingimgname:@"xingming"]];
    
    [keqiangboyContentView addSubview:[self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(12.5)+K(40), K(15), K(15)) keqaingimgname:@"dianhua"]];

    [keqiangboyContentView addSubview:[self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(12.5)+K(40+40), K(15), K(15)) keqaingimgname:@"renshu"]];

    
    [keqiangboyContentView addSubview:[self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(12.5)+K(40+40+40), K(15), K(15)) keqaingimgname:@"shijian"]];

    [keqiangboyContentView addSubview:[self keqiangboyConfigerSectionImg:CGRectMake(K(15), K(12.5)+K(40+40+40+40), K(15), K(15)) keqaingimgname:@"shijian"]];
    [keqiangboyContentView addSubview:[self keqiagigmCofnierSecitonlbWith:@"姓名" lbframe:CGRectMake(K(40), K(12.5), K(50), K(15))]];

    [keqiangboyContentView addSubview:[self keqiagigmCofnierSecitonlbWith:@"电话" lbframe:CGRectMake(K(40), K(12.5)+K(40), K(50), K(15))]];
    
    [keqiangboyContentView addSubview:[self keqiagigmCofnierSecitonlbWith:@"人数" lbframe:CGRectMake(K(40), K(12.5)+K(40+40), K(50), K(15))]];
    
    [keqiangboyContentView addSubview:[self keqiagigmCofnierSecitonlbWith:@"时间" lbframe:CGRectMake(K(40), K(12.5)+K(40+40+40), K(50), K(15))]];

    [keqiangboyContentView addSubview:[self keqiagigmCofnierSecitonlbWith:@"小时" lbframe:CGRectMake(K(40), K(12.5)+K(40+40+40+40), K(50), K(15))]];
    UITextField * keqiangTextField = [self keqianhgTextFieldWirhFrame:CGRectMake(K(80), K(8), K(200), K(30)) holesder:@"请输入用户姓名"];
    keqiangTextField.keyboardType = UIKeyboardTypeDefault;
    
    [keqiangboyContentView addSubview:keqiangTextField];
    _keqiangTextField = keqiangTextField;
    
    
    
    UITextField * keqiangTextField1 = [self keqianhgTextFieldWirhFrame:CGRectMake(K(80), K(8)+K(40), K(200), K(30)) holesder:@"请输入联系电话"];
    keqiangTextField1.keyboardType = UIKeyboardTypePhonePad;
    [keqiangboyContentView addSubview:keqiangTextField1];
    _keqiangTextField1 = keqiangTextField1;
    
    
    UITextField * keqiangTextField2 = [self keqianhgTextFieldWirhFrame:CGRectMake(K(80), K(8)+K(40+40), K(200), K(30)) holesder:@"请输入人数"];
    keqiangTextField2.keyboardType = UIKeyboardTypePhonePad;
    [keqiangboyContentView addSubview:keqiangTextField2];
    _keqiangTextField2 = keqiangTextField2;
    
    
    
    UILabel *  keqiangboyStarTimelb  = [[UILabel alloc]initWithFrame:CGRectMake(K(80), K(6)+K(40+40+40), K(200), K(30))];
    keqiangboyStarTimelb.textColor = LGDLightBLackColor;
    keqiangboyStarTimelb.font = KSysFont(14);
    keqiangboyStarTimelb.text = @"请选择开始日期";
    keqiangboyStarTimelb.userInteractionEnabled = YES;
    [keqiangboyContentView addSubview:keqiangboyStarTimelb];
    _keqiangboyStarTimelb = keqiangboyStarTimelb;
    
    
    UITapGestureRecognizer * keqiangboytap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                    action:@selector(keqiangboyStarTimelbClicks)];
    
    [keqiangboyStarTimelb addGestureRecognizer:keqiangboytap];
    
    UILabel *  keqiangboyStarTimelb1  = [[UILabel alloc]initWithFrame:CGRectMake(K(80), K(6)+K(40+40+40+40), K(200), K(30))];
    keqiangboyStarTimelb1.textColor = LGDLightBLackColor;
    keqiangboyStarTimelb1.font = KSysFont(14);
    keqiangboyStarTimelb1.text = @"请选择租赁时间";
    keqiangboyStarTimelb1.userInteractionEnabled = YES;
    [keqiangboyContentView addSubview:keqiangboyStarTimelb1];
    UITapGestureRecognizer * keqiangboyt1ap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                    action:@selector(keqiangboyStarTimelbClicks1)];
    
    [keqiangboyStarTimelb1 addGestureRecognizer:keqiangboyt1ap];
    _keqiangboyStarTimelb1 = keqiangboyStarTimelb1;
    
    
    
    
    UIButton * keiqnahyueBnt  = [[UIButton alloc]initWithFrame:CGRectMake(K(20), CGRectGetMaxY(keqiangboyContentView.frame)+K(40), SCREEN_Width-K(40), K(40))];
    [keiqnahyueBnt setBackgroundColor:LGDMianColor];
    keiqnahyueBnt.layer.cornerRadius = K(5);
    keiqnahyueBnt.layer.masksToBounds = YES;
    keiqnahyueBnt.titleLabel.textAlignment = NSTextAlignmentCenter;
    [keiqnahyueBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keiqnahyueBnt addTarget:self action:@selector(keiqnahyueBntClick) forControlEvents:UIControlEventTouchUpInside];
    [keiqnahyueBnt setTitle:@"预约" forState:UIControlStateNormal];
    [self.view addSubview:keiqnahyueBnt];
    
    
}
-(void)keiqnahyueBntClick{
    if (_keqiangTextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入用户姓名"];
        return;
    }
    if (_keqiangTextField1.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入联系电话"];
        return;
    }
    if (_keqiangTextField2.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入参与人数"];
        return;
    }
    if ([_keqiangboyStarTimelb.text isEqualToString:@"请选择开始日期"]) {
        [LCProgressHUD showInfoMsg:@"请选择开始日期"];
        return;
    }
    if ([_keqiangboyStarTimelb1.text isEqualToString:@"请选择租赁时间"]) {
        [LCProgressHUD showInfoMsg:@"请选择租赁时间"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      BOOL  keiqng =   [WHC_ModelSqlite update:[keqiangChangdiModel class] value:[NSString stringWithFormat:@"isyuyue = '%@'",@(YES)] where:[NSString stringWithFormat:@"ContentID = '%ld'",self.keqiangModel.ContentID]];
        if (keiqng) {
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
        [LCProgressHUD showSuccess:@"预约成功，请注意手机短信！"];
    });
}
#pragma mark--日期
-(void)keqiangboyStarTimelbClicks{
    [[MOFSPickerManager shareManger] showDatePickerWithTag:0 commitBlock:^(NSDate * _Nonnull date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *timeStr = [formatter stringFromDate:date];
        self->_keqiangboyStarTimelb.text =  timeStr;
    } cancelBlock:^{
        
    }];
}
#pragma mark--租赁时间
-(void)keqiangboyStarTimelbClicks1{
    [[MOFSPickerManager shareManger] showPickerViewWithDataArray:@[@"1h",@"2h",@"3h",@"4h",@"半天",@"一天",@"一天以上"] tag:0 title:nil cancelTitle:@"取消" commitTitle:@"提交" commitBlock:^(NSString * _Nonnull string) {
        self->_keqiangboyStarTimelb1.text =  string;
    } cancelBlock:^{
    }];
    
}


-(UITextField *)keqianhgTextFieldWirhFrame:(CGRect)textfieldFraem holesder:(NSString *)hoderStr{
    UITextField *  keqiangTextField = [[UITextField alloc]initWithFrame:textfieldFraem];
    keqiangTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:hoderStr attributes:@{NSFontAttributeName:KSysFont(13),NSForegroundColorAttributeName:LGDLightBLackColor}];
    keqiangTextField.textAlignment = NSTextAlignmentCenter;
    keqiangTextField.layer.cornerRadius = K(5);
    keqiangTextField.layer.borderWidth =K(1);
    keqiangTextField.layer.borderColor = LGDLightGaryColor.CGColor;
    keqiangTextField.layer.masksToBounds = YES;
    keqiangTextField.textColor = LGDBLackColor;
    return keqiangTextField;
}
-(UIImageView * )keqiangboyConfigerSectionImg:(CGRect)Frme keqaingimgname:(NSString *)keqiang{
    UIImageView *keimg =[[UIImageView alloc]initWithFrame:Frme];
    keimg.image = [UIImage imageNamed:keqiang];
    return keimg;
}
-(UILabel *)keqiagigmCofnierSecitonlbWith:(NSString *)lbStr lbframe:(CGRect)lbFrame{
    UILabel * keqiaglbFrae = [[UILabel  alloc]initWithFrame:lbFrame];
    keqiaglbFrae.textColor = LGDBLackColor;
    keqiaglbFrae.font = KSysFont(12);
    keqiaglbFrae.text = lbStr;
    return keqiaglbFrae;
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
