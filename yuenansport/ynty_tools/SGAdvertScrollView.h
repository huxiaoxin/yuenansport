#import <UIKit/UIKit.h>
@class SGAdvertScrollView;
typedef enum : NSUInteger {
    SGAdvertScrollViewStyleNormal,
    SGAdvertScrollViewStyleMore,
} SGAdvertScrollViewStyle;
@protocol SGAdvertScrollViewDelegate <NSObject>
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;
@end
@interface SGAdvertScrollView : UIView
#pragma mark - - - 公共 API
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegate;
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
@property (nonatomic, assign) CFTimeInterval scrollTimeInterval;
@property (nonatomic, strong) UIFont *titleFont;
#pragma mark - - - SGAdvertScrollViewStyleNormal 样式下的 API
@property (nonatomic, strong) NSArray *signImages;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
#pragma mark - - - SGAdvertScrollViewStyleMore 样式下的 API
@property (nonatomic, strong) NSArray *topSignImages;
@property (nonatomic, strong) NSArray *topTitles;
@property (nonatomic, strong) NSArray *bottomSignImages;
@property (nonatomic, strong) NSArray *bottomTitles;
@property (nonatomic, strong) UIColor *topTitleColor;
@property (nonatomic, strong) UIColor *bottomTitleColor;
@end
