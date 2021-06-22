//
//  keqiangmsgViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangmsgViewController.h"
#import "keqiangboysystemmsgViewController.h"
#import "keqianboyrommTableViewCell.h"
#import "keqiangboyRoomDetailViewController.h"
@interface keqiangmsgViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqiangmsgTableView;
@property(nonatomic,strong) NSMutableArray * keqiangmsgDataArr;
@end

@implementation keqiangmsgViewController

-(NSMutableArray *)keqiangmsgDataArr{
    if (!_keqiangmsgDataArr) {
        _keqiangmsgDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangmsgDataArr;
}
-(void)keqiangboyLoginsSucced{
    [self.keqiangmsgTableView.mj_header beginRefreshing];
}
-(void)keqiangboylogonout{
    [self.keqiangmsgTableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboyLoginsSucced) name:@"keqiangboyLoginsSucced" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboylogonout) name:@"keqiangboylogonout" object:nil];
    UILabel * keqiangsoureleftlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), 0, K(50), K(16))];
    keqiangsoureleftlb.textColor = LGDBLackColor;
    keqiangsoureleftlb.font = KBlFont(15);
    keqiangsoureleftlb.text = @"历史";
    self.gk_navItemLeftSpace = K(15);
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangsoureleftlb];
    
    
    UIView * keqiangrightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
    UIButton * keqiangrightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(10), K(15), K(15))];
    [keqiangrightBtn setBackgroundImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
    [keqiangrightBtn addTarget:self action:@selector(keqiangrightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangrightView addSubview:keqiangrightBtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangrightView];
    
    [self.view addSubview:self.keqiangmsgTableView];
}
-(UITableView *)keqiangmsgTableView{
    if (!_keqiangmsgTableView) {
        _keqiangmsgTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangmsgTableView.delegate = self;
        _keqiangmsgTableView.dataSource = self;
        _keqiangmsgTableView.showsVerticalScrollIndicator = NO;
        _keqiangmsgTableView.showsHorizontalScrollIndicator = NO;
        _keqiangmsgTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangmsgTableView.backgroundColor = [UIColor whiteColor];
        _keqiangmsgTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangmsgTalevieheaderCLicks)];
        [_keqiangmsgTableView.mj_header beginRefreshing];
    }
    return _keqiangmsgTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangmsgDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(190);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangroomIdentifer = @"keqianboyrommTableViewCell";
    keqianboyrommTableViewCell * keqingCell = [tableView dequeueReusableCellWithIdentifier:keqiangroomIdentifer];
    if (keqingCell == nil) {
        keqingCell = [[keqianboyrommTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangroomIdentifer];
    }
    keqingCell.keqnagMidol = self.keqiangmsgDataArr[indexPath.row];
    return keqingCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiangmsgDataArr[indexPath.row];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
}
-(void)keqiangmsgTalevieheaderCLicks{
    MJWeakSelf;
    NSArray * keqiangData = [WHC_ModelSqlite query:[keqiangChangdiModel class]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.keqiangmsgDataArr.count > 0) {
            [weakSelf.keqiangmsgDataArr removeAllObjects];
        }
        
        NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
        if (![keqiangboyState isEqualToString:@"1"]) {
            [LCProgressHUD showInfoMsg:@"未登录"];
            LYEmptyView * lyemtyVew = [LYEmptyView emptyActionViewWithImage:[UIImage imageNamed:@"weidenglu"] titleStr:@"未登录" detailStr:nil btnTitleStr:@"去登录" target:self action:@selector(keqiangemtvotl)];
            lyemtyVew.actionBtnTitleColor = [UIColor whiteColor];
            lyemtyVew.actionBtnBackGroundColor = LGDMianColor;
            lyemtyVew.actionBtnBackGroundColor = LGDMianColor;
            lyemtyVew.actionBtnTitleColor = [UIColor whiteColor];
            weakSelf.keqiangmsgTableView.ly_emptyView = lyemtyVew;
            [weakSelf.keqiangmsgTableView reloadData];
            [weakSelf.keqiangmsgTableView.mj_header endRefreshing];
            return;
        }
        for (keqiangChangdiModel * mdoel in keqiangData) {
            if (mdoel.isColltecd) {
                [weakSelf.keqiangmsgDataArr addObject:mdoel];
            }
        }
        if (weakSelf.keqiangmsgDataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"暂未收藏"];
            LYEmptyView * lyeView = [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@"weidenglu"] titleStr:@"暂无数据" detailStr:nil];
            weakSelf.keqiangmsgTableView.ly_emptyView = lyeView;
        }
        [weakSelf.keqiangmsgTableView reloadData];
        [weakSelf.keqiangmsgTableView.mj_header endRefreshing];
    });
    
}
-(void)keqiangemtvotl{
    [self keqiangboyShowloginVc];
}
-(void)keqiangrightBtnClick{
    keqiangboysystemmsgViewController * keqiangMsgVc = [[keqiangboysystemmsgViewController alloc]init];
    keqiangMsgVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqiangMsgVc animated:YES];
    
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
