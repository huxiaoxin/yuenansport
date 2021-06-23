

#import <UIKit/UIKit.h>
#import "yntyHomeYundonModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboyHomeTableViewCellDelegate <NSObject>

-(void)keqiangboyHomeTableViewCellbtndidSeltecdWithCellindex:(NSInteger)CellIndex;

@end
@interface yntySportHomeTableViewCell : UITableViewCell
@property(nonatomic,strong) yntyHomeYundonModel * keqnagMidol;
@property(nonatomic,weak) id <keqiangboyHomeTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
