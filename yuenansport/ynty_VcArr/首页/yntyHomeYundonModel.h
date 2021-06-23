
#import "yntySporeBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface yntyHomeYundonModel : yntySporeBaseModel
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
