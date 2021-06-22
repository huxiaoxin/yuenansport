#import "keqiangboyInfosViewController.h"
#import "keqiangboysinfoTableViewCell.h"
#import <UITextView+ZWPlaceHolder.h>
#import <RITLPhotos/RITLPhotos.h>
#import <MOFSPickerManager-umbrella.h>
#import "keqiangboysinfoDetailContrler.h"
#import <MOFSPickerManager-umbrella.h>
@interface keqiangboyInfosViewController ()<UITableViewDelegate,UITableViewDataSource,RITLPhotosViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong) UITableView * keqiangboyinfoTabelViews;
@property(nonatomic,strong) NSMutableArray * keqiangboyInfoDataArr;
@property(nonatomic,strong) UIImagePickerController *keqiangboysInfoPickerVcs;
@property(nonatomic,strong) NSMutableArray * keqiangboysnfoRightDataArr;
@property(nonatomic,strong) UITextView * keqiangboysnfoTextViews;
@property(nonatomic,strong)  UIImageView * keqiangboysInfoInfoImgView;
@end

@implementation keqiangboyInfosViewController

-(NSMutableArray *)keqiangboyInfoDataArr{
    if (!_keqiangboyInfoDataArr) {
        _keqiangboyInfoDataArr =[[NSMutableArray alloc]initWithArray:@[@"昵称",@"性别",@"地区"]];
    }
    return _keqiangboyInfoDataArr;
}
-(NSMutableArray *)keqiangboysnfoRightDataArr{
    if (!_keqiangboysnfoRightDataArr) {
        NSString * keqiangboysInfonameStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"keqiangboysInfonameStr"];
        NSString * keqiangboysInfosexStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"keqiangboysInfosexStr"];
        NSString * keqiangboysnfoadressStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"keqiangboysnfoadressStr"];
        _keqiangboysnfoRightDataArr = [[NSMutableArray alloc]initWithArray:@[keqiangboysInfonameStr.length == 0 ? @"多伦多德皇" :keqiangboysInfonameStr,keqiangboysInfosexStr.length == 0 ? @"男" : keqiangboysInfosexStr,keqiangboysnfoadressStr.length == 0 ? @"杭州-萧山" : keqiangboysnfoadressStr]];
    }
    return _keqiangboysnfoRightDataArr;
}
-(UIImagePickerController *)keqiangboysInfoPickerVcs{
    if (!_keqiangboysInfoPickerVcs) {
        _keqiangboysInfoPickerVcs = [[UIImagePickerController alloc] init];
        _keqiangboysInfoPickerVcs.delegate = self;
        _keqiangboysInfoPickerVcs.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        _keqiangboysInfoPickerVcs.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _keqiangboysInfoPickerVcs.allowsEditing = YES;
    }
    return _keqiangboysInfoPickerVcs;
}
-(void)keqangbiygslodasnfoaphtotoActoins{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [LCProgressHUD showInfoMsg:errorStr];
        return;
    }
    RITLPhotosViewController *keqiangsInfoaVcs = RITLPhotosViewController.photosViewController;
    keqiangsInfoaVcs.configuration.maxCount = 1;
    keqiangsInfoaVcs.configuration.containVideo = false;
    keqiangsInfoaVcs.photo_delegate = self;
    [self presentViewController:keqiangsInfoaVcs animated:true completion:^{}];
}
- (void)photosViewController:(UIViewController *)viewController
                      images:(NSArray <UIImage *> *)images
                       infos:(NSArray <NSDictionary *> *)infos{
    NSData * dataImgdata  =   UIImageJPEGRepresentation(images.firstObject, 0.5);
    [LCProgressHUD showLoading:@"上传中"];
    NSMutableArray * dataArr= [[NSMutableArray alloc]initWithObjects:dataImgdata, nil];
    NSMutableDictionary * SanXiaInfoaDics = [NSMutableDictionary dictionary];
    [SanXiaInfoaDics setValue:@"9" forKey:@"userId"];
    [TTJZHttpTool uploadImageWithPath:@"https://www.yuan282828sc.com/minio_interface/linux_file/upload_img" Parameters:SanXiaInfoaDics images:dataArr Success:^(id  _Nonnull object) {
        [LCProgressHUD showSuccess:@"上传成功"];
        NSString * imgUrl = [object objectForKey:@"data"];
        self.keqiangboysInfoInfoImgView.image = images.firstObject;
        [[NSUserDefaults standardUserDefaults] setObject:imgUrl forKey:@"YPWorkerLoadPhotourl"];
        [[NSUserDefaults  standardUserDefaults] synchronize];
    } Failure:^(id  _Nonnull fail) {
        [LCProgressHUD showFailure:fail];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gk_navTitle = @"编辑个人资料";
    [self.view addSubview:self.keqiangboyinfoTabelViews];
    
    UIView * SanXiaInfoaRightViews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(60))];
    
    UIButton * SanXiaInfoaWanchenBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(15), K(40), K(20))];
    [SanXiaInfoaWanchenBtn setTitle:@"完成" forState:UIControlStateNormal];
    SanXiaInfoaWanchenBtn.titleLabel.font = KSysFont(14);
    [SanXiaInfoaWanchenBtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    [SanXiaInfoaWanchenBtn addTarget:self action:@selector(keqiangboysnfoaWanchengActons) forControlEvents:UIControlEventTouchUpInside];
    [SanXiaInfoaRightViews addSubview:SanXiaInfoaWanchenBtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:SanXiaInfoaRightViews];
    NSString * SanXiaInfoaDescStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"SanXiaInfoaDescStr"];
    _keqiangboysnfoTextViews.text = SanXiaInfoaDescStr.length == 0 ? @"谁曾从谁的青春里走过,留下了笑靥,谁曾在谁的花季里停留,温暖了想念,谁又从谁的雨季里消失,泛滥了眼泪": SanXiaInfoaDescStr;
    
}
-(UITableView *)keqiangboyinfoTabelViews{
    if (!_keqiangboyinfoTabelViews) {
        _keqiangboyinfoTabelViews = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangboyinfoTabelViews.delegate = self;
        _keqiangboyinfoTabelViews.dataSource =self;
        _keqiangboyinfoTabelViews.showsVerticalScrollIndicator = NO;
        _keqiangboyinfoTabelViews.showsHorizontalScrollIndicator = NO;
        _keqiangboyinfoTabelViews.separatorStyle =  UITableViewCellSelectionStyleNone;
        _keqiangboyinfoTabelViews.backgroundColor = [UIColor clearColor];
        _keqiangboyinfoTabelViews.scrollEnabled = NO;
    }
    return _keqiangboyinfoTabelViews;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.keqiangboyInfoDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * SanXiaInfoaIdentifers = @"keqiangboysinfoTableViewCell";
    keqiangboysinfoTableViewCell * SanXiaInfoCell = [tableView dequeueReusableCellWithIdentifier:SanXiaInfoaIdentifers];
    if (SanXiaInfoCell == nil) {
        SanXiaInfoCell = [[keqiangboysinfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SanXiaInfoaIdentifers];
    }
    SanXiaInfoCell.keqiangbotBotmlb.text = self.keqiangboyInfoDataArr[indexPath.row];
    SanXiaInfoCell.keqiangboysToplbs.text = self.keqiangboysnfoRightDataArr[indexPath.row];
    return SanXiaInfoCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return K(180);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView * SanXiaInfoFiirersView = [UIView new];
    
    UILabel * SanXiaInfoFotelbs = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(15), K(200), K(20))];
    SanXiaInfoFotelbs.font =  KSysFont(14);
    SanXiaInfoFotelbs.text =  @"个人签名";
    SanXiaInfoFotelbs.textColor = LGDLightBLackColor;
    [SanXiaInfoFiirersView addSubview:SanXiaInfoFotelbs];
    
    
    UITextView * keqiangboysnfoTextViews = [[UITextView alloc]initWithFrame:CGRectMake(SCREEN_Width-K(250), K(15), K(230), K(150))];
    keqiangboysnfoTextViews.backgroundColor  = LGDLightGaryColor;
    keqiangboysnfoTextViews.zw_placeHolderColor = LGDGaryColor;
    keqiangboysnfoTextViews.zw_placeHolder = @"请输入个人签名";
    [SanXiaInfoFiirersView addSubview:keqiangboysnfoTextViews];
    _keqiangboysnfoTextViews = keqiangboysnfoTextViews;
    NSString * SanXiaInfoaDescStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"SanXiaInfoaDescStr"];
    _keqiangboysnfoTextViews.text = SanXiaInfoaDescStr.length == 0 ? @"谁曾从谁的青春里走过,留下了笑靥,谁曾在谁的花季里停留,温暖了想念,谁又从谁的雨季里消失,泛滥了眼泪": SanXiaInfoaDescStr;
    
    
    UIView * SanXiaInfoFotlines = [[UIView alloc]initWithFrame:CGRectMake(0, K(179), SCREEN_Width, K(1))];
    SanXiaInfoFotlines.backgroundColor = LGDLightGaryColor;
    [SanXiaInfoFiirersView addSubview:SanXiaInfoFotlines];
    return SanXiaInfoFiirersView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(100);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * keiqangboysSectoinHeader = [UIView new];
    keiqangboysSectoinHeader.backgroundColor= [UIColor whiteColor];
    UIImageView * keqiangboysInfoInfoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width/2-K(25), K(25), K(50), K(50))];
    keqiangboysInfoInfoImgView.userInteractionEnabled =  YES;
    keqiangboysInfoInfoImgView.layer.cornerRadius  =K(25);
    keqiangboysInfoInfoImgView.layer.masksToBounds = YES;
    keqiangboysInfoInfoImgView.layer.borderColor = LGDMianColor.CGColor;
    keqiangboysInfoInfoImgView.layer.borderWidth = K(1);
    [keqiangboysInfoInfoImgView sd_setImageWithURL:[NSURL URLWithString:@"https://avatar.wacdn.com/7c23d91f074f5e7fde62753d25157fd.jpg?imageView2/1/w/120/h/120"]];
    [keiqangboysSectoinHeader addSubview:keqiangboysInfoInfoImgView];
    _keqiangboysInfoInfoImgView = keqiangboysInfoInfoImgView;
    
    
    UITapGestureRecognizer * keiqangboysSectoinHeaderTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keqianhgbosfoaphtotoClicks)];
    [keqiangboysInfoInfoImgView addGestureRecognizer:keiqangboysSectoinHeaderTap];
    return keiqangboysSectoinHeader;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        keqiangboysinfoDetailContrler * keqiangnfodetalVc = [[keqiangboysinfoDetailContrler alloc]init];
        MJWeakSelf;
        keqiangnfodetalVc.kefinboks = ^(NSString * _Nonnull WWLname) {
            [weakSelf.keqiangboysnfoRightDataArr replaceObjectAtIndex:0 withObject:WWLname];
            [weakSelf.keqiangboyinfoTabelViews reloadData];
        };
        keqiangnfodetalVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:keqiangnfodetalVc animated:YES];
    }else if (indexPath.row == 1){
        
        MJWeakSelf;
        UIAlertController * keqiangboyysoSexAkterVc =[ UIAlertController alertControllerWithTitle:@"性别" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction * SanXiaInfoManAAxctions = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf.keqiangboysnfoRightDataArr replaceObjectAtIndex:1 withObject:@"男"];
            [weakSelf.keqiangboyinfoTabelViews reloadData];
        }];
        
        UIAlertAction * keiangousInfogirlAAxctions = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf.keqiangboysnfoRightDataArr replaceObjectAtIndex:1 withObject:@"女"];
            [weakSelf.keqiangboyinfoTabelViews reloadData];
        }];
        UIAlertAction * SanXiaInfogcancleAAxctions = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [keqiangboyysoSexAkterVc addAction:SanXiaInfoManAAxctions];
        [keqiangboyysoSexAkterVc addAction:keiangousInfogirlAAxctions];
        [keqiangboyysoSexAkterVc addAction:SanXiaInfogcancleAAxctions];
        [self presentViewController:keqiangboyysoSexAkterVc animated:YES completion:nil];
    }else if (indexPath.row ==2){
        MJWeakSelf;
        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:@"请选择地址" cancelTitle:@"取消" commitTitle:@"确定" commitBlock:^(NSString * _Nullable address, NSString * _Nullable zipcode) {
            [weakSelf.keqiangboysnfoRightDataArr replaceObjectAtIndex:2 withObject:address];
            [weakSelf.keqiangboyinfoTabelViews reloadData];
        } cancelBlock:^{
            
        }];
    }else if (indexPath.row ==3){
        
    }
}
-(void)keqianhgbosfoaphtotoClicks{
    [self keqangbiygslodasnfoaphtotoActoins];
}
-(void)keqiangboysnfoaWanchengActons{
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserDefaults standardUserDefaults] setObject:self.keqiangboysnfoRightDataArr.firstObject forKey:@"keqiangboysInfonameStr"];
        [[NSUserDefaults standardUserDefaults] setObject:self.keqiangboysnfoRightDataArr.lastObject forKey:@"keqiangboysnfoadressStr"];
        [[NSUserDefaults standardUserDefaults] setObject:self.keqiangboysnfoTextViews.text forKey:@"SanXiaInfoaDescStr"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [LCProgressHUD showSuccess:@"更新成功"];
        [self.navigationController popViewControllerAnimated:YES];
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




