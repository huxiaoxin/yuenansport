

#import "keqiangboysinfoDetailContrler.h"

@interface keqiangboysinfoDetailContrler ()
{
    UITextField * _keqianhgboysfotextField;
}
@end

@implementation keqiangboysinfoDetailContrler

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"修改姓名";
    
    self.view.backgroundColor = LGDLightGaryColor;
    
    UITextField * keqianhgboysfotextField = [[UITextField alloc]initWithFrame:CGRectMake(K(25), NaviH+K(20), SCREEN_Width-K(50), K(40))];
    keqianhgboysfotextField.backgroundColor = [UIColor whiteColor];
    keqianhgboysfotextField.layer.cornerRadius = K(5);
    keqianhgboysfotextField.layer.masksToBounds = YES;
    keqianhgboysfotextField.textAlignment = NSTextAlignmentCenter;
    keqianhgboysfotextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"修改姓名" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:K(12)],NSForegroundColorAttributeName:LGDGaryColor}];
    [self.view addSubview:keqianhgboysfotextField];
    _keqianhgboysfotextField = keqianhgboysfotextField;
    
    
    UIView * keiqangouycompltViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(60))];
    
    UIButton * keiqanbiouysComplteBtns = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(15), K(40), K(20))];
    [keiqanbiouysComplteBtns setTitle:@"完成" forState:UIControlStateNormal];
    keiqanbiouysComplteBtns.titleLabel.font = KSysFont(14);
    [keiqanbiouysComplteBtns setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    [keiqanbiouysComplteBtns addTarget:self action:@selector(keiqanbiouysComplteBtnsClick) forControlEvents:UIControlEventTouchUpInside];
    [keiqangouycompltViews addSubview:keiqanbiouysComplteBtns];
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keiqangouycompltViews];
    // Do any additional setup after loading the view.
}
-(void)keiqanbiouysComplteBtnsClick{
    if (_keqianhgboysfotextField.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"请输入内容"];
        return;
    }
    self.kefinboks(_keqianhgboysfotextField.text);
    [self.navigationController popViewControllerAnimated:YES];
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
