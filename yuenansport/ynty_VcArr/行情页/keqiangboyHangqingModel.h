//
//  keqiangboyHangqingModel.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "yntySporeBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface keqiangboyHangqingModel : yntySporeBaseModel
@property(nonatomic,copy)   NSString * name;
@property(nonatomic,copy)   NSString * header;
@property(nonatomic,copy)   NSString * time;
@property(nonatomic,copy)   NSString * content;
@property(nonatomic,strong) NSMutableArray * photos;
@property(nonatomic,copy)   NSString * adress;
@property(nonatomic,assign) NSInteger contentID;
@property(nonatomic,assign) BOOL isZan;
@property(nonatomic,assign) NSInteger zanNum;
@property(nonatomic,assign) CGFloat Cellheight;
@end

NS_ASSUME_NONNULL_END
