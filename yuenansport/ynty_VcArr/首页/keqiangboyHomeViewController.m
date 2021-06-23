//
//  keqiangboyHomeViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyHomeViewController.h"
#import "yntySportHomeTableViewCell.h"
#import "keqianghomeboyHeaderView.h"
#import "keqiangsaishiBtn.h"
#import "keqiangsaishiListViewController.h"
#import <SobotKit/SobotKit.h>
#import "keqiangboyNewsListViewController.h"
#import "keqiangmyyuyueViewController.h"
#import "keqiangboymyRoomdViewController.h"
#import "keqiangboysaishiModle.h"
#import <QRCodeReaderViewController/QRCodeReaderViewController.h>
#import "keqiangboyRoomDetailViewController.h"
@interface keqiangboyHomeViewController ()<UITableViewDelegate,UITableViewDataSource,keqianghomeboyHeaderViewDelegate,keqiangboyHomeTableViewCellDelegate,QRCodeReaderDelegate>
@property(nonatomic,strong) UITableView *  keqiangboyHomeTableView;
@property(nonatomic,strong) NSMutableArray  * keqiangboyDataArr;
@property(nonatomic,strong) keqianghomeboyHeaderView * keqiangHeader;
@property(nonatomic,strong) QRCodeReaderViewController  * reader;

@end

