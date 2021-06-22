
#import <UIKit/UIKit.h>
#import "keqiangboyDetailComenrModle.h"
NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboyComentListTableViewCellDelegate <NSObject>

-(void)keqiangboyComentListTableViewCellDelegateWithCellIndex:(NSInteger)CellIndex  keqiangboybtnActionIndex:(NSInteger)btnIndex;

@end
@interface keqiangboyComentListTableViewCell : UITableViewCell
@property(nonatomic,strong) keqiangboyDetailComenrModle * keqiangModel;
@property(nonatomic,weak) id <keqiangboyComentListTableViewCellDelegate >delegate;
@end

NS_ASSUME_NONNULL_END
