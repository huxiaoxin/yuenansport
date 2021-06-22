//
//  keqiangboyHomeTableViewCell.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "keqiangChangdiModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboyHomeTableViewCellDelegate <NSObject>

-(void)keqiangboyHomeTableViewCellbtndidSeltecdWithCellindex:(NSInteger)CellIndex;

@end
@interface keqiangboyHomeTableViewCell : UITableViewCell
@property(nonatomic,strong) keqiangChangdiModel * keqnagMidol;
@property(nonatomic,weak) id <keqiangboyHomeTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
