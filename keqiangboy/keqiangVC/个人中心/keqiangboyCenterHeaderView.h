//
//  keqiangboyCenterHeaderView.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol keqiangboyCenterHeaderViewDelegaet <NSObject>

-(void)keqiangboyCenterHeaderViewDidTapClicks;

@end
@interface keqiangboyCenterHeaderView : UIView
@property(nonatomic,strong) UIImageView * keqiangboyHeaderImgView;
@property(nonatomic,strong) UILabel * keqiangboylb;
@property(nonatomic,weak) id <keqiangboyCenterHeaderViewDelegaet>delegate;
@end

NS_ASSUME_NONNULL_END