@implementation keqiangboyHomeViewController
-(NSMutableArray *)keqiangboyDataArr{
    if (!_keqiangboyDataArr) {
        _keqiangboyDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangboyDataArr;
}
-(void)keqiangboyLoginsSucced{
    [self.keqiangboyHomeTableView.mj_header beginRefreshing];
}
-(void)keqiangboylogonout{
    [self.keqiangboyHomeTableView.mj_header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboyLoginsSucced) name:@"keqiangboyLoginsSucced" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keqiangboylogonout) name:@"keqiangboylogonout" object:nil];
    
    [self.view addSubview:self.keqiangboyHomeTableView];
    _keqiangboyHomeTableView.tableHeaderView = self.keqiangHeader;
    
    UILabel * keqiangsoureleftlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), 0, K(50), K(16))];
    keqiangsoureleftlb.textColor = LGDBLackColor;
    keqiangsoureleftlb.font = KBlFont(15);
    keqiangsoureleftlb.text = @"i体育";
    self.gk_navItemLeftSpace = K(15);
    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangsoureleftlb];
    
    
    UIView * keqiangrightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(40), K(40))];
    UIButton * keqiangrightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, K(10), K(15), K(15))];
    [keqiangrightBtn setBackgroundImage:[UIImage imageNamed:@"yntysaihdakg"] forState:UIControlStateNormal];
    [keqiangrightBtn addTarget:self action:@selector(keqiangrightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keqiangrightView addSubview:keqiangrightBtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqiangrightView];
    
    
    // Do any additional setup after loading the view.
}
-(void)keqiangrightBtnClick{
    
    NSArray *types = @[AVMetadataObjectTypeQRCode];
    _reader        = [QRCodeReaderViewController readerWithMetadataObjectTypes:types];
    _reader.delegate = self;
    MJWeakSelf;
    [_reader setCompletionWithBlock:^(NSString *resultAsString) {
        [weakSelf dismissViewControllerAnimated:YES completion:^{
            [LCProgressHUD showInfoMsg:@"稍后重试！"];
        }];
    }];
    [self presentViewController:_reader animated:YES completion:NULL];
    
}
#pragma mark - QRCodeReader Delegate Methods

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(keqianghomeboyHeaderView *)keqiangHeader{
    if (!_keqiangHeader) {
        _keqiangHeader = [[keqianghomeboyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(230))];
        _keqiangHeader.delegate = self;
    }
    return _keqiangHeader;
}
-(UITableView *)keqiangboyHomeTableView{
    if (!_keqiangboyHomeTableView) {
        _keqiangboyHomeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-kTabBarHeight-NaviH) style:UITableViewStylePlain];
        _keqiangboyHomeTableView.delegate = self;
        _keqiangboyHomeTableView.dataSource = self;
        _keqiangboyHomeTableView.showsVerticalScrollIndicator = NO;
        _keqiangboyHomeTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboyHomeTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyHomeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangboyHomeTableViewHeaderClicks)];
        [_keqiangboyHomeTableView.mj_header beginRefreshing];
    }
    return _keqiangboyHomeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangboyDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqianghomeIdentifer = @"yntySportHomeTableViewCell";
    yntySportHomeTableViewCell * keqiangCell = [tableView dequeueReusableCellWithIdentifier:keqianghomeIdentifer];
    if (keqiangCell == nil) {
        keqiangCell =[[yntySportHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqianghomeIdentifer];
    }
    keqiangCell.tag = indexPath.row;
    keqiangCell.delegate = self;
    keqiangCell.keqnagMidol =self.keqiangboyDataArr[indexPath.row];
    return keqiangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(40);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * keqingsectionHeader = [UIView new];
    keqingsectionHeader.backgroundColor = [UIColor whiteColor];
    UIImageView * keqiangiconImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(15), K(10), K(20), K(20))];
    keqiangiconImgView.image = [UIImage imageNamed:@"yntgdgashjg"];
    [keqingsectionHeader addSubview:keqiangiconImgView];
    
    UILabel * keqiangsectionTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(keqiangiconImgView.frame)+K(2), K(10), K(200), K(20))];
    keqiangsectionTitle.font =  KBlFont(16);
    keqiangsectionTitle.textColor = LGDBLackColor;
    keqiangsectionTitle.text = @"特价场地 Recommend";
    [keqingsectionHeader addSubview:keqiangsectionTitle];
    
    keqiangsaishiBtn * kebtn = [[keqiangsaishiBtn alloc]initWithFrame:CGRectMake(SCREEN_Width-K(85), K(12), K(70), K(15))];
    //    [kebtn addTarget:self action:@selector(keqingsectionHeaderClick) forControlEvents:UIControlEventTouchUpInside];
    //    [keqingsectionHeader addSubview:kebtn];
    return keqingsectionHeader;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(100);
}
-(void)keqiangboyHomeTableViewHeaderClicks{
    NSArray * keqiangboyData = [WHC_ModelSqlite query:[yntyHomeYundonModel class]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (keqiangboyData.count > 0) {
            self.keqiangboyDataArr  = [keqiangboyData subarrayWithRange:NSMakeRange(0, 4)].mutableCopy;
        }
        if (weakSelf.keqiangboyDataArr.count == 0) {
            [LCProgressHUD showInfoMsg:@"暂无推荐"];
            LYEmptyView * keqiangemtyview = [LYEmptyView emptyViewWithImage:[UIImage imageNamed:@"yntynotlogin"] titleStr:@"暂无推荐" detailStr:nil];
            weakSelf.keqiangboyHomeTableView.ly_emptyView = keqiangemtyview;
        }
        [weakSelf.keqiangboyHomeTableView reloadData];
        [weakSelf.keqiangboyHomeTableView.mj_header endRefreshing];
    });


    
    
}
#pragma mark--keqianghomeboyHeaderViewDelegate
-(void)keqianghomeboyHeaderViewDidbtnClicksWithIndex:(NSInteger)btnIndex{
    if (btnIndex == 0) {
        keqiangsaishiListViewController * keqianglistVc = [[keqiangsaishiListViewController alloc]init];
        keqianglistVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:keqianglistVc animated:YES];
    }else if (btnIndex == 1){
        keqiangboymyRoomdViewController * keqiangRoomVc = [[keqiangboymyRoomdViewController alloc]init];
        keqiangRoomVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:keqiangRoomVc animated:YES];
    }else if (btnIndex == 2){
        keqiangmyyuyueViewController * keqiangmyyueVc = [[keqiangmyyuyueViewController alloc]init];
        keqiangmyyueVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:keqiangmyyueVc animated:YES];
    }else if (btnIndex == 3){
        keqiangboyNewsListViewController * keqiangnewsVc = [[keqiangboyNewsListViewController alloc]init];
        keqiangnewsVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:keqiangnewsVc animated:YES];
    }else if (btnIndex == 4){
        ZCLibInitInfo * userInfo = [ZCLibClient getZCLibClient].libInitInfo;
        userInfo.partnerid  = @"3";
        userInfo.app_key = @"a3967ccf35bc49bcba61fe6c43765aa2";
        [ZCLibClient getZCLibClient].libInitInfo = userInfo;
        ZCKitInfo *uiInfo=[ZCKitInfo new];
        uiInfo.navcBarHidden = YES;
        uiInfo.isShowTansfer = YES;
        uiInfo.topBackTitle = @"在线客服";
        uiInfo.topViewBgColor = LGDMianColor;
        uiInfo.rightChatColor = [UIColor colorWithHexString:@"#E9AD79"];
        [[ZCLibClient getZCLibClient] setLibInitInfo:userInfo];
        [ZCSobot startZCChatVC:uiInfo with:self target:nil pageBlock:^(id object, ZCPageBlockType type) {
        } messageLinkClick:nil];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiangboyDataArr[indexPath.row];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
}
#pragma mark--keqiangboyHomeTableViewCellDelegate
-(void)keqiangboyHomeTableViewCellbtndidSeltecdWithCellindex:(NSInteger)CellIndex{
    keqiangboyRoomDetailViewController  * keqangboyDetailVc = [[keqiangboyRoomDetailViewController alloc]init];
    keqangboyDetailVc.keqnagMidol = self.keqiangboyDataArr[CellIndex];
    keqangboyDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqangboyDetailVc animated:YES];
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
