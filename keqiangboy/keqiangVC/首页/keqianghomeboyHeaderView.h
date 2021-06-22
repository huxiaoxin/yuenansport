//
//  keqianghomeboyHeaderView.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol keqianghomeboyHeaderViewDelegate <NSObject>

-(void)keqianghomeboyHeaderViewDidbtnClicksWithIndex:(NSInteger)btnIndex;

@end
@interface keqianghomeboyHeaderView : UIView
@property(nonatomic,weak) id <keqianghomeboyHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
