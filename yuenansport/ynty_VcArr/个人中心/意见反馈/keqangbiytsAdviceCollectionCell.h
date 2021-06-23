#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboysCollectionCellDelegate <NSObject>

-(void)keqinagboysCollectionCellDelegateWithBtnCliocks:(NSInteger)SanXindex;

@end
@interface keqangbiytsAdviceCollectionCell : UICollectionViewCell
@property(nonatomic,strong) UIImage * keqiangimmgs;
@property(nonatomic,strong) UIImageView * keqiangboyImgViews;

@property(nonatomic,weak) id <keqiangboysCollectionCellDelegate>Delegate;
@end

NS_ASSUME_NONNULL_END
