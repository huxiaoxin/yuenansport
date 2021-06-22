//
//  keqiangsaishiListViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangsaishiListViewController.h"
#import "keqianboyrommTableViewCell.h"
#import "keqiangboysaishiModle.h"
#import "keqiangboyRoomDetailViewController.h"
@interface keqiangsaishiListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqiangsaiTableView;
@property(nonatomic,strong) NSMutableArray * keqiangsaiDataArr;

@end

@implementation keqiangsaishiListViewController
-(NSMutableArray *)keqiangsaiDataArr{
    if (!_keqiangsaiDataArr) {
        _keqiangsaiDataArr =[[NSMutableArray alloc]init];
    }
    return _keqiangsaiDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"足球场地";
    [self.view addSubview:self.keqiangsaiTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)keqiangsaiTableView{
    if (!_keqiangsaiTableView) {
        _keqiangsaiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangsaiTableView.delegate = self;
        _keqiangsaiTableView.dataSource = self;
        _keqiangsaiTableView.showsVerticalScrollIndicator = NO;
        _keqiangsaiTableView.showsHorizontalScrollIndicator = NO;
        _keqiangsaiTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangsaiTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangsaiheaderClicks)];
        [_keqiangsaiTableView.mj_header beginRefreshing];
    }
    return _keqiangsaiTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangsaiDataArr.count;
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
    keqingCell.keqnagMidol = self.keqiangsaiDataArr[indexPath.row];
    return keqingCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiangsaiDataArr[indexPath.row];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
}
-(void)keqiangsaiheaderClicks{
    MJWeakSelf;
    NSArray * keqiangboyData = [WHC_ModelSqlite query:[keqiangChangdiModel class]];
    NSMutableDictionary * keqiangboyParmter = [[NSMutableDictionary alloc]initWithDictionary:@{@"pageNumber":@"2",@"pageSize":@"10",@"searchBefore":@"true"}];
    [TTJZHttpTool getHttpRequestWithURL:@"http://121.36.193.131/api/v3.1/competition/compleague/GetListForPopular" Parameters:keqiangboyParmter Success:^(id  _Nonnull object) {
        if (weakSelf.keqiangsaiDataArr.count > 0) {
            [weakSelf.keqiangsaiDataArr removeAllObjects];
        }
        for (keqiangChangdiModel * kelinmdoe in keqiangboyData) {
            if (kelinmdoe.type != 1) {
                [self.keqiangsaiDataArr addObject:kelinmdoe];
            }
        }        [weakSelf.keqiangsaiTableView reloadData];
        [weakSelf.keqiangsaiTableView.mj_header endRefreshing];
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
        [weakSelf.keqiangsaiTableView.mj_header endRefreshing];
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
