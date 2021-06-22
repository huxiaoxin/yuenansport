#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SuccessBlock)(id object);
typedef void (^FailureBlock)(id fail);

@interface TTJZHttpTool : NSObject
+ (void)postHttpRequestWithURL:(NSString *)urlstring
Parameters:( NSMutableDictionary *)parameters
   Success:(SuccessBlock)successblock
   Failure:(FailureBlock)failureblock;
+ (void)getHttpRequestWithURL:(NSString *)urlstring
Parameters:(NSDictionary *)parameters
   Success:(SuccessBlock)successblock
   Failure:(FailureBlock)failureblock;
+ (void)NewpostHttpRequestWithURL:(NSString *)urlstring
Parameters:(NSMutableDictionary *)parameters
   Success:(SuccessBlock)successblock
                          Failure:(FailureBlock)failureblock;
+ (void)uploadImageWithPath:(NSString *)urlstring
Parameters:( NSMutableDictionary *)parameters
    images:(NSArray <NSData *> *)datas Success:(SuccessBlock)successblock
                    Failure:(FailureBlock)failureblock;
@end

NS_ASSUME_NONNULL_END
