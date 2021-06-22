//
//  keqiangboyNewsListViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyNewsListViewController.h"
#import "keqiangboysNewsListDetailController.h"
#import "keqiangboysNewsListModel.h"
#import "keqiangboysNewsListTableViewCell.h"
@interface keqiangboyNewsListViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqiangboyNewsTableView;
@property(nonatomic,strong) NSMutableArray  * keqiangboyNewsDataArr;
@property(nonatomic,assign) int  index;
@end

@implementation keqiangboyNewsListViewController

-(NSMutableArray *)keqiangboyNewsDataArr{
    if (!_keqiangboyNewsDataArr) {
        _keqiangboyNewsDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangboyNewsDataArr ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"热门资讯";
    self.gk_navLineHidden =YES;
    self.index = 1;
    [self.view addSubview:self.keqiangboyNewsTableView];

    // Do any additional setup after loading the view.
}
-(UITableView *)keqiangboyNewsTableView{
    if (!_keqiangboyNewsTableView) {
        _keqiangboyNewsTableView =  [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height  ) style:UITableViewStylePlain];
        _keqiangboyNewsTableView.delegate = self;
        _keqiangboyNewsTableView.dataSource = self;
        _keqiangboyNewsTableView.showsVerticalScrollIndicator = NO;
        _keqiangboyNewsTableView.showsHorizontalScrollIndicator = NO;
        _keqiangboyNewsTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangboyNewsTableView.backgroundColor = [UIColor clearColor];
        _keqiangboyNewsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqaingboysNewsHeaderClicks)];
        [_keqiangboyNewsTableView.mj_header beginRefreshing];
        _keqiangboyNewsTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(keqiangboysNewsFooterClicks)];
        
    }
    return _keqiangboyNewsTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangboyNewsDataArr.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(120);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangboysNewsIdentifers = @"MaryNewsListTableViewCell";
    keqiangboysNewsListTableViewCell * keqiangboysNewsCell =[tableView dequeueReusableCellWithIdentifier:keqiangboysNewsIdentifers];
    if (keqiangboysNewsCell == nil) {
        keqiangboysNewsCell = [[keqiangboysNewsListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangboysNewsIdentifers];
    }
    keqiangboysNewsCell.keqiangboiysNewsItem = self.keqiangboyNewsDataArr[indexPath.row];
    return keqiangboysNewsCell;
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboysNewsListDetailController * keqiangNewsDetaik = [[keqiangboysNewsListDetailController alloc]init];
    keqiangNewsDetaik.hidesBottomBarWhenPushed = YES;
    keqiangNewsDetaik.keqiangboysItem =  self.keqiangboyNewsDataArr[indexPath.row];
    [self.navigationController pushViewController:keqiangNewsDetaik animated:YES];
}
-(void)keqaingboysNewsHeaderClicks{
    NSMutableDictionary * keqiangboysNewsParmters = [[NSMutableDictionary alloc]initWithDictionary:@{@"channel":@"体育",@"num":@"10",@"start":[NSString stringWithFormat:@"%d",self.index]}];
    MJWeakSelf;
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://jisunews.market.alicloudapi.com/news/get" Parameters:keqiangboysNewsParmters Success:^(id  _Nonnull object) {
        NSArray * keqaingboysNewDataArr =[[object objectForKey:@"result"]  objectForKey:@"list"];
        NSMutableArray * keqiangboiysNewTempArr= [[NSMutableArray alloc]init];
        for (NSDictionary * keqiangboysNewDics in keqaingboysNewDataArr) {
            keqiangboysNewsListModel * keqiangoysNewItem = [keqiangboysNewsListModel initwithdict:keqiangboysNewDics];
            [keqiangboiysNewTempArr addObject:keqiangoysNewItem];
        }
        weakSelf.keqiangboyNewsDataArr = keqiangboiysNewTempArr;
        [weakSelf.keqiangboyNewsTableView reloadData];
        [weakSelf.keqiangboyNewsTableView.mj_header endRefreshing];
    } Failure:^(id  _Nonnull fail) {
        [weakSelf.keqiangboyNewsTableView.mj_header endRefreshing];
        [LCProgressHUD showFailure:fail];
    }];
}
-(void)keqiangboysNewsFooterClicks{
    self.index +=1;
    NSMutableDictionary * keqiangboysNewsParmters = [[NSMutableDictionary alloc]initWithDictionary:@{@"channel":@"体育",@"num":@"10",@"start":[NSString stringWithFormat:@"%d",self.index]}];
    MJWeakSelf;
    [TTJZHttpTool NewpostHttpRequestWithURL:@"http://jisunews.market.alicloudapi.com/news/get" Parameters:keqiangboysNewsParmters Success:^(id  _Nonnull object) {
        NSArray * keqaingboysNewDataArr =[[object objectForKey:@"result"]  objectForKey:@"list"];
        NSMutableArray * keqiangboiysNewTempArr= [[NSMutableArray alloc]init];
        for (NSDictionary * keqiangboysNewDics in keqaingboysNewDataArr) {
            keqiangboysNewsListModel * keqiangoysNewItem = [keqiangboysNewsListModel initwithdict:keqiangboysNewDics];
            [keqiangboiysNewTempArr addObject:keqiangoysNewItem];
        }
        [weakSelf.keqiangboyNewsDataArr  addObjectsFromArray:[keqiangboiysNewTempArr copy]];
        [weakSelf.keqiangboyNewsTableView reloadData];
        [weakSelf.keqiangboyNewsTableView.mj_footer endRefreshing];
    } Failure:^(id  _Nonnull fail) {
        [weakSelf.keqiangboyNewsTableView.mj_footer endRefreshing];
        [LCProgressHUD showFailure:fail];
    }];
    
}


@end
