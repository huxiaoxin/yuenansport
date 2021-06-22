#import "keqiangboysNewsListDetailController.h"
#import <WebKit/WebKit.h>
@interface keqiangboysNewsListDetailController ()<WKNavigationDelegate>
@property(nonatomic,strong) WKWebView * web;
@property(nonatomic,strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation keqiangboysNewsListDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = self.keqiangboysItem.title;
    
    
    NSString *html2 = [NSString stringWithFormat:@"<html><head><style>div{font-size:20px;}img{width: 75%%;height: auto;</style></head><body>%@</body></html>",self.keqiangboysItem.content];
    
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    
    NSString * webWidth = @"";
    
    if (@available(iOS 11, *)) {
        webWidth = @"device-width";
    }else{
        webWidth = [NSString stringWithFormat:@"%f",[UIScreen mainScreen].scale *  [[UIScreen mainScreen] bounds].size.width];
    }
    NSString *jSString = jSString = [NSString stringWithFormat:@"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=%@'); document.getElementsByTagName('head')[0].appendChild(meta);",webWidth];
    WKUserScript *wkUserScript = [[WKUserScript alloc] initWithSource:jSString injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [userContentController addUserScript:wkUserScript];
    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = userContentController;
    WKWebView * web = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-SafeAreaBottom_Height) configuration:wkWebConfig];
    web.navigationDelegate =self;
    [self.view addSubview:web];
    [web loadHTMLString:html2 baseURL:nil];
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.frame= CGRectMake(SCREEN_Width/2-K(15),K(250), K(30), K(30));
    self.activityIndicator.color = [UIColor lightGrayColor];
    self.activityIndicator.backgroundColor = [UIColor clearColor];
    self.activityIndicator.hidesWhenStopped = YES;
    [self.activityIndicator startAnimating];
    
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
}

NSString *const HTMLTool_cssCodePhoneA = @".duanluo{font-size:15px;color:#333333;text-align:left;margin:10px;}img{width: 100%;height: auto;}";

- (NSString *)addCSSCode:(NSString *)cssCode title:(NSString *)title charset:(NSString *)charset{
    
    charset = charset.length==0?@"UTF-8":charset;
    
    return [NSString stringWithFormat:@"<!DOCTYPE html><html lang=\"en\"><head><meta charset=\"%@\"><title>%@</title><link rel=\"stylesheet\" href=\"mui.min.css\"><style>%@</style></head><body>%@</body></html>",charset,title,cssCode,self];
}
@end



