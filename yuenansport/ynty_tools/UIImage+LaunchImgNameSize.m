
#import "UIImage+LaunchImgNameSize.h"
@implementation UIImage (gaoXiangqinghuoquqidongye)
+ (UIImage *)gaoXiangqinghuoquqidongye {
UIImage               *wwllacimg      = nil;
NSString              *viewOrientation = nil;
CGSize                 viewSize        = [UIScreen mainScreen].bounds.size;
UIInterfaceOrientation orientation     = [[UIApplication sharedApplication] statusBarOrientation];
if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
    viewOrientation = @"Landscape";
} else {
    viewOrientation = @"Portrait";
}
NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
for (NSDictionary *dict in imagesDictionary) {
    CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
    if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
        wwllacimg = [UIImage imageNamed:dict[@"UILaunchImageName"]];
    }
}
return wwllacimg;
}

@end
