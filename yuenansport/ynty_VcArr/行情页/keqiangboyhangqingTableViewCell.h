//
//  keqiangboyhangqingTableViewCell.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "keqiangboyHangqingModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboyhangqingTableViewCellDelegate <NSObject>

-(void)keqiangboyhangqingTableViewCellWithBtnIndex:(NSInteger)btnIndex CellIndexed:(NSInteger)Cellindex;

@end
@interface keqiangboyhangqingTableViewCell : UITableViewCell
@property(nonatomic,strong) keqiangboyHangqingModel * keqiangModel;
@property(nonatomic,weak) id <keqiangboyhangqingTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
