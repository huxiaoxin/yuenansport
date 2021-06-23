

#import "yntySportBaseControllers.h"
#import "yntySportLogoinsViewController.h"
@interface yntySportBaseControllers ()

@end

@implementation yntySportBaseControllers
-(void)ymtySportShowloginVc{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        yntySportLogoinsViewController * yntyLogVc = [[yntySportLogoinsViewController alloc]init];
        UINavigationController * yntyNavs = [UINavigationController rootVC:yntyLogVc translationScale:YES];
        [weakSelf  presentViewController:yntyNavs animated:YES completion:nil];
        
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
