
#import "keqiangboysSugestionViewController.h"
#import <UITextView+ZWPlaceHolder.h>
#import <UITextView+ZWLimitCounter.h>
#import "keqangbiytsAdviceCollectionCell.h"
#import <RITLPhotos.h>
#import <HUPhotoBrowser/HUPhotoBrowser.h>
@interface keqiangboysSugestionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,RITLPhotosViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,keqiangboysCollectionCellDelegate>
@property(nonatomic,strong) UIScrollView * keqiangboySugestonScrollView;
@property(nonatomic,strong) UICollectionView * keqiangboySugestonCollectioinView;
@property(nonatomic,strong) NSMutableArray * keqiangboySugestonDataArr;
@property(nonatomic,strong) UILabel * keqiangboySugestonToplbs;
@property(nonatomic,strong) UIImagePickerController *keqiangboySugestonPickVers;
@property(nonatomic,strong) UIButton * keqiangboySugestonBtn;
@property(nonatomic,strong) UITextView * keqiangboySugestonTextViews;
@end

@implementation keqiangboysSugestionViewController

-(NSMutableArray *)keqiangboySugestonDataArr{
    if (!_keqiangboySugestonDataArr) {
        _keqiangboySugestonDataArr = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"yntydajhgdakdgaq"], nil];
    }
    return _keqiangboySugestonDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    self.gk_navTitle = @"意见反馈";
    [self.view addSubview:self.keqiangboySugestonScrollView];
    
    UILabel * keqiangboySugestonlb = [[UILabel alloc]initWithFrame:CGRectMake(K(15.5), K(22), K(200), K(15))];
    keqiangboySugestonlb.text = @"问题描述";
    keqiangboySugestonlb.font = [UIFont fontWithName:@"PingFangSC-Medium" size:K(16)];
    keqiangboySugestonlb.textColor = [UIColor colorWithHexString:@"#333333"];
    [_keqiangboySugestonScrollView addSubview:keqiangboySugestonlb];
    
    
    UITextView * keqiangboySugestonTextViews = [[UITextView alloc]initWithFrame:CGRectMake(K(15.5), CGRectGetMaxY(keqiangboySugestonlb.frame)+K(11.5), SCREEN_Width-K(31), K(102.5))];
    keqiangboySugestonTextViews.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    keqiangboySugestonTextViews.zw_placeHolder =  @"请输入您的意见或建议";
    keqiangboySugestonTextViews.zw_limitCount = 1000;
    keqiangboySugestonTextViews.zw_placeHolderColor = [UIColor colorWithHexString:@"#B3B3B3"];
    keqiangboySugestonTextViews.layer.cornerRadius = K(5);
    keqiangboySugestonTextViews.layer.masksToBounds = YES;
    [_keqiangboySugestonScrollView addSubview:keqiangboySugestonTextViews];
    _keqiangboySugestonTextViews = keqiangboySugestonTextViews;
    
    
    UILabel * keqiangboySugestonToplbs = [[UILabel alloc]initWithFrame:CGRectMake(K(15.5), K(22)+CGRectGetMaxY(keqiangboySugestonTextViews.frame), K(200), K(15))];
    keqiangboySugestonToplbs.text = @"上传图片";
    keqiangboySugestonToplbs.font = [UIFont fontWithName:@"PingFangSC-Medium" size:K(16)];
    keqiangboySugestonToplbs.textColor = [UIColor colorWithHexString:@"#333333"];
    [_keqiangboySugestonScrollView addSubview:keqiangboySugestonToplbs];
    _keqiangboySugestonToplbs  =keqiangboySugestonToplbs;
    [_keqiangboySugestonScrollView addSubview:self.keqiangboySugestonCollectioinView];
    [_keqiangboySugestonCollectioinView registerClass:[keqangbiytsAdviceCollectionCell class] forCellWithReuseIdentifier:@"keqangbiytsAdviceCollectionCell"];
    [_keqiangboySugestonScrollView addSubview:self.keqiangboySugestonBtn];
}
-(UIButton *)keqiangboySugestonBtn{
    if (!_keqiangboySugestonBtn) {
        _keqiangboySugestonBtn  =[[UIButton alloc]initWithFrame:CGRectMake(K(22.5), CGRectGetMaxY(_keqiangboySugestonCollectioinView.frame)+K(50), SCREEN_Width-K(45), K(40))];
        _keqiangboySugestonBtn.layer.cornerRadius =  K(20);
        _keqiangboySugestonBtn.layer.masksToBounds = YES;
        [_keqiangboySugestonBtn setBackgroundColor:LGDMianColor];
        [_keqiangboySugestonBtn setTitle:@"提交" forState:UIControlStateNormal];
        _keqiangboySugestonBtn.titleLabel.font = [UIFont systemFontOfSize:K(15)];
        _keqiangboySugestonBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_keqiangboySugestonBtn addTarget:self action:@selector(keqiangboySugestonBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _keqiangboySugestonBtn;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.keqiangboySugestonDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    keqangbiytsAdviceCollectionCell * keqiangboySugeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqangbiytsAdviceCollectionCell" forIndexPath:indexPath];
    keqiangboySugeCell.tag = indexPath.row;
    keqiangboySugeCell.Delegate = self;
    keqiangboySugeCell.keqiangimmgs = self.keqiangboySugestonDataArr[indexPath.row];
    return keqiangboySugeCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.keqiangboySugestonDataArr.count-1) {
        if (self.keqiangboySugestonDataArr.count > 6) {
            [LCProgressHUD showInfoMsg:@"最多只能上传5张"];
            return;
        }
        [self keqiangboySugeLoaphotVcs];
    }else{
        //浏览图片
        keqangbiytsAdviceCollectionCell * keqiangboySugeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqangbiytsAdviceCollectionCell" forIndexPath:indexPath];
        NSMutableArray * keqiangboySugeTempArr = self.keqiangboySugestonDataArr.mutableCopy;
        [keqiangboySugeTempArr removeObject:[UIImage imageNamed:@"yntydajhgdakdgaq"]];
        [HUPhotoBrowser showFromImageView:keqiangboySugeCell.keqiangboyImgViews withImages:keqiangboySugeTempArr atIndex:indexPath.row];
    }
}
//提交
-(void)keqiangboySugestonBtnClick{
    if (_keqiangboySugestonTextViews.text.length == 0) {
        
        [LCProgressHUD showInfoMsg:@"请输入个人建议"];
        return;
    }
    NSString * ISLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"ISLogin"];
    if (![ISLogin isEqualToString:@"1"]) {
        //           [self SanXiaBaseShowLoginController];
        return;
    }
    
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"感谢反馈,结果会24h通知到你的手机号上"];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}
#pragma mark--
-(void)keqinagboysCollectionCellDelegateWithBtnCliocks:(NSInteger)SanXiandex{
    UIImage * keqiangboySugeImgs = self.keqiangboySugestonDataArr[SanXiandex];
    if (keqiangboySugeImgs !=[UIImage imageNamed:@"yntydajhgdakdgaq"]) {
        [self.keqiangboySugestonDataArr removeObjectAtIndex:SanXiandex];
        [self.keqiangboySugestonCollectioinView reloadData];
        self.keqiangboySugestonCollectioinView.height = self.keqiangboySugestonCollectioinView.collectionViewLayout.collectionViewContentSize.height;
        self.keqiangboySugestonBtn.y = CGRectGetMaxY(_keqiangboySugestonCollectioinView.frame)+K(50);
    }
}
- (void)photosViewController:(UIViewController *)viewController
                      images:(NSArray <UIImage *> *)images
                       infos:(NSArray <NSDictionary *> *)infos{
    [self.keqiangboySugestonDataArr addObjectsFromArray:images];
    
    MJWeakSelf;
    [self.keqiangboySugestonDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage * keqiangboySugeImgs = (UIImage *)obj;
        if (keqiangboySugeImgs == [UIImage imageNamed:@"yntydajhgdakdgaq"]) {
            [weakSelf.keqiangboySugestonDataArr removeObject:keqiangboySugeImgs];
            *stop = YES;
        }
    }];
    
    [self.keqiangboySugestonDataArr addObject:[UIImage imageNamed:@"yntydajhgdakdgaq"]];
    [self.keqiangboySugestonCollectioinView reloadData];
    self.keqiangboySugestonCollectioinView.height = self.keqiangboySugestonCollectioinView.collectionViewLayout.collectionViewContentSize.height;
    self.keqiangboySugestonBtn.y = CGRectGetMaxY(_keqiangboySugestonCollectioinView.frame)+K(50);
}

