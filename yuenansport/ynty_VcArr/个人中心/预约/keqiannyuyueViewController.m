//
//  keqiannyuyueViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiannyuyueViewController.h"
#import "keqianboyrommTableViewCell.h"
#import "keqiangboyRoomDetailViewController.h"
@interface keqiannyuyueViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * keqiangboyyuyueTabelView;
@property(nonatomic,strong) NSMutableArray * keqiantyeDataArr;
@end

@implementation keqiannyuyueViewController
-(NSMutableArray *)keqiantyeDataArr{
    if (!_keqiantyeDataArr) {
        _keqiantyeDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiantyeDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的预约";
    [self.view addSubview:self.keqiangboyyuyueTabelView];
    // Do any additional setup after loading the view.
}
-(UITableView *)keqiangboyyuyueTabelView{
    if (!_keqiangboyyuyueTabelView) {
        _keqiangboyyuyueTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangboyyuyueTabelView.delegate  =self;
        _keqiangboyyuyueTabelView.dataSource = self;
        _keqiangboyyuyueTabelView.showsHorizontalScrollIndicator = NO;
        _keqiangboyyuyueTabelView.showsVerticalScrollIndicator = NO;
        _keqiangboyyuyueTabelView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangboyyuyueTabelView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangboyyuyueHeaderClicks)];
        [_keqiangboyyuyueTabelView.mj_header beginRefreshing];
    }
    return _keqiangboyyuyueTabelView;
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
    keqingCell.keqnagMidol = self.keqiantyeDataArr[indexPath.row];
    return keqingCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiantyeDataArr[indexPath.row];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiantyeDataArr.count;
}
-(void)keqiangboyyuyueHeaderClicks{
    NSArray * keqingdata = [WHC_ModelSqlite query:[yntyHomeYundonModel class]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.keqiantyeDataArr.count > 0) {
            [weakSelf.keqiantyeDataArr removeAllObjects];
        }
        for (yntyHomeYundonModel * keqiangMdoel in keqingdata) {
            if (keqiangMdoel.isyuyue) {
                [weakSelf.keqiantyeDataArr addObject:keqiangMdoel];
            }
        }
        if (weakSelf.keqiantyeDataArr.count == 0) {
            LYEmptyView * keqangem = [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@""] titleStr:@"暂无预约" detailStr:nil];
            [LCProgressHUD showInfoMsg:@"暂无预约"];
            weakSelf.keqiangboyyuyueTabelView.ly_emptyView = keqangem;
        }
        [weakSelf.keqiangboyyuyueTabelView reloadData];
        [weakSelf.keqiangboyyuyueTabelView.mj_header endRefreshing];
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
