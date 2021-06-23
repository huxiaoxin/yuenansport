//
//  keqiangdongtaiiViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangdongtaiiViewController.h"
#import "keqiangboyhangqingTableViewCell.h"
#import "keqainggboyComentViewController.h"
#import "keqaingboysjubaoController.h"
@interface keqiangdongtaiiViewController ()<UITableViewDelegate,UITableViewDataSource,keqiangboyhangqingTableViewCellDelegate>
@property(nonatomic,strong) UITableView * keqiangdongtaiTableView;
@property(nonatomic,strong) NSMutableArray * keqiangongtiDataArr;
@end

@implementation keqiangdongtaiiViewController

-(NSMutableArray *)keqiangongtiDataArr{
    if (!_keqiangongtiDataArr) {
        _keqiangongtiDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangongtiDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的动态";
    [self.view addSubview:self.keqiangdongtaiTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)keqiangdongtaiTableView{
    if (!_keqiangdongtaiTableView) {
        _keqiangdongtaiTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangdongtaiTableView.delegate = self;
        _keqiangdongtaiTableView.dataSource = self;
        _keqiangdongtaiTableView.showsVerticalScrollIndicator = NO;
        _keqiangdongtaiTableView.showsHorizontalScrollIndicator = NO;
        _keqiangdongtaiTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangdongtaiTableView.backgroundColor = [UIColor whiteColor];
        _keqiangdongtaiTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangboydongtaiHeaderClicks)];
        [_keqiangdongtaiTableView.mj_header beginRefreshing];
        
    }
    return _keqiangdongtaiTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangongtiDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangboyIdentifer = @"keqiangboyhangqingTableViewCell";
    keqiangboyhangqingTableViewCell * keqiangCell = [tableView dequeueReusableCellWithIdentifier:keqiangboyIdentifer];
    if (keqiangCell == nil) {
        keqiangCell = [[keqiangboyhangqingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangboyIdentifer];
    }
    keqiangCell.tag = indexPath.row;
    keqiangCell.delegate = self;
    keqiangCell.keqiangModel = self.keqiangongtiDataArr[indexPath.row];
    return keqiangCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqainggboyComentViewController * keqangboyVc  = [[keqainggboyComentViewController alloc]init];
    keqangboyVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyVc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyHangqingModel * keqangModel = self.keqiangongtiDataArr[indexPath.row];
    return keqangModel.Cellheight;
}
#pragma mark--keqiangboyhangqingTableViewCellDelegate
-(void)keqiangboyhangqingTableViewCellWithBtnIndex:(NSInteger)btnIndex CellIndexed:(NSInteger)Cellindex{
    keqiangboyHangqingModel * kemdoel = self.keqiangongtiDataArr[Cellindex];
    if (btnIndex == 0) {
        keqainggboyComentViewController * keqangboyVc  = [[keqainggboyComentViewController alloc]init];
        keqangboyVc.hidesBottomBarWhenPushed = YES;
        keqangboyVc.keqiangModel = kemdoel;
        [self.navigationController pushViewController:keqangboyVc animated:YES];
    }else if (btnIndex == 1){
        
        [LCProgressHUD showLoading:@""];
        MJWeakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            kemdoel.isZan  = !kemdoel.isZan;
            if (kemdoel.isZan) {
                kemdoel.zanNum +=1;
            }else{
                kemdoel.zanNum -=1;
            }
            [WHC_ModelSqlite update:[keqiangboyHangqingModel class] value:[NSString stringWithFormat:@"zanNum =%ld",kemdoel.zanNum] where:[NSString stringWithFormat:@"contentID = '%ld'",kemdoel.contentID]];
            [WHC_ModelSqlite update:[keqiangboyHangqingModel class] value:[NSString stringWithFormat:@"isZan =%@",@(kemdoel.isZan)] where:[NSString stringWithFormat:@"contentID = '%ld'",kemdoel.contentID]];
            [LCProgressHUD showSuccess:kemdoel.isZan ? @"点赞成功" : @"取消点赞"];
            [weakSelf.keqiangdongtaiTableView reloadData];
        });
        
    }else{
        UIAlertController  * keqiagalteVc = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        MJWeakSelf;
        UIAlertAction * keqiangboyjubaoAciton = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            keqaingboysjubaoController * keqiangjubaoVc = [[keqaingboysjubaoController alloc]init];
            keqiangjubaoVc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:keqiangjubaoVc animated:YES];
        }];
        
        UIAlertAction * keqiangboylaheiAciton = [UIAlertAction actionWithTitle:@"拉黑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [LCProgressHUD showLoading:@""];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [WHC_ModelSqlite delete:[keqiangboyHangqingModel class] where:[NSString stringWithFormat:@"contentID ='%ld'",kemdoel.contentID]];
                [weakSelf.keqiangdongtaiTableView.mj_header beginRefreshing];
                [LCProgressHUD showSuccess:@"拉黑成功"];
            });
            
        }];
        UIAlertAction * keqiangboycancleAciton = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [keqiagalteVc addAction:keqiangboyjubaoAciton];
        [keqiagalteVc addAction:keqiangboylaheiAciton];
        [keqiagalteVc addAction:keqiangboycancleAciton];
        [self presentViewController:keqiagalteVc animated:YES completion:^{
            
        }];
        
    }
}

-(void)keqiangboydongtaiHeaderClicks{
    MJWeakSelf;
    NSArray * keqiangData  = [WHC_ModelSqlite query:[keqiangboyHangqingModel class]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.keqiangongtiDataArr.count > 0) {
            [weakSelf.keqiangongtiDataArr removeAllObjects];
        }
        for (keqiangboyHangqingModel * keqiangModel in keqiangData) {
            if (keqiangModel.contentID == 4) {
                [weakSelf.keqiangongtiDataArr addObject:keqiangModel];
            }
        }
        if (weakSelf.keqiangongtiDataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"暂无数据"];
            LYEmptyView * keqiangemView = [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@""] titleStr:@"暂无数据" detailStr:nil];
            weakSelf.keqiangdongtaiTableView.ly_emptyView = keqiangemView;
        }
        [weakSelf.keqiangdongtaiTableView reloadData];
        [weakSelf.keqiangdongtaiTableView.mj_header endRefreshing];
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
