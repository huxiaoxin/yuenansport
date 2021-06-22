//
//  keqiangboyhangViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyhangViewController.h"
#import "keqiangboyhangqingTableViewCell.h"
#import "keqianghangSendingViewController.h"
#import "keqainggboyComentViewController.h"
#import "keqiangboyHangqingModel.h"
#import "keqaingboysjubaoController.h"
@interface keqiangboyhangViewController ()<UITableViewDelegate,UITableViewDataSource,keqiangboyhangqingTableViewCellDelegate>
@property(nonatomic,strong) UITableView * keqiangboyHangTableView;
@property(nonatomic,strong) NSMutableArray * keqiangdataArr;
@end

@implementation keqiangboyhangViewController
-(void)keqiangboyLoginsSucced{
    [self.keqiangboyHangTableView.mj_header beginRefreshing];
}
-(void)keqiangboylogonout{
    [self.keqiangboyHangTableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboyLoginsSucced) name:@"keqiangboyLoginsSucced" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboylogonout) name:@"keqiangboylogonout" object:nil];

    UILabel * keqiangsoureleftlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), 0, K(50), K(16))];
    keqiangsoureleftlb.textColor = LGDBLackColor;
    keqiangsoureleftlb.font = KBlFont(15);
    keqiangsoureleftlb.text = @"圈子";
    self.gk_navItemLeftSpace = K(15);
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangsoureleftlb];
    
    
    UIView * keqiangrightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
    UIButton * keqiangrightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(10), K(15), K(15))];
    [keqiangrightBtn setBackgroundImage:[UIImage imageNamed:@"icon-"] forState:UIControlStateNormal];
    [keqiangrightBtn addTarget:self action:@selector(keqiangrightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangrightView addSubview:keqiangrightBtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangrightView];
    
    [self.view addSubview:self.keqiangboyHangTableView];
}
-(UITableView *)keqiangboyHangTableView{
    if (!_keqiangboyHangTableView) {
        _keqiangboyHangTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _keqiangboyHangTableView.delegate = self;
        _keqiangboyHangTableView.dataSource = self;
        _keqiangboyHangTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboyHangTableView.showsVerticalScrollIndicator = NO;
        _keqiangboyHangTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyHangTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangsboyHeaderClicks)];
        [_keqiangboyHangTableView.mj_header  beginRefreshing];
    }
    return _keqiangboyHangTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangdataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangboyIdentifer = @"keqiangboyhangqingTableViewCell";
    keqiangboyhangqingTableViewCell * keqiangCell = [tableView dequeueReusableCellWithIdentifier:keqiangboyIdentifer];
    if (keqiangCell == nil) {
        keqiangCell = [[keqiangboyhangqingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangboyIdentifer];
    }
    keqiangCell.tag = indexPath.row;
    keqiangCell.delegate = self;
    keqiangCell.keqiangModel  = self.keqiangdataArr[indexPath.row];
    return keqiangCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqainggboyComentViewController * keqangboyVc  = [[keqainggboyComentViewController alloc]init];
    keqangboyVc.hidesBottomBarWhenPushed = YES;
    keqangboyVc.keqiangModel = self.keqiangdataArr[indexPath.row];
    [self.navigationController pushViewController:keqangboyVc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyHangqingModel * keqiangModel = self.keqiangdataArr[indexPath.row];
    return keqiangModel.Cellheight;
}
-(void)keqiangsboyHeaderClicks{
    MJWeakSelf;
    NSArray * keqiangDataArr=  [WHC_ModelSqlite query:[keqiangboyHangqingModel class]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.keqiangdataArr.count > 0) {
            [weakSelf.keqiangdataArr removeAllObjects];
        }
        weakSelf.keqiangdataArr = keqiangDataArr.mutableCopy;
        if (weakSelf.keqiangdataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"书籍异常"];
            LYEmptyView * keqiangemtyview = [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@"weidenglu"] titleStr:@"暂无数据" detailStr:nil];
            weakSelf.keqiangboyHangTableView.ly_emptyView = keqiangemtyview;
        }
        [weakSelf.keqiangboyHangTableView reloadData];
        [weakSelf.keqiangboyHangTableView.mj_header endRefreshing];
    });
}
#pragma mark--keqiangboyhangqingTableViewCellDelegate
-(void)keqiangboyhangqingTableViewCellWithBtnIndex:(NSInteger)btnIndex CellIndexed:(NSInteger)Cellindex{
    keqiangboyHangqingModel * kemdoel = self.keqiangdataArr[Cellindex];
    if (btnIndex == 0) {
        keqainggboyComentViewController * keqangboyVc  = [[keqainggboyComentViewController alloc]init];
        keqangboyVc.hidesBottomBarWhenPushed = YES;
        keqangboyVc.keqiangModel = kemdoel;
        [self.navigationController pushViewController:keqangboyVc animated:YES];
    }else if (btnIndex == 1){
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if (![keqiangboyState isEqualToString:@"1"]) {
        [self keqiangboyShowloginVc];
        return;
    }

        [LCProgressHUD showLoading:@""];
        MJWeakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            kemdoel.isZan  = !kemdoel.isZan;
            if (kemdoel.isZan) {
                kemdoel.zanNum +=1;
            }else{
                kemdoel.zanNum -=1;
            }
            [WHC_ModelSqlite update:[keqiangboyHangqingModel class] value:[NSString stringWithFormat:@"zanNum = '%ld'",kemdoel.zanNum] where:[NSString stringWithFormat:@"contentID = '%ld'",kemdoel.contentID]];
            [WHC_ModelSqlite update:[keqiangboyHangqingModel class] value:[NSString stringWithFormat:@"isZan = '%@'",@(kemdoel.isZan)] where:[NSString stringWithFormat:@"contentID = '%ld'",kemdoel.contentID]];
            [LCProgressHUD showSuccess:kemdoel.isZan ? @"点赞成功" : @"取消点赞"];
            [weakSelf.keqiangboyHangTableView reloadData];
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
                [weakSelf.keqiangboyHangTableView.mj_header beginRefreshing];
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

-(void)keqiangrightBtnClick{
    keqianghangSendingViewController * keqingboyVc = [[keqianghangSendingViewController alloc]init];
    keqingboyVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqingboyVc animated:YES];
}
//2c2c2c
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
