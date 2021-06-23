#import <UIKit/UIKit.h>
@class UJNJobsNewssFlaout;
@protocol  LMHWaterFallLayoutDeleaget<NSObject>
@required
- (CGFloat)waterFallLayout:(UJNJobsNewssFlaout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;
@optional
- (NSUInteger)columnCountInWaterFallLayout:(UJNJobsNewssFlaout *)waterFallLayout;
- (CGFloat)columnMarginInWaterFallLayout:(UJNJobsNewssFlaout *)waterFallLayout;
- (CGFloat)rowMarginInWaterFallLayout:(UJNJobsNewssFlaout *)waterFallLayout;
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(UJNJobsNewssFlaout *)waterFallLayout;
@end
@interface UJNJobsNewssFlaout : UICollectionViewLayout
@property (nonatomic, weak) id<LMHWaterFallLayoutDeleaget> delegate;
@end
