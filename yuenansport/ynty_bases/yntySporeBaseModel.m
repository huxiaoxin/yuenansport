

#import "yntySporeBaseModel.h"

@implementation yntySporeBaseModel
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
