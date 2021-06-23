//
//  keqiangmyyuyueViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangmyyuyueViewController.h"
#import "keqiangmyyuyeTableViewCell.h"
#import "keqiangboyVideomModel.h"
#import <AVKit/AVKit.h>
@interface keqiangmyyuyueViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * keqangmyYuyueTableView;
@property(nonatomic,strong) NSMutableArray * keqiangmyDataArr;
@property(nonatomic,strong) NSMutableArray * keqiangboyImgArr;
@property(nonatomic,strong) NSMutableArray * keqianVideoData;
@end

@implementation keqiangmyyuyueViewController
-(NSMutableArray *)keqianVideoData{
    if (!_keqianVideoData) {
        _keqianVideoData = [[NSMutableArray alloc]initWithArray:@[@"http://video.xuchenhb.com/【湖人vs掘金G3】第四节英文原声录像.mp4",@"http://video.xuchenhb.com/【湖人vs掘金G3】第三节英文原声录像.mp4",@"http://video.xuchenhb.com/【湖人vs掘金G3】第二节国语解说录像，湖人56_63掘金.mp4",@"http://video.xuchenhb.com/【湖人vs掘金G3】第一节英文原声录像.mp4",@"http://video.xuchenhb.com/NBA西部决赛湖人VS掘金G2%20第二节录像回放（中文）-2020.09.21.mp4",@"http://video.xuchenhb.com/NBA西部决赛湖人VS掘金G2%20第四节录像回放（中文）-2020.09.21.mp4"]];
    }
    return _keqianVideoData;
}
-(NSMutableArray *)keqiangboyImgArr{
    if (!_keqiangboyImgArr) {
        _keqiangboyImgArr = [[NSMutableArray alloc]initWithArray:@[@"http://filemain.qiuzhang.com/newsinfo-a2c7ea39-93bb-4c90-a76f-838a3a548749.jpg?sign=75c57e88e30daf2ad6945957af664bde&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x",@"http://filemain.qiuzhang.com/newsinfo-c6569d15-ddbd-4397-b335-fd348f9bcdfa.jpg?sign=df1ad8457be089ecb5ce9e52128004c9&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x",@"http://filemain.qiuzhang.com/newsinfo-fb0d3207-9674-494e-beee-1ec40cab97c9.jpg?sign=eb086d82f49c724aa08319820b6f73b2&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x",@"http://filemain.qiuzhang.com/newsinfo-320f8e90-4785-4fd5-b952-c02f2d016c0b.jpg?sign=578eb33efb69b46072679dfdec1b5340&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x",@"http://filemain.qiuzhang.com/shortvideo-1e62bd8f-b5a1-4901-a507-884f4d070184.jpg?sign=cc251ba81a100d38a18794a791125b2e&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x",@"http://filemain.qiuzhang.com/shortvideo-5d2b8093-faeb-401d-9954-f8022f760804.jpg?sign=fe3a70d31661467f0169249ca7994f9f&t=5f774e80&imageMogr2/auto-orient/thumbnail/200x"]];
    }
    return _keqiangboyImgArr;
}
-(NSMutableArray *)keqiangmyDataArr{
    if (!_keqiangmyDataArr) {
        _keqiangmyDataArr = [[NSMutableArray alloc]init];
    }
    return _keqiangmyDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"视频集锦";
    [self.view addSubview:self.keqangmyYuyueTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *)keqangmyYuyueTableView{
    if (!_keqangmyYuyueTableView) {
        _keqangmyYuyueTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqangmyYuyueTableView.delegate = self;
        _keqangmyYuyueTableView.dataSource = self;
        _keqangmyYuyueTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqangmyYuyueTableView.showsVerticalScrollIndicator = NO;
        _keqangmyYuyueTableView.showsHorizontalScrollIndicator = NO;
        _keqangmyYuyueTableView.backgroundColor = [UIColor whiteColor];
        _keqangmyYuyueTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(keqiangmyyueheaderClicks)];
        [_keqangmyYuyueTableView.mj_header beginRefreshing];
    }
    return _keqangmyYuyueTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangmyDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangvboyIdentifer = @"keqiangmyyuyeTableViewCell";
    keqiangmyyuyeTableViewCell * keqiangCell = [tableView dequeueReusableCellWithIdentifier:keqiangvboyIdentifer];
    if (keqiangCell == nil) {
        keqiangCell = [[keqiangmyyuyeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangvboyIdentifer];
    }
    keqiangCell.keqoangImgArr = self.keqiangboyImgArr[indexPath.row];
    keqiangCell.keqoangModle = self.keqiangmyDataArr[indexPath.row];
    return keqiangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(120);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * urlStr = self.keqianVideoData[indexPath.row];
    NSString   * selurlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:selurlStr];
    AVPlayerViewController * avplyer = [[AVPlayerViewController alloc]init];
    avplyer.player = [[AVPlayer alloc]initWithURL:url];
    [self presentViewController:avplyer animated:YES completion:nil];
}
-(void)keqiangmyyueheaderClicks{
    MJWeakSelf;
    NSMutableDictionary * keqiangboyPrmter = [[NSMutableDictionary alloc]initWithDictionary:@{@"pageNumber":@"1",@"pageSize":@"6",@"userId":@"5f6a9f7a17aec047783328a2"}];
    [TTJZHttpTool getHttpRequestWithURL:@"http://121.36.193.131/api/v3.1/Video/VideoInfo/GetVideoInfoList" Parameters:keqiangboyPrmter Success:^(id  _Nonnull object) {
        NSArray * keqangData = [[object objectForKey:@"result"] objectForKey:@"result"];
        if (weakSelf.keqiangmyDataArr.count > 0) {
            [weakSelf.keqiangmyDataArr removeAllObjects];
        }
        for (NSDictionary * keqiangdic in keqangData) {
            keqiangboyVideomModel * keqinMoel = [keqiangboyVideomModel initwithdict:keqiangdic];
            [weakSelf.keqiangmyDataArr addObject:keqinMoel];
        }
        [weakSelf.keqangmyYuyueTableView reloadData];
        [weakSelf.keqangmyYuyueTableView.mj_header endRefreshing];
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
        [weakSelf.keqangmyYuyueTableView.mj_header endRefreshing];
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
