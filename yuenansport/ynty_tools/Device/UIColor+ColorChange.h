#import <UIKit/UIKit.h>
@interface UIColor (ColorChange)
+ (UIColor *) colorWithHexString: (NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color Alpha:(CGFloat)alpha;
@end
