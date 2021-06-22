//
//  keqiangChangdiModel.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/23.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface keqiangChangdiModel : keqiangboyBaseModel
@property(nonatomic,copy) NSString * img;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * price;
@property(nonatomic,copy) NSString * currentpirce;
@property(nonatomic,assign) NSUInteger stareNum;
@property(nonatomic,assign) BOOL isColltecd;
@property(nonatomic,assign) BOOL  isyuyue;
@property(nonatomic,copy) NSString * adress;
@property(nonatomic,copy) NSString * peopleNum;
@property(nonatomic,copy) NSString * phone;
@property(nonatomic,assign) NSInteger ContentID;
@property(nonatomic,assign) NSInteger  type; //0 足球 1篮球 2羽毛求
@end

NS_ASSUME_NONNULL_END
