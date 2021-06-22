//
//  Header.h
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//


#ifndef Header_h
#define Header_h
#define LGDMianColor          [UIColor colorWithHexString:@"#4C88F6"]
#define LGDGaryColor          [UIColor colorWithHexString:@"#9F9FA0"]
#define LGDLightGaryColor     [UIColor colorWithHexString:@"#F5F5F5"]
#define LGDBLackColor          [UIColor blackColor]
#define  LGDLightBLackColor          [UIColor colorWithHexString:@"#444444"]

#define LGDRedColor          [UIColor colorWithHexString:@"#F95B6A"]
#define LGDBlueColor          [UIColor colorWithHexString:@"#25D090"]
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width
#define KBlFont(b)        [UIFont fontWithName:@"DINAlternate-Bold" size:b]
#define KFZPFont(b)        [UIFont fontWithName:@"FZPWJW--GB1-0" size:b]
#define KSysFont(c)      [UIFont systemFontOfSize:c]
#define K(a)        ((a*1.0)/375.0) * SCREEN_Width
#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IPHONE_X (@available(iOS 11.0, *) ？ [[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 : NO )
#define kIs_iPhoneX SCREEN_Width >=375.0f && SCREEN_Height >=812.0f&& kIs_iphone
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))
#define navigationHeight  self.navigationController.navigationBar.frame.size.height
#define NaviH (SCREEN_Height >= 812 ? 88 : 64)
#define UserDefaults                    [NSUserDefaults standardUserDefaults]
#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr, "%s:%zd\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil


#endif /* Header_h */











#endif /* Header_h */
