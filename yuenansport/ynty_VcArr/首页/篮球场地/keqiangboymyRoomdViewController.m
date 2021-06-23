//
//  keqiangboymyRoomdViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboymyRoomdViewController.h"
#import "keqianboyrommTableViewCell.h"
#import "keqiangboyRoomDetailViewController.h"
@interface keqiangboymyRoomdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqiangboyroomTableView;
@property(nonatomic,strong) NSMutableArray * keqiangDataArr;
@end

@implementation keqiangboymyRoomdViewController
-(NSMutableArray *)keqiangDataArr{
    if (!_keqiangDataArr) {
        _keqiangDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"篮球场地";
    [self.view addSubview:self.keqiangboyroomTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)keqiangboyroomTableView{
    if (!_keqiangboyroomTableView) {
        _keqiangboyroomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangboyroomTableView.delegate = self;
        _keqiangboyroomTableView.dataSource = self;
        _keqiangboyroomTableView.showsVerticalScrollIndicator = NO;
        _keqiangboyroomTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboyroomTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyroomTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqianboyroomheaderClicks)];
        [_keqiangboyroomTableView.mj_header beginRefreshing];
    }
    return _keqiangboyroomTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangDataArr.count;
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
    keqingCell.keqnagMidol = self.keqiangDataArr[indexPath.row];
    return keqingCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiangDataArr[indexPath.row];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
}
-(void)keqianboyroomheaderClicks{
    MJWeakSelf;
    NSArray * keqiangboyData = [WHC_ModelSqlite query:[yntyHomeYundonModel class]];
    NSMutableDictionary * keqiangboyParmter = [[NSMutableDictionary alloc]initWithDictionary:@{@"pageNumber":@"2",@"pageSize":@"3",@"searchBefore":@"true"}];
    [TTJZHttpTool getHttpRequestWithURL:@"http://121.36.193.131/api/v3.1/competition/compleague/GetListForPopular" Parameters:keqiangboyParmter Success:^(id  _Nonnull object) {
        if (weakSelf.keqiangDataArr.count > 0) {
            [weakSelf.keqiangDataArr removeAllObjects];
        }
        for (yntyHomeYundonModel * kelinmdoe in keqiangboyData) {
            if (kelinmdoe.type == 1) {
                [self.keqiangDataArr addObject:kelinmdoe];
            }
        }
        [weakSelf.keqiangboyroomTableView reloadData];
        [weakSelf.keqiangboyroomTableView.mj_header endRefreshing];
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
        [weakSelf.keqiangboyroomTableView.mj_header endRefreshing];
    }];
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