-(UIImagePickerController *)keqiangboySugestonPickVers{
    if (!_keqiangboySugestonPickVers) {
        _keqiangboySugestonPickVers = [[UIImagePickerController alloc] init];
        _keqiangboySugestonPickVers.delegate = self;
        _keqiangboySugestonPickVers.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        _keqiangboySugestonPickVers.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _keqiangboySugestonPickVers.allowsEditing = YES;
    }
    return _keqiangboySugestonPickVers;
}
-(void)keqiangboySugeLoaphotVcs{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus keqiangboySugeLautor = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(keqiangboySugeLautor == AVAuthorizationStatusRestricted || keqiangboySugeLautor == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [LCProgressHUD showInfoMsg:errorStr];
        return;
    }
    RITLPhotosViewController *keqiangboySugeVcs = RITLPhotosViewController.photosViewController;
    keqiangboySugeVcs.configuration.maxCount = 5;
    keqiangboySugeVcs.configuration.containVideo = false;
    keqiangboySugeVcs.photo_delegate = self;
    [self presentViewController:keqiangboySugeVcs animated:true completion:^{}];
}

-(UICollectionView *)keqiangboySugestonCollectioinView{
    if (!_keqiangboySugestonCollectioinView) {
        UICollectionViewFlowLayout * keqiangboySugeLayouts =[[UICollectionViewFlowLayout alloc]init];
        keqiangboySugeLayouts.itemSize = CGSizeMake(K(155/2),  K(155/2+7.5));
        keqiangboySugeLayouts.sectionInset =  UIEdgeInsetsMake(0, K(15), 0, K(15));
        keqiangboySugeLayouts.minimumLineSpacing = K(12);
        keqiangboySugeLayouts.minimumInteritemSpacing = K(12);
        _keqiangboySugestonCollectioinView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_keqiangboySugestonToplbs.frame)+K(22), SCREEN_Width, K(155/2+7.5)) collectionViewLayout:keqiangboySugeLayouts];
        _keqiangboySugestonCollectioinView.delegate = self;
        _keqiangboySugestonCollectioinView.dataSource = self;
        _keqiangboySugestonCollectioinView.showsVerticalScrollIndicator = NO;
        _keqiangboySugestonCollectioinView.showsHorizontalScrollIndicator = NO;
        _keqiangboySugestonCollectioinView.backgroundColor = [UIColor whiteColor];
    }
    return _keqiangboySugestonCollectioinView;
}
-(UIScrollView *)keqiangboySugestonScrollView{
    if (!_keqiangboySugestonScrollView) {
        _keqiangboySugestonScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height)];
        _keqiangboySugestonScrollView.backgroundColor = [UIColor whiteColor];
        _keqiangboySugestonScrollView.showsHorizontalScrollIndicator = NO;
        _keqiangboySugestonScrollView.showsVerticalScrollIndicator  =NO;
        _keqiangboySugestonScrollView.contentSize = CGSizeMake(SCREEN_Width, SCREEN_Height);
    }
    return _keqiangboySugestonScrollView;
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




