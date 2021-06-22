#import "keqiangboysystemmsgViewController.h"
#import "keqiangboymsgDetailController.h"
#import "keqangboymsgTbaleviewCell.h"
@interface keqiangboysystemmsgViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * MaryThreeMgsTbaleView;
@property(nonatomic,strong) NSMutableArray  * MaryThreeMgsDataArr;
@property(nonatomic,assign) BOOL MaryThree;
@end
@implementation keqiangboysystemmsgViewController
-(NSMutableArray *)MaryThreeMgsDataArr{
    if (!_MaryThreeMgsDataArr) {
        _MaryThreeMgsDataArr = [[NSMutableArray alloc]initWithArray:@[@{@"title":@"关于09月25日A8体育系统维护公告",@"issystem":@"1",@"cotent":@"尊敬用户，您好！\n因服务器升级需要，A8体育将于2020年09月15日进行停机更新服务，大概需要两个小时，届时出现无法使用的情况，请稍安勿躁，静静的等待就可以了，感谢各位的大力支持！",@"img":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599124455491&di=4a3a1d358ce0bfed1aab6463fae50eab&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171221%2Fc02c60287cc3469ab8440155f6813f56.jpeg",@"time":@"2020-09-21"}]];
    }
    return _MaryThreeMgsDataArr;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.MaryThree = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    self.gk_navTitle = @"系统通知";
    [self.view addSubview:self.MaryThreeMgsTbaleView];
}
- (UITableView *)MaryThreeMgsTbaleView{
    if (!_MaryThreeMgsTbaleView) {
        _MaryThreeMgsTbaleView =[[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _MaryThreeMgsTbaleView.backgroundColor =[UIColor colorWithHexString:@"#EEEEEE"]; _MaryThreeMgsTbaleView.delegate = self;
        _MaryThreeMgsTbaleView.dataSource =self;
        _MaryThreeMgsTbaleView.showsVerticalScrollIndicator =NO;
        _MaryThreeMgsTbaleView.showsHorizontalScrollIndicator = NO;
        _MaryThreeMgsTbaleView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _MaryThreeMgsTbaleView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(MaryThreeMgsDataHeaderCLicks)];
        [_MaryThreeMgsTbaleView.mj_header beginRefreshing];
    }
    return _MaryThreeMgsTbaleView;
}
-(void)MaryThreeMgsDataHeaderCLicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.MaryThree = YES;
        [weakSelf.MaryThreeMgsTbaleView reloadData];
        [weakSelf.MaryThreeMgsTbaleView.mj_header endRefreshing];
    });
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.MaryThree ? self.MaryThreeMgsDataArr.count : 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(160);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * MaryThreeMgsDataHeaderIdentifer  =@"keqangboymsgTbaleviewCell";
    keqangboymsgTbaleviewCell * MaryThreeMgsDataHeaderCell = [tableView dequeueReusableCellWithIdentifier:MaryThreeMgsDataHeaderIdentifer];
    if (MaryThreeMgsDataHeaderCell == nil) {
        MaryThreeMgsDataHeaderCell = [[keqangboymsgTbaleviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MaryThreeMgsDataHeaderIdentifer];
    }
    MaryThreeMgsDataHeaderCell.keqiangboyDic= self.MaryThreeMgsDataArr[indexPath.row];
    return MaryThreeMgsDataHeaderCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboymsgDetailController * MaryThreeMgsDetailVc =[[keqiangboymsgDetailController alloc]init];
    MaryThreeMgsDetailVc.keqiangboydDics = self.MaryThreeMgsDataArr[indexPath.row]; [self.navigationController pushViewController:MaryThreeMgsDetailVc animated:YES];
}
@end







