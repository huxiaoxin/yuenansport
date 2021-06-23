
#import "keqaingboysjubaoController.h"
#import "keqiangboyjbaoTabelViewCell.h"
#import "keqiangboyjubaoModle.h"
#import <UITextView+ZWPlaceHolder.h>
@interface keqaingboysjubaoController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqiangboyjubaoTableView;
@property(nonatomic,strong) NSMutableArray * keqiangboyjubaoDataArr;
@end

@implementation keqaingboysjubaoController
-(NSMutableArray *)keqiangboyjubaoDataArr{
    if (!_keqiangboyjubaoDataArr) {
        _keqiangboyjubaoDataArr = [[NSMutableArray alloc]init];
        
        keqiangboyjubaoModle * keqiangboyModel = [[keqiangboyjubaoModle alloc]init];
        keqiangboyModel.keqiangboyState = NO;
        keqiangboyModel.keqiangboyStr = @"评论内容涉嫌传播黄赌毒等信息";
        [_keqiangboyjubaoDataArr addObject:keqiangboyModel];
        
        keqiangboyjubaoModle * keqiangboyModel1 = [[keqiangboyjubaoModle alloc]init];
        keqiangboyModel1.keqiangboyState = NO;
        keqiangboyModel1.keqiangboyStr = @"打广告嫌疑";
        [_keqiangboyjubaoDataArr addObject:keqiangboyModel1];
        
        keqiangboyjubaoModle * keqiangboyModel2 = [[keqiangboyjubaoModle alloc]init];
        keqiangboyModel2.keqiangboyState = NO;
        keqiangboyModel2.keqiangboyStr = @"煽动内乱言论";
        [_keqiangboyjubaoDataArr addObject:keqiangboyModel2];
        
        keqiangboyjubaoModle * keqiangboyModel3 = [[keqiangboyjubaoModle alloc]init];
        keqiangboyModel3.keqiangboyState = NO;
        keqiangboyModel3.keqiangboyStr = @"侵犯他人品牌";
        [_keqiangboyjubaoDataArr addObject:keqiangboyModel3];
        
    }
    return _keqiangboyjubaoDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    self.gk_navTitle = @"举报";
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.keqiangboyjubaoTableView];
    
    
    UIView * keqiangmoFooterViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(600))];
    keqiangmoFooterViews.backgroundColor = [UIColor whiteColor];
    
    UITextView * keqiangboyTextFields = [[UITextView alloc]initWithFrame:CGRectMake(K(16), K(27.5), SCREEN_Width-K(32), K(202))];
    keqiangboyTextFields.layer.cornerRadius = K(5);
    keqiangboyTextFields.layer.masksToBounds = YES;
    keqiangboyTextFields.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    keqiangboyTextFields.placeholder = @"您还可以进一步详细说明您举报的理解，以便工作人员进行核实处理";
    keqiangboyTextFields.zw_placeHolderColor = [UIColor colorWithHexString:@"#888888"];
    keqiangboyTextFields.textColor = LGDBLackColor;
    keqiangboyTextFields.font = KSysFont(14);
    [keqiangmoFooterViews addSubview:keqiangboyTextFields];
    
    UIButton * keqiangboyComBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(16), CGRectGetMaxY(keqiangboyTextFields.frame)+K(57), SCREEN_Width-K(32), K(44))];
    [keqiangboyComBtn setBackgroundImage:[UIImage imageNamed:@"提交"] forState:UIControlStateNormal];
    [keqiangboyComBtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    keqiangboyComBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    keqiangboyComBtn.titleLabel.font = KBlFont(16);
    [keqiangboyComBtn addTarget:self action:@selector(keqiangboyComBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboyComBtn setTitle:@"提交" forState:UIControlStateNormal];
    [keqiangmoFooterViews  addSubview:keqiangboyComBtn];
    _keqiangboyjubaoTableView.tableFooterView = keqiangmoFooterViews;
    
    
    
}
-(UITableView *)keqiangboyjubaoTableView{
    if (!_keqiangboyjubaoTableView) {
        _keqiangboyjubaoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangboyjubaoTableView.delegate = self;
        _keqiangboyjubaoTableView.dataSource = self;
        _keqiangboyjubaoTableView.showsVerticalScrollIndicator = NO;
        _keqiangboyjubaoTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboyjubaoTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyjubaoTableView.backgroundColor = [UIColor whiteColor];
    }
    return _keqiangboyjubaoTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangboyjubaoDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangboyIdentifers = @"keqiangboyjbaoTabelViewCell";
    keqiangboyjbaoTabelViewCell * keqiangboyCell = [tableView dequeueReusableCellWithIdentifier:keqiangboyIdentifers];
    if (keqiangboyCell == nil) {
        keqiangboyCell = [[keqiangboyjbaoTabelViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangboyIdentifers];
    }
    keqiangboyCell.keqiangModel = self.keqiangboyjubaoDataArr[indexPath.row];
    return keqiangboyCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyjubaoModle * keqiangboyModel = self.keqiangboyjubaoDataArr[indexPath.row];
    keqiangboyModel.keqiangboyState = !keqiangboyModel.keqiangboyState;
    [self.keqiangboyjubaoTableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(20);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * keqanhHeaders =[UIView new];
    keqanhHeaders.backgroundColor  = [UIColor whiteColor];
    UILabel * keqianboylbs =[[UILabel alloc]initWithFrame:CGRectMake(K(15), K(5), K(200), K(15))];
    keqianboylbs.font = KBlFont(14);
    keqianboylbs.textColor = LGDBLackColor;
    keqianboylbs.text = @"请您选择或者填写举报的原因：";
    [keqanhHeaders addSubview:keqianboylbs];
    return keqanhHeaders;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(NSInteger)keqiangboysCacoutCunt{
    NSInteger count = 0;
    for (keqiangboyjubaoModle * keqiangoymodel in self.keqiangboyjubaoDataArr) {
        if (keqiangoymodel.keqiangboyState) {
            count +=1;
        }
    }
    return count;
}
#pragma mark--提交
-(void)keqiangboyComBtnCLick{
    if ([self keqiangboysCacoutCunt] == 0) {
        [LCProgressHUD showInfoMsg:@"请选择举报选项"];
        return;
    }
    [LCProgressHUD showLoading:@""];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"举报成功!，24小时通知举报结果"];
        [weakSelf.navigationController popViewControllerAnimated:YES];
    });
    
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
