

#import "AppDelegate.h"
#import "keqiangboyHangqingModel.h"
#import "keqiangboyDetailComenrModle.h"
#import <SobotKit/SobotKit.h>
#import "yntyHomeYundonModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString * keqiangboy = [[NSUserDefaults standardUserDefaults] objectForKey:@"yntySporets"];
    if (![keqiangboy isEqualToString:@"1"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"yntySporets"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self yntySportdongtaiConfigsaf];
        [self yntySportxisgdenidhaisffsear];
        [self yntySportdakftsjfgbvxdwfguewfw];
    }
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor =[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [NSClassFromString(@"yntySportBaseTabbarViewController") new];
    if([ZCLibClient getZCLibClient].libInitInfo == nil){
        [ZCLibClient getZCLibClient].libInitInfo = [ZCLibInitInfo new];
    }
    [[ZCLibClient getZCLibClient] initSobotSDK:@"a3967ccf35bc49bcba61fe6c43765aa2" host:nil result:^(id object) {
        
    }];

    return YES;
}

-(void)yntySportdakftsjfgbvxdwfguewfw{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        yntyHomeYundonModel * yntymdoels =[[yntyHomeYundonModel alloc]init];
        yntymdoels.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.jingtop.com%2FUploadFiles%2Fimg_1_2667325055_866859008_26.jpg&refer=http%3A%2F%2Fwww.jingtop.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024778&t=30b534b98c2430b6a6042f5cdc8315fd";
        yntymdoels.type = 1;
        yntymdoels.name = @"思诚室内篮球馆";
        yntymdoels.price = @"¥ 140/h";
        yntymdoels.currentpirce = @"¥ 125/h";
        yntymdoels.stareNum  = 4;
        yntymdoels.isColltecd = NO;
        yntymdoels.isyuyue = NO;
        yntymdoels.adress = @"长庆体育场路凯喜雅大厦西50米";
        yntymdoels.peopleNum = @"500";
        yntymdoels.phone = @"16098657481";
        yntymdoels.ContentID = 0 ;
        [WHC_ModelSqlite insert:yntymdoels];
        
        
        yntyHomeYundonModel * yntymdoels1 =[[yntyHomeYundonModel alloc]init];
        yntymdoels1.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.hngeruisi.com%2Fuploadphoto%2Feditphoto%2Fimage%2F20180709%2F1531123265177427.jpg&refer=http%3A%2F%2Fwww.hngeruisi.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024825&t=fb56e4d4ca94c333f8ae2956d6e7dd5b";
        yntymdoels1.name = @"康康足球场";
        yntymdoels1.type = 0;
        yntymdoels1.price = @"¥ 120/h";
        yntymdoels1.currentpirce = @"¥ 115/h";
        yntymdoels1.stareNum  = 3;
        yntymdoels1.isColltecd = NO;
        yntymdoels1.isyuyue = NO;
        yntymdoels1.adress = @"滨江区奥运路";
        yntymdoels1.peopleNum = @"300";
        yntymdoels1.phone = @"16098657481";
        yntymdoels1.ContentID = 1 ;
        [WHC_ModelSqlite insert:yntymdoels1];
        
        
        yntyHomeYundonModel * yntymdoels2 =[[yntyHomeYundonModel alloc]init];
        yntymdoels2.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnewgame.yzz.cn%2Fpublic%2Fimages%2F100613%2F92_135708_1.jpg&refer=http%3A%2F%2Fnewgame.yzz.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024859&t=4a72fd331cbd1feb524455a8db801a3a";
        yntymdoels2.name = @"蓝翔室外篮球场";
        yntymdoels2.type = 1;
        yntymdoels2.price = @"¥ 120/h";
        yntymdoels2.currentpirce = @"¥ 115/h";
        yntymdoels2.stareNum  = 3;
        yntymdoels2.isColltecd = NO;
        yntymdoels2.isyuyue = NO;
        yntymdoels2.adress = @"滨江区奥运路";
        yntymdoels2.peopleNum = @"27";
        yntymdoels2.phone = @"16098657481";
        yntymdoels2.ContentID = 2 ;
        [WHC_ModelSqlite insert:yntymdoels2];
        
        
        yntyHomeYundonModel * yntymdoels3 =[[yntyHomeYundonModel alloc]init];
        yntymdoels3.img = @"https://img0.baidu.com/it/u=1063931493,594501915&fm=26&fmt=auto&gp=0.jpg";
        yntymdoels3.name = @"优力羽毛球馆";
        yntymdoels3.type = 2;
        yntymdoels3.price = @"¥ 100/h";
        yntymdoels3.currentpirce = @"¥ 109/h";
        yntymdoels3.stareNum  = 4;
        yntymdoels3.isColltecd = NO;
        yntymdoels3.isyuyue = NO;
        yntymdoels3.adress = @"临丁路与笕丁路交叉路口往北约100米";
        yntymdoels3.peopleNum = @"40";
        yntymdoels3.phone = @"17856359786";
        yntymdoels3.ContentID = 3 ;
        [WHC_ModelSqlite insert:yntymdoels3];
        
        
        yntyHomeYundonModel * yntymdoels4 =[[yntyHomeYundonModel alloc]init];
        yntymdoels4.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170824%2Fbd2fb6b65a3f4a8e923200cb7b7253d7.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024897&t=3593faa38abe44c110f557b401e03a2a";
        yntymdoels4.name = @"力扬羽毛球馆";
        yntymdoels4.type = 2;
        yntymdoels4.price = @"¥ 80/h";
        yntymdoels4.currentpirce = @"¥ 45/h";
        yntymdoels4.stareNum  = 5;
        yntymdoels4.isColltecd = NO;
        yntymdoels4.isyuyue = NO;
        yntymdoels4.adress = @"映荷街与月荷路交叉路口往东约100米";
        yntymdoels4.peopleNum = @"45";
        yntymdoels4.phone = @"18967554756";
        yntymdoels4.ContentID = 4 ;
        [WHC_ModelSqlite insert:yntymdoels4];

        
        yntyHomeYundonModel * yntymdoels6 =[[yntyHomeYundonModel alloc]init];
        yntymdoels6.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181019%2Fd11966d20df646e8ba58b05781b80655.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024917&t=a7fa8c9d9dfa91059949b71fd9eb0698";
        yntymdoels6.name = @"飞科室内篮球馆";
        yntymdoels6.type = 1;
        yntymdoels6.price = @"¥ 140/h";
        yntymdoels6.currentpirce = @"¥ 121/h";
        yntymdoels6.stareNum  = 3;
        yntymdoels6.isColltecd = YES;
        yntymdoels6.isyuyue = NO;
        yntymdoels6.adress = @"体育场路与刀茅巷交叉口东南50米";
        yntymdoels6.peopleNum = @"80";
        yntymdoels6.phone = @"16787649776";
        yntymdoels6.ContentID = 5 ;
        [WHC_ModelSqlite insert:yntymdoels6];
        
        yntyHomeYundonModel * yntymdoels7 =[[yntyHomeYundonModel alloc]init];
        yntymdoels7.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2F8K5l1BtYTimiCQPbcfTUuKvZvPWqlplwPGV53iE44tf-n0We3JAhTiwMlNzLxSMvTYGVDmosZWTLal1WbWRW3A.jpg&refer=http%3A%2F%2Fqcloud.dpfile.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024959&t=fde06ab346bf5208e8eeb7e495206394";
        yntymdoels7.name = @"过路者羽毛馆";
        yntymdoels7.type = 2;
        yntymdoels7.price = @"¥ 140/h";
        yntymdoels7.currentpirce = @"¥ 121/h";
        yntymdoels7.stareNum  = 3;
        yntymdoels7.isColltecd = NO;
        yntymdoels7.isyuyue = NO;
        yntymdoels7.adress = @"体育场路与刀茅巷交叉口东南50米";
        yntymdoels7.peopleNum = @"110";
        yntymdoels7.phone = @"16787649776";
        yntymdoels7.ContentID = 6 ;
        [WHC_ModelSqlite insert:yntymdoels7];
        
        
        yntyHomeYundonModel * yntymdoels8 =[[yntyHomeYundonModel alloc]init];
        yntymdoels8.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fqcloud.dpfile.com%2Fpc%2FaLSYYg0Tg7Ue8sanjd34mv8Q3IP67huwz1_ugiqiBDfG8He3lPfjFCARXQQNeUTPTYGVDmosZWTLal1WbWRW3A.jpg&refer=http%3A%2F%2Fqcloud.dpfile.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024959&t=cf5f0e3495f2e00498f07df705e39894";
        yntymdoels8.name = @"美达羽毛球馆";
        yntymdoels8.type = 2;
        yntymdoels8.price = @"¥ 110/h";
        yntymdoels8.currentpirce = @"¥ 89/h";
        yntymdoels8.stareNum  = 4;
        yntymdoels8.isColltecd = YES;
        yntymdoels8.isyuyue = NO;
        yntymdoels8.adress = @"体育场路宝善宾馆写字楼(宝善公寓西南)";
        yntymdoels8.peopleNum = @"90";
        yntymdoels8.phone = @"18976648673";
        yntymdoels8.ContentID = 7 ;
        [WHC_ModelSqlite insert:yntymdoels8];

        
        yntyHomeYundonModel * yntymdoels9 =[[yntyHomeYundonModel alloc]init];
        yntymdoels9.img = @"https://img1.baidu.com/it/u=2454882898,1864616398&fm=224&fmt=auto&gp=0.jpg";
        yntymdoels9.name = @"三峰羽毛球馆";
        yntymdoels9.price = @"¥ 90/h";
        yntymdoels9.type = 2;
        yntymdoels9.currentpirce = @"¥ 67/h";
        yntymdoels9.stareNum  = 5;
        yntymdoels9.isColltecd = NO;
        yntymdoels9.isyuyue = NO;
        yntymdoels9.adress = @"潮鸣环城东路市红会医院北公交站";
        yntymdoels9.peopleNum = @"120";
        yntymdoels9.phone = @"18764586763";
        yntymdoels9.ContentID = 8 ;
        [WHC_ModelSqlite insert:yntymdoels9];
        
        
        yntyHomeYundonModel * yntymdoels10 =[[yntyHomeYundonModel alloc]init];
        yntymdoels10.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg009.hc360.cn%2Fk2%2FM09%2FF0%2F38%2Feh3DEA1466F02559608FB0D9F62E77A942.jpg&refer=http%3A%2F%2Fimg009.hc360.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024959&t=3b1b3d30512e8e5d555e8babff87367a";
        yntymdoels10.name = @"优力羽毛球馆";
        yntymdoels10.type = 2;
        yntymdoels10.price = @"¥ 120/h";
        yntymdoels10.currentpirce = @"¥ 80/h";
        yntymdoels10.stareNum  = 4;
        yntymdoels10.isColltecd = NO;
        yntymdoels10.isyuyue = NO;
        yntymdoels10.adress = @"黄龙恒励大厦(黄龙体育中心体育馆东)";
        yntymdoels10.peopleNum = @"210";
        yntymdoels10.phone = @"17697563597";
        yntymdoels10.ContentID = 9 ;
        [WHC_ModelSqlite insert:yntymdoels10];
        
        
        yntyHomeYundonModel * yntymdoels11 =[[yntyHomeYundonModel alloc]init];
        yntymdoels11.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic18_3.qiyeku.com%2Fqiyeku_pic%2F2018%2F9%2F19%2Fsyjatyss%2Fproduct%2Fproduct_pic%2Fimage%2F2018_12_04%2F20181204050554046.jpg&refer=http%3A%2F%2Fpic18_3.qiyeku.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627024959&t=64f7e3719266f81b6aa9850dffce4dec";
        yntymdoels11.name = @"绿土羽毛球馆";
        yntymdoels1.type = 2;
        yntymdoels11.price = @"¥ 110/h";
        yntymdoels11.currentpirce = @"¥ 60/h";
        yntymdoels11.stareNum  = 3;
        yntymdoels11.isColltecd = NO;
        yntymdoels11.isyuyue = NO;
        yntymdoels11.adress = @"健康路1号汇金租赁大厦10楼体育场路丝绸市场东入口";
        yntymdoels11.peopleNum = @"180";
        yntymdoels11.phone = @"15068769462";
        yntymdoels11.ContentID = 10 ;
        [WHC_ModelSqlite insert:yntymdoels11];


        
        yntyHomeYundonModel * yntymdoels12 =[[yntyHomeYundonModel alloc]init];
        yntymdoels12.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.mp.itc.cn%2Fq_70%2Cc_zoom%2Cw_640%2Fupload%2F20161020%2F0d384bf6832047189bd96861a99acb6c_th.jpeg&refer=http%3A%2F%2Fimg.mp.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025030&t=3d37f5406c4ad7696980992eaf37eb8d";
        yntymdoels12.name = @"正能量篮球馆";
        yntymdoels12.price = @"¥ 241/h";
        yntymdoels12.type = 1;
        yntymdoels12.currentpirce = @"¥ 200/h";
        yntymdoels12.stareNum  = 4;
        yntymdoels12.isColltecd = NO;
        yntymdoels12.isyuyue = NO;
        yntymdoels12.adress = @"莫干山路双荡弄120号杭州市拱墅区体育馆";
        yntymdoels12.peopleNum = @"187";
        yntymdoels12.phone = @"1586793762";
        yntymdoels12.ContentID = 11;
        [WHC_ModelSqlite insert:yntymdoels12];

        
        yntyHomeYundonModel * yntymdoels13 =[[yntyHomeYundonModel alloc]init];
        yntymdoels13.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn00%2F560%2Fw960h1200%2F20180910%2F229b-hivtsyk7703276.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025030&t=75a25d6ae1792d04dae00129f5dea23c";
        yntymdoels13.name = @"梦之旅篮球馆";
        yntymdoels13.type = 1;
        yntymdoels13.price = @"¥ 340/h";
        yntymdoels13.currentpirce = @"¥ 290/h";
        yntymdoels13.stareNum  = 5;
        yntymdoels13.isColltecd = NO;
        yntymdoels13.isyuyue = NO;
        yntymdoels13.adress = @"上塘路329号";
        yntymdoels13.peopleNum = @"210";
        yntymdoels13.phone = @"18563971233";
        yntymdoels13.ContentID = 12 ;
        [WHC_ModelSqlite insert:yntymdoels13];


        yntyHomeYundonModel * yntymdoels14 =[[yntyHomeYundonModel alloc]init];
        yntymdoels14.img = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic4.zhimg.com%2Fv2-eeb11033f4d17db966897691be8a9da8_1200x500.jpg&refer=http%3A%2F%2Fpic4.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025030&t=d40ef8a20c9580da8a540e4bb4d41c91";
        yntymdoels14.name = @"加速度篮球馆";
        yntymdoels14.type = 1;
        yntymdoels14.price = @"¥ 340/h";
        yntymdoels14.currentpirce = @"¥ 290/h";
        yntymdoels14.stareNum  = 5;
        yntymdoels14.isColltecd = NO;
        yntymdoels14.isyuyue = NO;
        yntymdoels14.adress = @"上塘路329号";
        yntymdoels14.peopleNum = @"210";
        yntymdoels14.phone = @"18563971233";
        yntymdoels14.ContentID = 13 ;
        [WHC_ModelSqlite insert:yntymdoels14];
    });
}
-(void)yntySportdongtaiConfigsaf{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangboyHangqingModel * yntyhzndie = [[keqiangboyHangqingModel alloc]init];
           yntyhzndie.name = @"Wristcutter";
           yntyhzndie.header = @"https://img1.doubanio.com/icon/u2095344-17.jpg";
           yntyhzndie.time = @"2021-06-22 16:00";
           yntyhzndie.content = @"1982年，中国刚刚结束文革不久，也正处于改革开放的初期\n中国国家队在苏永舜的带领下，差点杀进西班牙世界杯。当时整个亚太区只有一个出线名额，中国队最早结束比赛，以为小组第一已经笃定，结果马放南山，但沙特队0比5惨败于新西兰，导致中国队和新西兰要进行附加赛，准备不足的中国队饮恨而归；\n1985年，曾雪麟率领的国家队上演了5.19，小组赛被淘汰；\n1989年，高丰文率领的国家队在新加坡，两度遭遇黑色三分钟，只差一步到罗马；\n另外，高丰文率领的国家队在1988年的汉城奥运会预选赛中，力克日本队，最终进入决赛圈。\n亚洲杯的比赛中，曾雪麟的国家队在1984年获得亚军，高丰文的国家队1988年进入前四。\n翻一翻老黄历，整个80年代，虽然有5.19这样的阴沟翻船，但从国家队的整体表现看，稳居亚洲一流，同时，从整个亚洲的格局看，韩国队是稳定的霸主，中国队略逊一筹，但和其他亚洲一流强队相比，可谓不相伯仲。";
           yntyhzndie.photos = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdpic.tiankong.com%2Fvs%2Fh8%2FQJ8858412057.jpg&refer=http%3A%2F%2Fdpic.tiankong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025279&t=8d19a6523e5cb10390996686b08a9e93",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdpic.tiankong.com%2Fwd%2Fgr%2FQJ8736406748.jpg&refer=http%3A%2F%2Fdpic.tiankong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025279&t=25e9bac358c2f073273c1d2f32335021"].mutableCopy;
           yntyhzndie.adress = @"厦门市.长虹路";
           yntyhzndie.contentID =  0;
           yntyhzndie.isZan = NO;
           yntyhzndie.zanNum = 12;
           yntyhzndie.Cellheight = 0;
           [WHC_ModelSqlite insert:yntyhzndie];
           
        
           
           keqiangboyHangqingModel * yntyhzndie1 = [[keqiangboyHangqingModel alloc]init];
           yntyhzndie1.name = @"周五的炸豆腐";
           yntyhzndie1.header = @"https://img9.doubanio.com/icon/u62204661-4.jpg";
           yntyhzndie1.time = @"2021-06-22 12:13";
           yntyhzndie1.content = @"今治的海景爱媛小城今治的海景\n作为日本无数小城中的一员，今治最出名的，只有从1894年就开始生产、畅销全日本的“今治毛巾”了。\n2014年，58岁的冈田武史踏上这里，买下今治市附属的一支业余足球队——今治FC队51%的股份，当起了小老板，喊出了令全世界震惊的口号：\n十年内在J1联赛成为一支可以经常争夺冠军的球队，并以亚冠夺冠为目标；\n十年内从今治FC队培养5名日本国脚！";
           yntyhzndie1.photos = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F02imgmini.eastday.com%2Fmobile%2F20180828%2F20180828200332_e10bc4dc173155ed8b0c9ff6e6caa260_2.jpeg&refer=http%3A%2F%2F02imgmini.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025279&t=7d0206c15ad7996d950c8107388f7f59"].mutableCopy;
           yntyhzndie1.adress = @"丽水市.中东路";
           yntyhzndie1.contentID =  1;
           yntyhzndie1.isZan = NO;
           yntyhzndie1.zanNum = 21;
           yntyhzndie1.Cellheight = 0;
           [WHC_ModelSqlite insert:yntyhzndie1];
           

           keqiangboyHangqingModel * yntyhzndie2 = [[keqiangboyHangqingModel alloc]init];
           yntyhzndie2.name = @"蜗(♩￢3￢)";
           yntyhzndie2.header = @"https://img9.doubanio.com/icon/u38648243-35.jpg";
           yntyhzndie2.time = @"2021-05-22 10:57";
           yntyhzndie2.content = @"凯帕出道于毕尔巴鄂竞技青训，2012年，他加入毕尔巴鄂竞技U19梯队。2015/16赛季，凯帕被租借至巴拉多利德队效力一年。2016/17赛季，凯帕重返毕巴，在当赛季西甲联赛中出场23次。2017/18赛季，凯帕在西甲联赛中为毕巴出场30次。当赛季毕巴位列西甲第16位，失49球 [3]  。2018年8月9日，英超豪门切尔西官方宣布，西班牙门将凯帕加盟球队，双方签订7年合约。据英国媒体《BBC》报道，切尔西为他支付了8000万欧元的解约金，凯帕成为新的世界足坛最贵门将，打破了阿利松创造的7250万欧元的门将最高转会费纪录 [2]  。 阿利松出道于巴西国际足球俱乐部青训，2013年2月他首次代表一线队出场 [1]  。2016年7月，阿利松登陆欧洲加盟意甲罗马足球俱乐部，并在2017-18赛季成为主力门将，帮助球队闯入欧冠四强，个人获得意甲赛季最佳门将，在欧冠赛季最佳门将的3人候选中排名第二，并入选意甲与欧冠的赛季最佳阵容 [2-7]  。2018年7月，阿利松以7250万欧元的身价加盟英超利物浦足球俱乐部，打破世界足坛门将转会费纪录。";
           yntyhzndie2.photos = @[].mutableCopy;
           yntyhzndie2.adress = @"成都市.府兴路";
           yntyhzndie2.contentID =  2;
           yntyhzndie2.isZan = NO;
           yntyhzndie2.zanNum = 19;
           yntyhzndie2.Cellheight = 0;
           [WHC_ModelSqlite insert:yntyhzndie2];

           
           keqiangboyHangqingModel * yntyhzndie3 = [[keqiangboyHangqingModel alloc]init];
           yntyhzndie3.name = @"实干型野心家";
           yntyhzndie3.header = @"https://img3.doubanio.com/icon/u67398855-40.jpg";
           yntyhzndie3.time = @"2020-09-22 11:57";
           yntyhzndie3.content = @"现在美国最出名的韩国人是孙兴慜还是柳贤振？ 由  多伦多德皇 \n不算bts，毕竟是组合。 有在美国的朋友亲身说法吗。";
           yntyhzndie3.photos = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.jj20.com%2Fup%2Fallimg%2F511%2F110311115150%2F111103115150-11.jpg&refer=http%3A%2F%2Fpic.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025279&t=815dd45578a4d38228825cecd8f36875",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F06imgmini.eastday.com%2Fmobile%2F20180830%2F20180830232552_c40237179afe7ef1bb53a349fcb507fd_6.jpeg&refer=http%3A%2F%2F06imgmini.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025279&t=170359b067976763af8f757ed9699cf8"].mutableCopy;
           yntyhzndie3.adress = @"成都市.五块石";
           yntyhzndie3.contentID =  3;
           yntyhzndie3.isZan = NO;
           yntyhzndie3.zanNum = 31;
           yntyhzndie3.Cellheight = 0;
           [WHC_ModelSqlite insert:yntyhzndie3];
           
           keqiangboyHangqingModel * yntyhzndie4 = [[keqiangboyHangqingModel alloc]init];
             yntyhzndie4.name = @"Kris™在路上";
             yntyhzndie4.header = @"https://img2.doubanio.com/icon/u36395978-13.jpg";
             yntyhzndie4.time = @"2020-09-22 11:57";
             yntyhzndie4.content = @"利物浦在上赛季夺得队史首次英超冠军，本赛季英超，利物浦将开启卫冕征程。利物浦在今年夏窗对阵容进行补强，最近利物浦相继官宣了蒂亚戈和若塔两名重磅引援，中前场的实力得到明显提升。新赛季英超前两轮，利物浦也取得两连胜，在第2轮与切尔西的强强对话中，利物浦2-0完胜蓝军，展现出强大的实力。新援蒂亚戈也在这场比赛上演了他在利物浦的首秀，表现可圈可点。";
             yntyhzndie4.photos = @[@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F06.imgmini.eastday.com%2Fmobile%2F20180814%2F20180814222224_9b98029bd0d2892bc66884d0d95450f7_15.jpeg&refer=http%3A%2F%2F06.imgmini.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025367&t=2e5e6e7a8f7b8fee21db12de7183a82b",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2F01imgmini.eastday.com%2Fmobile%2F20180828%2F20180828231304_6c3dcc244a840d49c5d6100093506b30_19.jpeg&refer=http%3A%2F%2F01imgmini.eastday.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627025367&t=d1ada5e015f1573fd28ba9efeb6e8043"].mutableCopy;
             yntyhzndie4.adress = @"成都市.五块石";
             yntyhzndie4.contentID =  4;
             yntyhzndie4.isZan = NO;
             yntyhzndie4.zanNum = 10;
             yntyhzndie4.Cellheight = 0;
             [WHC_ModelSqlite insert:yntyhzndie4];
    });
}
-(void)yntySportxisgdenidhaisffsear{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangboyDetailComenrModle * yntydghitms = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms.name = @"游鱼杂货铺";
           yntydghitms.header = @"https://q.qlogo.cn/qqapp/100245713/82269342587495D7AC66BFF82F4C6325/100?imageView2/1/w/120/h/120";
           yntydghitms.contetn = @"我很讨厌规划、说好的全华班 最后变成了全规划班！ 但是 中国足球自己不争气啊……";
           yntydghitms.time = @"2020-09-22 16:03";
           yntydghitms.ContentID = 0;
           yntydghitms.isZan = NO;
           yntydghitms.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms];
           
           keqiangboyDetailComenrModle * yntydghitms1 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms1.name = @"四井啊";
           yntydghitms1.header = @"https://avatar.wacdn.com/130a30e1ce774babbdaf454d11fde950.jpg?imageView2/1/w/120/h/120";
           yntydghitms1.contetn = @"学来学去，啥也没学到，反而把自己的优势丢掉了。";
           yntydghitms1.time = @"2020-09-22 16:00";
           yntydghitms1.ContentID = 0;
           yntydghitms1.isZan = NO;
           yntydghitms1.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms1];

           keqiangboyDetailComenrModle * yntydghitms2 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms2.name = @"诸葛匹夫王钢蛋";
           yntydghitms2.header = @"https://avatar.wacdn.com/5a239b297cf5457e960808cd9db899e5?imageView2/1/w/120/h/120";
           yntydghitms2.contetn = @"“爸爸爸爸，我想踢足球！” “好孩子，你为什么要踢足球？” “我要为国争光！” “傻孩子，你进不了国家队的，还是放弃吧”";
           yntydghitms2.time = @"2020-09-22 16:22";
           yntydghitms2.ContentID = 0;
           yntydghitms2.isZan = NO;
           yntydghitms2.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms2];
           
           keqiangboyDetailComenrModle * yntydghitms3 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms3.name = @"小猪管着饲养员";
           yntydghitms3.header = @"https://avatar.wacdn.com/42b88b6ca5015db8d8e42df81263faf.jpg?imageView2/1/w/120/h/120";
           yntydghitms3.contetn = @"时至冈田从绿城回日本，有幸曾经在公司的全体会议上现场聆听过他的演讲。无疑，人生在世，设定的目标，不可能每一个都能实现。而他是一个敢于当着全世界的面，喊出自己梦想，而后倒逼自己拼尽全力去实现的人。而现实中的大多数人，只是怯懦的躲在自己的舒适区里，等着看别人的笑话，仿佛那就是他们的梦想一样。";
           yntydghitms3.time = @"2020-09-22 13:38 ";
           yntydghitms3.ContentID = 1;
           yntydghitms3.isZan = NO;
           yntydghitms3.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms3];
           
           
           keqiangboyDetailComenrModle * yntydghitms4 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms4.name = @"阿里爸爸4567";
           yntydghitms4.header = @"https://avatar.wacdn.com/0f416939a4146c33f34f22eea0749c8.jpg?imageView2/1/w/120/h/120";
           yntydghitms4.contetn = @"现在我破城还有不少日本青训教练，每年小球员还都去日本训练啥的，都是当年冈田留下的遗产";
           yntydghitms4.time = @"2020-09-22 12:42";
           yntydghitms4.ContentID = 1;
           yntydghitms4.isZan = NO;
           yntydghitms4.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms4];

           keqiangboyDetailComenrModle * yntydghitms5 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms5.name = @"铁面柔情莫雷诺";
           yntydghitms5.header = @"https://avatar.wacdn.com/dcd213ea549d95ab5dc3c1fed398258.jpg?imageView2/1/w/120/h/120";
           yntydghitms5.contetn = @"当时破车挨宰是必然的，问题是为啥买凯帕？八千万除了几个豪门功勋，砸门将几乎可以随便砸，比如钱多多";
           yntydghitms5.time = @"2020-09-22 11:16";
           yntydghitms5.ContentID = 2;
           yntydghitms5.isZan = NO;
           yntydghitms5.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms5];
           
           keqiangboyDetailComenrModle * yntydghitms6 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms6.name = @"马原原";
           yntydghitms6.header = @"https://avatar.wacdn.com/d0b92591066a804df2e32db94705e79.jpg?imageView2/1/w/120/h/120";
           yntydghitms6.contetn = @"人家的意思是……毕巴原来应该是中游球队，有了凯教练才到保级区";
           yntydghitms6.time = @"2020-09-22 11:17";
           yntydghitms6.ContentID = 2;
           yntydghitms6.isZan = NO;
           yntydghitms6.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms6];
           
           keqiangboyDetailComenrModle * yntydghitms7 = [[keqiangboyDetailComenrModle alloc]init];
           yntydghitms7.name = @"cheasona";
           yntydghitms7.header = @"https://avatar.wacdn.com/5a16993b0ef90352d035b33744f1e9a.jpg?imageView2/1/w/120/h/120";
           yntydghitms7.contetn = @"美国人看soccer的那么少，我觉得这个答案不言自明。 ";
           yntydghitms7.time = @"2020-09-22 12:02";
           yntydghitms7.ContentID = 3;
           yntydghitms7.isZan = NO;
           yntydghitms7.Cellheight = 0 ;
           [WHC_ModelSqlite insert:yntydghitms7];
    });

}
@end
