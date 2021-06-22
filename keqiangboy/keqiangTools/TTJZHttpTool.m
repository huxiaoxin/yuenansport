#import "TTJZHttpTool.h"
#import <AFNetworking.h>
#import "NSDictionary+DeleteNull.h"
@implementation TTJZHttpTool
+ (void)NewpostHttpRequestWithURL:(NSString *)urlstring
                       Parameters:(NSMutableDictionary *)parameters
                          Success:(SuccessBlock)successblock
                          Failure:(FailureBlock)failureblock{
    //判断网络
    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
        failureblock(@"无网络");
        return;
    }
    //异步线程
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [manager.requestSerializer setValue:@"APPCODE 101ba769bf144163a7910cd1e5117176" forHTTPHeaderField:@"Authorization"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml",@"text/html",@"text/plain",@"application/octet-stream",@"application/xml",@"application/json", nil];
        
        
        NSLog(@"参数:%@",parameters);
        
        manager.requestSerializer.timeoutInterval  = 15;
        [manager POST:urlstring parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            NSDictionary *responseDic = nil;
            if ([responseObject isKindOfClass:[NSData class]]) {
                responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
            }
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                responseDic = responseObject;
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if(!error && responseDic){
                    NSLog(@"http请求- Post - responseDic: %@", responseDic);
                    NSString * status = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"code"]];
                    NSString *msg = [responseDic objectForKey:@"msg"];
                    if ([msg isEqualToString:@"ok"]) {
                        successblock([NSDictionary changeType:responseDic]);
                        return ;
                    }
                    if ([status isEqualToString:@"200"]) {
                        successblock([NSDictionary changeType:responseDic]);
                        return ;
                    }
                    if ([status isEqualToString:@"1004"]) {
                        
                        [LCProgressHUD showFailure:@"账号或密码错误"];
                        return;
                    }
                    if (![status isEqualToString:@"200"]) {
                        failureblock(msg);
                        
                        return ;
                    }
                }else{
                    NSLog(@"http请求- Post - error: %@", error);
                    failureblock(@"内部错误");
                }
            });
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"服务器的错误原因:%@",str);
            NSLog(@"error-%@",error.localizedDescription);
            failureblock(@"请求超时");
        }];
        
        
    });
    
}
+ (void)postHttpRequestWithURL:(NSString *)urlstring
                    Parameters:(NSMutableDictionary *)parameters
                       Success:(SuccessBlock)successblock
                       Failure:(FailureBlock)failureblock{
    //判断网络
    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
        failureblock(@"无网络");
        return;
    }
    //异步线程
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString* url = [@"" stringByAppendingString:urlstring];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval  = 15;
        
        NSLog(@"参数:%@",parameters);
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            NSDictionary *responseDic = nil;
            if ([responseObject isKindOfClass:[NSData class]]) {
                responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
            }
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                responseDic = responseObject;
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if(!error && responseDic){
                    NSLog(@"http请求- Post - responseDic: %@", responseDic);
                    NSString * status = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"code"]];
                    NSString *msg = [responseDic objectForKey:@"msg"];
                    if ([status isEqualToString:@"200"]) {
                        successblock([NSDictionary changeType:responseDic]);
                        return ;
                    }
                    if (![status isEqualToString:@"200"]) {
                        failureblock(msg);
                        return ;
                    }
                }else{
                    NSLog(@"http请求- Post - error: %@", error);
                    failureblock(@"内部错误");
                }
            });
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"服务器的错误原因:%@",str);
            NSLog(@"error-%@",error.localizedDescription);
            failureblock(@"请求超时");
        }];
        
        
    });
    
}
+ (void)getHttpRequestWithURL:(NSString *)urlstring
                   Parameters:(NSDictionary *)parameterdic
                      Success:(SuccessBlock)successblock
                      Failure:(FailureBlock)failureblock{
    //判断网络
    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
        failureblock(@"无网络");
        return;
    }
    //异步线程
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager GET:[@"" stringByAppendingString:urlstring] parameters:parameterdic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"responseObject=%@",responseObject);
            
            NSLog(@"class=%@",[responseObject class]);
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"dic====%@",dic);
            
            
            //json解析
            NSError *error = nil;
            NSDictionary *responseDic = nil;
            if ([responseObject isKindOfClass:[NSData class]]) {
                responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
            }
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                responseDic = responseObject;
            }
            NSLog(@"http请求- get - responseObject: %@", responseDic);
            dispatch_async(dispatch_get_main_queue(), ^{
                if(!error && responseDic){
                    NSString * status = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"code"]];
                    
                    NSString *msg = [responseDic objectForKey:@"message"];
                    if ([status isEqualToString:@"200"] || [status isEqualToString:@"10000"]) {
                        successblock([NSDictionary changeType:responseDic]);
                        return ;
                    }
                    NSString * newmsg = [responseDic objectForKey:@"msg"];
                    if ([newmsg isEqualToString:@"成功"]) {
                       successblock([NSDictionary changeType:responseDic]);
                        return ;
                    }
                    if (![status isEqualToString:@"1"]) {
                        failureblock(msg);
                        return ;
                    }
                }else{
                    NSLog(@"http请求- get - error: %@", error);
                    failureblock(@"内部错误");
                }
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"http请求- get - Error: %@", error);
                failureblock(@"请求超时");
            });
            
        }];
    });
    
}
+ (void)uploadImageWithPath:(NSString *)urlstring
                 Parameters:( NSMutableDictionary *)parameters
                     images:(NSArray <NSData *> *)datas Success:(SuccessBlock)successblock
                    Failure:(FailureBlock)failureblock{
    //判断网络
    if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
        failureblock(@"暂无网络");
        return;
    }
    //异步线程
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString* url = [@"" stringByAppendingString:urlstring];
        
        //        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        [manager.requestSerializer setValue:@"multipart/form-data" forHTTPHeaderField:@"Content-Type"];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            for (int index =0 ; index < datas.count; index++) {
                NSData * photodata = datas[index];
                [formData appendPartWithFileData:photodata name:@"file" fileName:[NSString stringWithFormat:@"TW%d.jpg",index] mimeType:@"image/png"];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSInteger per = uploadProgress.fractionCompleted * 100;
            NSLog(@"完成百分比:%d%@",per,@"%");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            NSDictionary *responseDic = nil;
            if ([responseObject isKindOfClass:[NSData class]]) {
                responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
            }
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                responseDic = responseObject;
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if(!error && responseDic){
                    NSLog(@"http请求- Post - responseDic: %@", responseDic);
                    NSString * status = [NSString stringWithFormat:@"%@",[responseDic objectForKey:@"status"]];
                    NSString *msg = [responseDic objectForKey:@"message"];
                    if ([status isEqualToString:@"1"]) {
                        successblock(responseDic);
                        
                        return ;
                    }
                    if (![status isEqualToString:@"1"]) {
                        failureblock(msg);
                        return ;
                    }
                }else{
                    NSLog(@"http请求- Post - error: %@", error);
                    failureblock(@"内部错误");
                }
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"服务器的错误原因:%@",str);
            NSLog(@"error-%@",error.localizedDescription);
            failureblock(@"请求超时");
        }];
        
        
    });
    
    
}
@end
