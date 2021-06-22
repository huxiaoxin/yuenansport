//
//  keqainggboyComentViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqainggboyComentViewController.h"
#import "keqiangboyhangqingTableViewCell.h"
#import "keqiangboyComentListTableViewCell.h"
#import "keqiangboyDetailComenrModle.h"
#import "keqaingboysjubaoController.h"
@interface keqainggboyComentViewController ()<UITableViewDelegate,UITableViewDataSource,keqiangboyComentListTableViewCellDelegate,keqiangboyhangqingTableViewCellDelegate>
@property(nonatomic,strong) UITableView * keqiangboCoemntTableView;
@property(nonatomic,strong) NSMutableArray * keqiangComentDataArr;
@end

@implementation keqainggboyComentViewController
-(NSMutableArray *)keqiangComentDataArr{
    if (!_keqiangComentDataArr) {
        _keqiangComentDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangComentDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"详情";
    [self.view addSubview:self.keqiangboCoemntTableView];
    UIButton * keqiangboybtns = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(44), SCREEN_Width, K(44))];
    [keqiangboybtns setBackgroundColor:LGDMianColor];
    keqiangboybtns.titleLabel.textAlignment = NSTextAlignmentCenter;
    keqiangboybtns.titleLabel.font = KBlFont(15);
    [keqiangboybtns addTarget:self action:@selector(keqiangboybtnsClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangboybtns setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [keqiangboybtns setTitle:@"我要点评" forState:UIControlStateNormal];
    [keqiangboybtns setBackgroundImage:[UIImage imageNamed:@"评论框"] forState:UIControlStateNormal];
    [self.view addSubview:keqiangboybtns];
    
}
-(void)keqiangboybtnsClick{
    
}
-(UITableView *)keqiangboCoemntTableView{
    if (!_keqiangboCoemntTableView) {
        _keqiangboCoemntTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-K(44)) style:UITableViewStylePlain];
        _keqiangboCoemntTableView.delegate = self;
        _keqiangboCoemntTableView.dataSource = self;
        _keqiangboCoemntTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboCoemntTableView.showsVerticalScrollIndicator  =NO;
        _keqiangboCoemntTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboCoemntTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangComentHeaderClciks)];
        [_keqiangboCoemntTableView.mj_header beginRefreshing];
    }
    return _keqiangboCoemntTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.keqiangComentDataArr.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString * keqiangboyIdentifer = @"keqiangboyhangqingTableViewCell";
        keqiangboyhangqingTableViewCell * keqiangCell = [tableView dequeueReusableCellWithIdentifier:keqiangboyIdentifer];
        if (keqiangCell == nil) {
            keqiangCell = [[keqiangboyhangqingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangboyIdentifer];
        }
        keqiangCell.keqiangModel = self.keqiangModel;
        keqiangCell.tag = indexPath.row;
        keqiangCell.delegate = self;
        return keqiangCell;
    }else{
        static NSString  * keqiangsqngComentIdentifer = @"keqiangboyComentListTableViewCell";
        keqiangboyComentListTableViewCell * keqiangCells = [tableView dequeueReusableCellWithIdentifier:keqiangsqngComentIdentifer];
        if (keqiangCells == nil) {
            keqiangCells = [[keqiangboyComentListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangsqngComentIdentifer];
        }
        keqiangCells.tag = indexPath.row;
        keqiangCells.delegate = self;
        keqiangCells.keqiangModel = self.keqiangComentDataArr[indexPath.row];
        return keqiangCells;;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return self.keqiangModel.Cellheight;
    }else{
        keqiangboyDetailComenrModle * keqiangModel = self.keqiangComentDataArr[indexPath.row];
        return keqiangModel.Cellheight;
        
    }
    return K(0);
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return K(40);
    }
    return K(0);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * gaoxiangqingHeader = [UIView new];
    gaoxiangqingHeader.backgroundColor = [UIColor whiteColor];
    
    UIImageView * gaoxiamView = [[UIImageView alloc]initWithFrame:CGRectMake(K(16), K(11.25), K(6), K(18.5))];
    gaoxiamView.backgroundColor = LGDMianColor;
    gaoxiamView.image = [UIImage imageNamed:@"精选兼职指示器"];
    [gaoxiangqingHeader addSubview:gaoxiamView];
    
    
    UILabel * gaoxiangqinglb =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(gaoxiamView.frame)+K(5), K(11.25), K(200), K(18.5))];
    gaoxiangqinglb.textColor = LGDBLackColor;
    gaoxiangqinglb.font = KBlFont(15);
    gaoxiangqinglb.text = @"圈友评价";
    [gaoxiangqingHeader addSubview:gaoxiangqinglb];
    
    return gaoxiangqingHeader;;
}

#pragma mark--gaoxiangqingComentTableViewCellDelegate
-(void)keqiangboyComentListTableViewCellDelegateWithCellIndex:(NSInteger)CellIndex keqiangboybtnActionIndex:(NSInteger)btnIndex{
    keqiangboyDetailComenrModle * keiqnhModels = self.keqiangComentDataArr[CellIndex];
    if (btnIndex == 0) {
        //拉黑
        [LCProgressHUD showLoading:@""];
        MJWeakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LCProgressHUD showSuccess:@"拉黑成功"];
            [WHC_ModelSqlite delete:[keqiangboyDetailComenrModle class] where:[NSString stringWithFormat:@"header ='%@'",keiqnhModels.header]];
            [weakSelf.keqiangboCoemntTableView.mj_header beginRefreshing];
        });
    }else if (btnIndex == 1){
        keqaingboysjubaoController * keqianhgVcs = [[keqaingboysjubaoController alloc]init];
        keqianhgVcs.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:keqianhgVcs animated:YES];
        
    }else if (btnIndex == 2){
        //点赞
        [LCProgressHUD showLoading:@""];
        MJWeakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            keiqnhModels.isZan  = !keiqnhModels.isZan;
            [WHC_ModelSqlite update:[keqiangboyDetailComenrModle class] value:[NSString stringWithFormat:@"isZan =%@",@(keiqnhModels.isZan)] where:[NSString stringWithFormat:@"contetn = '%@'",keiqnhModels.contetn]];
            [LCProgressHUD showSuccess:keiqnhModels.isZan ? @"点赞成功" : @"取消点赞"];
            [weakSelf.keqiangboCoemntTableView reloadData];
        });
        
    }
    
}
#pragma mark--keqiangboyhangqingTableViewCellDelegate
-(void)keqiangboyhangqingTableViewCellWithBtnIndex:(NSInteger)btnIndex CellIndexed:(NSInteger)Cellindex{
    keqiangboyHangqingModel * kemdoel = self.keqiangModel;
    if (btnIndex == 0) {
       
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
            [weakSelf.keqiangboCoemntTableView reloadData];
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
                [LCProgressHUD showSuccess:@"拉黑成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
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

-(void)keqiangComentHeaderClciks{
    MJWeakSelf;
    NSArray * keqiangbouData =[WHC_ModelSqlite query:[keqiangboyDetailComenrModle class]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.keqiangComentDataArr.count > 0) {
            [weakSelf.keqiangComentDataArr removeAllObjects];
        }
        for (keqiangboyDetailComenrModle * keqiangModle in keqiangbouData) {
            if (keqiangModle.ContentID == self.keqiangModel.contentID) {
                [weakSelf.keqiangComentDataArr addObject:keqiangModle];
            }
        }
        if (weakSelf.keqiangComentDataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"暂无评论"];
        }
        [weakSelf.keqiangboCoemntTableView reloadData];
        [weakSelf.keqiangboCoemntTableView.mj_header endRefreshing];
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
