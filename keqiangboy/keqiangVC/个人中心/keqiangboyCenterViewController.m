//
//  keqiangboyCenterViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyCenterViewController.h"
#import "keqiangboyCenterTableViewCell.h"
#import "keqiangboyCenterHeaderView.h"
#import "keqiangboyaboutusViewController.h"
#import "keqiangboysSugestionViewController.h"
#import "keqiangdongtaiiViewController.h"
#import "keqiannyuyueViewController.h"
#import "keqiangboyInfosViewController.h"
@interface keqiangboyCenterViewController ()<UITableViewDelegate,UITableViewDataSource,keqiangboyCenterHeaderViewDelegaet>
@property(nonatomic,strong) UITableView * keqiangboyCenterTableView;
@property(nonatomic,strong) NSMutableArray * keqiangboyDataArr;
@property(nonatomic,strong) keqiangboyCenterHeaderView * keqangHeader;
@property(nonatomic,strong) UIButton * keqiangboyFooterBtn;
@property(nonatomic,strong) NSMutableArray * keqiangImgDataArr;
@end

@implementation keqiangboyCenterViewController
-(NSMutableArray *)keqiangImgDataArr{
    if (!_keqiangImgDataArr) {
        _keqiangImgDataArr = [[NSMutableArray alloc]initWithArray:@[@[@"dongtaizhuanhuan",@"yuyue"],@[@"yijianfankui",@"guanyuwomen",@"xiugaimima",@"lianxiwomen"]]];
    }
    return _keqiangImgDataArr;
}
-(NSMutableArray *)keqiangboyDataArr{
    if (!_keqiangboyDataArr) {
        _keqiangboyDataArr = [[NSMutableArray alloc]initWithArray:@[@[@"动态",@"预约"],@[@"意见反馈",@"关于我们",@"清除缓存",@"联系我们"]]];
    }
    return _keqiangboyDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //动态  预约 课程
    self.gk_navigationBar.hidden = YES;
    [self.view addSubview:self.keqiangboyCenterTableView];
    _keqiangboyCenterTableView.tableHeaderView = self.keqangHeader;
    
    UIView * keiqangboyFootersView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(100))];
    
    UIButton * keqiangboyFooterBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(25), K(50), SCREEN_Width-K(50), K(45))];
    [keqiangboyFooterBtn setBackgroundColor:LGDMianColor];
    keqiangboyFooterBtn.layer.cornerRadius = K(5);
    keqiangboyFooterBtn.layer.masksToBounds = YES;
    [keqiangboyFooterBtn setTitle:@"退出" forState:UIControlStateNormal];
    keqiangboyFooterBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [keqiangboyFooterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    keqiangboyFooterBtn.titleLabel.font = KBlFont(15);
    [keqiangboyFooterBtn addTarget:self action:@selector(keqiangboyFooterBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [keiqangboyFootersView addSubview:keqiangboyFooterBtn];
    _keqiangboyFooterBtn = keqiangboyFooterBtn;
    _keqiangboyCenterTableView.tableFooterView = keiqangboyFootersView;
    // Do any additional setup after loading the view.
}
-(keqiangboyCenterHeaderView *)keqangHeader{
    if (!_keqangHeader) {
        _keqangHeader = [[keqiangboyCenterHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(180))];
        _keqangHeader.delegate = self;
    }
    return _keqangHeader;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * keqiangboyData  = self.keqiangboyDataArr[section];
    return keqiangboyData.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.keqiangboyDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * keqiangbotCenterIdentifer = @"keqiangboyCenterTableViewCell";
    keqiangboyCenterTableViewCell * keqiangBoyCell = [tableView dequeueReusableCellWithIdentifier:keqiangbotCenterIdentifer];
    if (keqiangBoyCell == nil) {
        keqiangBoyCell = [[keqiangboyCenterTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keqiangbotCenterIdentifer];
    }
    if (indexPath.section == 1) {
        if (indexPath.row ==2) {
            keqiangBoyCell.keqiangboyRghtlb.text = [NSString stringWithFormat:@"%.2fM",[self keqiangCenterMemorySizes]];
        }else if (indexPath.row == 3){
            keqiangBoyCell.keqiangboyRghtlb.text = @"0571-6784756";
        }else{
            keqiangBoyCell.keqiangboyRghtlb.text = @"";
        }
    }else{
        keqiangBoyCell.keqiangboyRghtlb.text = @"";
    }
    keqiangBoyCell.imgStr = self.keqiangImgDataArr[indexPath.section][indexPath.row];
    keqiangBoyCell.keqiangbotText = self.keqiangboyDataArr[indexPath.section][indexPath.row];
    return keqiangBoyCell;
}
- (CGFloat)keqiangCenterMemorySizes{
    CGFloat keqiangCenterMemorySizes = 0.0;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for(NSString *path in files) {
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        keqiangCenterMemorySizes += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    CGFloat sizeM = keqiangCenterMemorySizes /1024.0/1024.0;
    
    return sizeM;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
        if (![keqiangboyState isEqualToString:@"1"]) {
            [self keqiangboyShowloginVc];
            return;
        }

        if (indexPath.row == 0) {
            keqiangdongtaiiViewController * keqingdonfraVc =[[keqiangdongtaiiViewController alloc]init];
            keqingdonfraVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:keqingdonfraVc animated:YES];
        }else if (indexPath.row == 1){
            keqiannyuyueViewController * keqinyueVc = [[keqiannyuyueViewController alloc]init];
            keqinyueVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:keqinyueVc animated:YES];
        }
        
    }else{
        if (indexPath.row == 0) {
            keqiangboysSugestionViewController * keqiangboyVcs = [[keqiangboysSugestionViewController alloc]init];
            keqiangboyVcs.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:keqiangboyVcs animated:YES];
        }else if (indexPath.row == 1){
            keqiangboyaboutusViewController * keqiangboyVc = [keqiangboyaboutusViewController alloc];
            keqiangboyVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:keqiangboyVc animated:YES];
        }else if (indexPath.row == 2){
            [self keqiangboysClearCenterMemorySizes];
        }else if (indexPath.row == 3){
            NSURL *keiqnboysAboutUrl = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"0571-6739457"]];
            [[UIApplication sharedApplication] openURL:keiqnboysAboutUrl];
        }
    }
}
- (void)keqiangboysClearCenterMemorySizes{
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    for(NSString *p in files){
        NSError*error;
        
        NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path])
        {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                [LCProgressHUD showSuccess:@"清除成功"];
                [self.keqiangboyCenterTableView reloadData];
            }else{
                
            }
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(10);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * keqiangboyHeader= [UIView new];
    keqiangboyHeader.backgroundColor = LGDLightGaryColor;
    return keqiangboyHeader;
}
-(UITableView *)keqiangboyCenterTableView{
    if (!_keqiangboyCenterTableView) {
        _keqiangboyCenterTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-kTabBarHeight) style:UITableViewStylePlain];
        _keqiangboyCenterTableView.delegate = self;
        _keqiangboyCenterTableView.dataSource = self;
        _keqiangboyCenterTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyCenterTableView.backgroundColor = LGDLightGaryColor;
        if (@available(iOS 11.0,*)) {
            _keqiangboyCenterTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _keqiangboyCenterTableView;
}
#pragma mark--keqiangboyCenterHeaderViewDelegaet
-(void)keqiangboyCenterHeaderViewDidTapClicks{
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if (![keqiangboyState isEqualToString:@"1"]) {
        [self keqiangboyShowloginVc];
        return;
    }

    keqiangboyInfosViewController * keqiangboInfoVc = [[keqiangboyInfosViewController alloc]init];
    keqiangboInfoVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:keqiangboInfoVc animated:YES];
}
#pragma mark--退出
-(void)keqiangboyFooterBtnClick{
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"ISLogin"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [LCProgressHUD hide];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"keqiangboylogonout" object:nil];
        self.keqangHeader.keqiangboyHeaderImgView.image = [UIImage imageNamed:@"logo"];
        self.keqangHeader.keqiangboylb.text = @"未登录";
        self.keqiangboyFooterBtn.hidden = YES;
    });
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString * keqiangboyState = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if ([keqiangboyState isEqualToString:@"1"]) {
        [self.keqangHeader.keqiangboyHeaderImgView sd_setImageWithURL:[NSURL URLWithString:@"https://avatar.wacdn.com/7c23d91f074f5e7fde62753d25157fd.jpg?imageView2/1/w/120/h/120"]];
        self.keqangHeader.keqiangboylb.text = @"多伦多德皇";
        self.keqiangboyFooterBtn.hidden=  NO;
    }else{
        self.keqiangboyFooterBtn.hidden = YES;
        self.keqangHeader.keqiangboyHeaderImgView.image = [UIImage imageNamed:@"logo"];
        self.keqangHeader.keqiangboylb.text = @"未登录";
    }
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
