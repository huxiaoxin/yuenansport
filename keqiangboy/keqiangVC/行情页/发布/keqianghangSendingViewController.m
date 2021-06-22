//
//  keqianghangSendingViewController.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqianghangSendingViewController.h"
#import <UITextView+ZWPlaceHolder.h>
#import <HUPhotoBrowser-umbrella.h>
#import <RITLPhotos/RITLPhotos.h>
#import "keqiangboySendingCollectionCell.h"
@interface keqianghangSendingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,RITLPhotosViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong) UITableView  * keqiangSendingTableView;
@property(nonatomic,strong) NSMutableArray * keqiangsendingDataArr;
@property(nonatomic,strong) UIView * keqiangHeader;
@property(nonatomic,strong) UICollectionView * keqiangboyCollectonView;
@property(nonatomic,strong) UIImagePickerController *keqiangboyCollecPcekrVc;

@end

@implementation keqianghangSendingViewController

-(NSMutableArray *)keqiangsendingDataArr{
    if (!_keqiangsendingDataArr) {
        _keqiangsendingDataArr = [[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"shangchuantupian"]]];
    }
    return _keqiangsendingDataArr;
}
-(void)keqiangboysShareBtnClick{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"发布动态";
    self.view.backgroundColor  =  LGDLightGaryColor;
    [self.view addSubview:self.keqiangSendingTableView];
    _keqiangSendingTableView.tableHeaderView = self.keqiangHeader;
    
    
    UIView * keqianhboyShareView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    UIButton * keqiangboysShareBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(10), K(30), K(20))];
    [keqiangboysShareBtn  setTitle:@"分享" forState:UIControlStateNormal];
    [keqiangboysShareBtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    [keqiangboysShareBtn addTarget:self action:@selector(keqiangboysShareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    keqiangboysShareBtn.titleLabel.font = KBlFont(15);
    [keqianhboyShareView addSubview:keqiangboysShareBtn];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:keqianhboyShareView];
    
         
    UITextView * keqiangboyTextView = [[UITextView alloc]initWithFrame:CGRectMake(K(15), K(15), SCREEN_Width-K(30), K(100))];
    keqiangboyTextView.zw_placeHolder = @"这一刻我想说.....";
    keqiangboyTextView.zw_placeHolderColor =LGDGaryColor;
    keqiangboyTextView.textColor = LGDBLackColor;
    keqiangboyTextView.font = KSysFont(14);
    [_keqiangHeader addSubview:keqiangboyTextView];
    
    UICollectionViewFlowLayout * keqainboysShareLayOut = [[UICollectionViewFlowLayout alloc]init];
    keqainboysShareLayOut.itemSize = CGSizeMake(K(50), K(50));
    keqainboysShareLayOut.sectionInset =  UIEdgeInsetsMake(K(15), K(15), 0, K(10));
    UICollectionView * keqiangboyCollectonView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(keqiangboyTextView.frame), SCREEN_Width, K(80)) collectionViewLayout:keqainboysShareLayOut];
    keqiangboyCollectonView.delegate = self;
    keqiangboyCollectonView.dataSource = self;
    keqiangboyCollectonView.showsVerticalScrollIndicator = NO;
    keqiangboyCollectonView.showsHorizontalScrollIndicator = NO;
    keqiangboyCollectonView.backgroundColor = [UIColor whiteColor];
    [_keqiangHeader addSubview:keqiangboyCollectonView];
    [keqiangboyCollectonView registerClass:[keqiangboySendingCollectionCell class] forCellWithReuseIdentifier:@"keqiangboySendingCollectionCell"];
    [_keqiangboyCollectonView reloadData];
    _keqiangboyCollectonView  = keqiangboyCollectonView;
    
    
    
    // Do any additional setup after loading the view.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.keqiangsendingDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboySendingCollectionCell * keqiangboyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqiangboySendingCollectionCell" forIndexPath:indexPath];
    keqiangboyCell.keqiangboyImg = self.keqiangsendingDataArr[indexPath.row];
    return keqiangboyCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    keqiangboySendingCollectionCell * keqiangboyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"keqiangboySendingCollectionCell" forIndexPath:indexPath];
    if (indexPath.row == self.keqiangsendingDataArr.count -1) {
        [self keqiangboyLoadPhotoVcs];
    }else{
        NSMutableArray * keqiangboyCellDatArr = self.keqiangsendingDataArr;
        [keqiangboyCellDatArr removeLastObject];
        [HUPhotoBrowser showFromImageView:keqiangboyCell.keqiangboysImgView withImages:keqiangboyCellDatArr atIndex:indexPath.row];
    }
    
}
- (void)photosViewController:(UIViewController *)viewController
                      images:(NSArray <UIImage *> *)images
                       infos:(NSArray <NSDictionary *> *)infos{
    [self.keqiangsendingDataArr addObjectsFromArray:images];
    MJWeakSelf;
    [self.keqiangsendingDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage * MaryWarngnImg = (UIImage *)obj;
        if (MaryWarngnImg == [UIImage imageNamed:@"shangchuantupian"]) {
            [weakSelf.keqiangsendingDataArr removeObject:MaryWarngnImg];
            *stop = YES;
        }
    }];
    [self.keqiangsendingDataArr addObject:[UIImage imageNamed:@"shangchuantupian"]];
    [self.keqiangboyCollectonView reloadData];
    self.keqiangboyCollectonView.height = self.keqiangboyCollectonView.collectionViewLayout.collectionViewContentSize.height;
}


-(UIImagePickerController *)keqiangboyCollecPcekrVc{
    if (!_keqiangboyCollecPcekrVc) {
        _keqiangboyCollecPcekrVc = [[UIImagePickerController alloc] init];
        _keqiangboyCollecPcekrVc.delegate = self;
        _keqiangboyCollecPcekrVc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        _keqiangboyCollecPcekrVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _keqiangboyCollecPcekrVc.allowsEditing = YES;
    }
    return _keqiangboyCollecPcekrVc;
}
-(void)keqiangboyLoadPhotoVcs{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [LCProgressHUD showInfoMsg:errorStr];
        return;
    }
    RITLPhotosViewController *keqiangboyLoadsebdVc = RITLPhotosViewController.photosViewController;
    keqiangboyLoadsebdVc.configuration.maxCount = 5;
    keqiangboyLoadsebdVc.configuration.containVideo = false;
    keqiangboyLoadsebdVc.photo_delegate = self;
    [self presentViewController:keqiangboyLoadsebdVc animated:true completion:^{}];
}
-(void)keqiangboyCollecDissmisbtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UIView *)keqiangHeader{
    if (!_keqiangHeader) {
        _keqiangHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(120))];
        _keqiangHeader.backgroundColor = [UIColor whiteColor];
    }
    return _keqiangHeader;
}
-(UITableView *)keqiangSendingTableView{
    if (!_keqiangSendingTableView) {
        _keqiangSendingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _keqiangSendingTableView.showsVerticalScrollIndicator = NO;
        _keqiangSendingTableView.showsHorizontalScrollIndicator = NO;
        _keqiangSendingTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _keqiangSendingTableView.backgroundColor = LGDLightGaryColor;
        if (@available(iOS 11.0,*)) {
            _keqiangSendingTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
    }
    return _keqiangSendingTableView;
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
