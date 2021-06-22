//
//  keqiangboyBaseModel.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "keqiangboyBaseModel.h"

@implementation keqiangboyBaseModel
+(instancetype)initwithdict:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionaryed:dict];
}
-(instancetype)initWithDictionaryed:(NSDictionary *)dict
{
    if (self =[super init]) {
    [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

@end
