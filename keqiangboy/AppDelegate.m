//
//  AppDelegate.m
//  keqiangboy
//
//  Created by codehzx on 2020/9/22.
//  Copyright © 2020 keqiangboy. All rights reserved.
//

#import "AppDelegate.h"
#import "keqiangboyHangqingModel.h"
#import "keqiangboyDetailComenrModle.h"
#import <SobotKit/SobotKit.h>
#import "keqiangChangdiModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [UMConfigure initWithAppkey:@"5f6bfe10906ad8111712ad80" channel:@"App Store"];
    NSString * keqiangboy = [[NSUserDefaults standardUserDefaults] objectForKey:@"keqiangboy"];
    if (![keqiangboy isEqualToString:@"1"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"keqiangboy"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self keqiangboyHangqingModelConfigers];
        [self gaoxiangqingFindDetailModelConfiherModels];
        [self keqiangboyHangqingConfierWithModels];
    }
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor =[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [NSClassFromString(@"keqiangboybaseTabbarViewController") new];
    if([ZCLibClient getZCLibClient].libInitInfo == nil){
        [ZCLibClient getZCLibClient].libInitInfo = [ZCLibInitInfo new];
    }
    [[ZCLibClient getZCLibClient] initSobotSDK:@"a3967ccf35bc49bcba61fe6c43765aa2" host:nil result:^(id object) {
        
    }];

    return YES;
}

-(void)keqiangboyHangqingConfierWithModels{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangChangdiModel * keqiangModel =[[keqiangChangdiModel alloc]init];
        keqiangModel.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600848954034&di=9efab159ea4a2a84ae278151d29508d6&imgtype=0&src=http%3A%2F%2Fstatic-xiaoguotu.17house.com%2Fxgt%2Ft%2F00%2F1462378684124.jpg";
        keqiangModel.type = 1;
        keqiangModel.name = @"思诚室内篮球馆";
        keqiangModel.price = @"¥ 140/h";
        keqiangModel.currentpirce = @"¥ 125/h";
        keqiangModel.stareNum  = 4;
        keqiangModel.isColltecd = NO;
        keqiangModel.isyuyue = NO;
        keqiangModel.adress = @"长庆体育场路凯喜雅大厦西50米";
        keqiangModel.peopleNum = @"500";
        keqiangModel.phone = @"16098657481";
        keqiangModel.ContentID = 0 ;
        [WHC_ModelSqlite insert:keqiangModel];
        
        
        keqiangChangdiModel * keqiangModel1 =[[keqiangChangdiModel alloc]init];
        keqiangModel1.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600849406436&di=c72e57717732de01e26268afebd73954&imgtype=0&src=http%3A%2F%2Fdpic.tiankong.com%2Fm7%2Ff5%2FQJ8854966667.jpg";
        keqiangModel1.name = @"康康足球场";
        keqiangModel1.type = 0;
        keqiangModel1.price = @"¥ 120/h";
        keqiangModel1.currentpirce = @"¥ 115/h";
        keqiangModel1.stareNum  = 3;
        keqiangModel1.isColltecd = NO;
        keqiangModel1.isyuyue = NO;
        keqiangModel1.adress = @"滨江区奥运路";
        keqiangModel1.peopleNum = @"300";
        keqiangModel1.phone = @"16098657481";
        keqiangModel1.ContentID = 1 ;
        [WHC_ModelSqlite insert:keqiangModel1];
        
        
        keqiangChangdiModel * keqiangModel2 =[[keqiangChangdiModel alloc]init];
        keqiangModel2.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600851042341&di=f10752d0c7f642e1d128ddcf14c482a7&imgtype=0&src=http%3A%2F%2Fwww.boger-sport.com%2Fupload%2Fcase%2F1494523739043095175.jpg";
        keqiangModel2.name = @"蓝翔室外篮球场";
        keqiangModel2.type = 1;
        keqiangModel2.price = @"¥ 120/h";
        keqiangModel2.currentpirce = @"¥ 115/h";
        keqiangModel2.stareNum  = 3;
        keqiangModel2.isColltecd = NO;
        keqiangModel2.isyuyue = NO;
        keqiangModel2.adress = @"滨江区奥运路";
        keqiangModel2.peopleNum = @"27";
        keqiangModel2.phone = @"16098657481";
        keqiangModel2.ContentID = 2 ;
        [WHC_ModelSqlite insert:keqiangModel2];
        
        
        keqiangChangdiModel * keqiangModel3 =[[keqiangChangdiModel alloc]init];
        keqiangModel3.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600849603799&di=ffbf4eeeca7d20ff42d0cd9b77fdeb87&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170624%2Fef3e431e8e954c32836937cf8649ee52_th.png";
        keqiangModel3.name = @"优力羽毛球馆";
        keqiangModel3.type = 2;
        keqiangModel3.price = @"¥ 100/h";
        keqiangModel3.currentpirce = @"¥ 109/h";
        keqiangModel3.stareNum  = 4;
        keqiangModel3.isColltecd = NO;
        keqiangModel3.isyuyue = NO;
        keqiangModel3.adress = @"临丁路与笕丁路交叉路口往北约100米";
        keqiangModel3.peopleNum = @"40";
        keqiangModel3.phone = @"17856359786";
        keqiangModel3.ContentID = 3 ;
        [WHC_ModelSqlite insert:keqiangModel3];
        
        
        keqiangChangdiModel * keqiangModel4 =[[keqiangChangdiModel alloc]init];
        keqiangModel4.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600849603796&di=e702e8da5aeab44e47096eb3ae20a9cc&imgtype=0&src=http%3A%2F%2Fimg007.hc360.cn%2Fm6%2FM0A%2F56%2FA5%2FwKhQoVbnbXGEBqqnAAAAABRTRKM515.jpg";
        keqiangModel4.name = @"力扬羽毛球馆";
        keqiangModel4.type = 2;
        keqiangModel4.price = @"¥ 80/h";
        keqiangModel4.currentpirce = @"¥ 45/h";
        keqiangModel4.stareNum  = 5;
        keqiangModel4.isColltecd = NO;
        keqiangModel4.isyuyue = NO;
        keqiangModel4.adress = @"映荷街与月荷路交叉路口往东约100米";
        keqiangModel4.peopleNum = @"45";
        keqiangModel4.phone = @"18967554756";
        keqiangModel4.ContentID = 4 ;
        [WHC_ModelSqlite insert:keqiangModel4];

        
        keqiangChangdiModel * keqiangModel6 =[[keqiangChangdiModel alloc]init];
        keqiangModel6.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600849861746&di=ff9ace3b1a33ecb2d24e6015de5c48b7&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F19%2F20150319223505_ac4Ay.thumb.700_0.jpeg";
        keqiangModel6.name = @"飞科室内篮球馆";
        keqiangModel6.type = 1;
        keqiangModel6.price = @"¥ 140/h";
        keqiangModel6.currentpirce = @"¥ 121/h";
        keqiangModel6.stareNum  = 3;
        keqiangModel6.isColltecd = YES;
        keqiangModel6.isyuyue = NO;
        keqiangModel6.adress = @"体育场路与刀茅巷交叉口东南50米";
        keqiangModel6.peopleNum = @"80";
        keqiangModel6.phone = @"16787649776";
        keqiangModel6.ContentID = 5 ;
        [WHC_ModelSqlite insert:keqiangModel6];
        
        keqiangChangdiModel * keqiangModel7 =[[keqiangChangdiModel alloc]init];
        keqiangModel7.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600918283980&di=eb164c5ab0493d35f494c76d3e6f66b8&imgtype=0&src=http%3A%2F%2Fwww.crifan.com%2Ffiles%2Fpic%2Fuploads%2F2014%2F08%2F20120915_195715_thumb.jpg";
        keqiangModel7.name = @"过路者羽毛馆";
        keqiangModel7.type = 2;
        keqiangModel7.price = @"¥ 140/h";
        keqiangModel7.currentpirce = @"¥ 121/h";
        keqiangModel7.stareNum  = 3;
        keqiangModel7.isColltecd = NO;
        keqiangModel7.isyuyue = NO;
        keqiangModel7.adress = @"体育场路与刀茅巷交叉口东南50米";
        keqiangModel7.peopleNum = @"110";
        keqiangModel7.phone = @"16787649776";
        keqiangModel7.ContentID = 6 ;
        [WHC_ModelSqlite insert:keqiangModel7];
        
        
        keqiangChangdiModel * keqiangModel8 =[[keqiangChangdiModel alloc]init];
        keqiangModel8.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600850424701&di=197e86425e96943735bd0695dd42369c&imgtype=0&src=http%3A%2F%2Fimg004.hc360.cn%2Fk2%2FM01%2FFF%2FFF%2FwKhQxFs033SENeo_AAAAAMSMd6o838.jpg";
        keqiangModel8.name = @"美达羽毛球馆";
        keqiangModel8.type = 2;
        keqiangModel8.price = @"¥ 110/h";
        keqiangModel8.currentpirce = @"¥ 89/h";
        keqiangModel8.stareNum  = 4;
        keqiangModel8.isColltecd = YES;
        keqiangModel8.isyuyue = NO;
        keqiangModel8.adress = @"体育场路宝善宾馆写字楼(宝善公寓西南)";
        keqiangModel8.peopleNum = @"90";
        keqiangModel8.phone = @"18976648673";
        keqiangModel8.ContentID = 7 ;
        [WHC_ModelSqlite insert:keqiangModel8];

        
        keqiangChangdiModel * keqiangModel9 =[[keqiangChangdiModel alloc]init];
        keqiangModel9.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600850424829&di=61b980ba9a3fe90e5663adb14fcf8fca&imgtype=0&src=http%3A%2F%2Fimg.trustexporter.com%2F201702%2F15%2F155650661856762.jpg";
        keqiangModel9.name = @"三峰羽毛球馆";
        keqiangModel9.price = @"¥ 90/h";
        keqiangModel9.type = 2;
        keqiangModel9.currentpirce = @"¥ 67/h";
        keqiangModel9.stareNum  = 5;
        keqiangModel9.isColltecd = NO;
        keqiangModel9.isyuyue = NO;
        keqiangModel9.adress = @"潮鸣环城东路市红会医院北公交站";
        keqiangModel9.peopleNum = @"120";
        keqiangModel9.phone = @"18764586763";
        keqiangModel9.ContentID = 8 ;
        [WHC_ModelSqlite insert:keqiangModel9];
        
        
        keqiangChangdiModel * keqiangModel10 =[[keqiangChangdiModel alloc]init];
        keqiangModel10.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600850424828&di=bd699489b70e102f445d3345ee7d5f2c&imgtype=0&src=http%3A%2F%2Ft-img.51f.com%2Fxf%2Fxw%2F8355ba4d-5875-4c98-977b-79d0cb0837e4.png";
        keqiangModel10.name = @"优力羽毛球馆";
        keqiangModel10.type = 2;
        keqiangModel10.price = @"¥ 120/h";
        keqiangModel10.currentpirce = @"¥ 80/h";
        keqiangModel10.stareNum  = 4;
        keqiangModel10.isColltecd = NO;
        keqiangModel10.isyuyue = NO;
        keqiangModel10.adress = @"黄龙恒励大厦(黄龙体育中心体育馆东)";
        keqiangModel10.peopleNum = @"210";
        keqiangModel10.phone = @"17697563597";
        keqiangModel10.ContentID = 9 ;
        [WHC_ModelSqlite insert:keqiangModel10];
        
        
        keqiangChangdiModel * keqiangModel11 =[[keqiangChangdiModel alloc]init];
        keqiangModel11.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600850424828&di=0f8f3f5f20275284afac52b37a944bb8&imgtype=0&src=http%3A%2F%2Fimg010.hc360.cn%2Fg3%2FM01%2FAA%2F85%2FwKhQvVI39tSEdLqCAAAAABussoM323.jpg";
        keqiangModel11.name = @"绿土羽毛球馆";
        keqiangModel1.type = 2;
        keqiangModel11.price = @"¥ 110/h";
        keqiangModel11.currentpirce = @"¥ 60/h";
        keqiangModel11.stareNum  = 3;
        keqiangModel11.isColltecd = NO;
        keqiangModel11.isyuyue = NO;
        keqiangModel11.adress = @"健康路1号汇金租赁大厦10楼体育场路丝绸市场东入口";
        keqiangModel11.peopleNum = @"180";
        keqiangModel11.phone = @"15068769462";
        keqiangModel11.ContentID = 10 ;
        [WHC_ModelSqlite insert:keqiangModel11];


        
        keqiangChangdiModel * keqiangModel12 =[[keqiangChangdiModel alloc]init];
        keqiangModel12.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600851042345&di=b4b3188ce0cb4d4858d26e57a226ddf2&imgtype=0&src=http%3A%2F%2Fimg05.jdzj.com%2Foledit%2FUploadFile%2Fnews2017y%2Fimage%2F20171231%2F20171231100331173117909127.jpg";
        keqiangModel12.name = @"正能量篮球馆";
        keqiangModel12.price = @"¥ 241/h";
        keqiangModel12.type = 1;
        keqiangModel12.currentpirce = @"¥ 200/h";
        keqiangModel12.stareNum  = 4;
        keqiangModel12.isColltecd = NO;
        keqiangModel12.isyuyue = NO;
        keqiangModel12.adress = @"莫干山路双荡弄120号杭州市拱墅区体育馆";
        keqiangModel12.peopleNum = @"187";
        keqiangModel12.phone = @"1586793762";
        keqiangModel12.ContentID = 11;
        [WHC_ModelSqlite insert:keqiangModel12];

        
        keqiangChangdiModel * keqiangModel13 =[[keqiangChangdiModel alloc]init];
        keqiangModel13.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600851042344&di=7e6aad1c33a6e13f4ae5d518746e93a2&imgtype=0&src=http%3A%2F%2Fwww.dongsport.com%2Fdata%2F45423%2F1472797453964.png";
        keqiangModel13.name = @"梦之旅篮球馆";
        keqiangModel13.type = 1;
        keqiangModel13.price = @"¥ 340/h";
        keqiangModel13.currentpirce = @"¥ 290/h";
        keqiangModel13.stareNum  = 5;
        keqiangModel13.isColltecd = NO;
        keqiangModel13.isyuyue = NO;
        keqiangModel13.adress = @"上塘路329号";
        keqiangModel13.peopleNum = @"210";
        keqiangModel13.phone = @"18563971233";
        keqiangModel13.ContentID = 12 ;
        [WHC_ModelSqlite insert:keqiangModel13];


        keqiangChangdiModel * keqiangModel14 =[[keqiangChangdiModel alloc]init];
        keqiangModel14.img = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600851042341&di=d3119d9461f53447caaf76bf371dce7b&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170804%2F8d84e9a88d90441580c04fdb12aaf330_th.png";
        keqiangModel14.name = @"加速度篮球馆";
        keqiangModel14.type = 1;
        keqiangModel14.price = @"¥ 340/h";
        keqiangModel14.currentpirce = @"¥ 290/h";
        keqiangModel14.stareNum  = 5;
        keqiangModel14.isColltecd = NO;
        keqiangModel14.isyuyue = NO;
        keqiangModel14.adress = @"上塘路329号";
        keqiangModel14.peopleNum = @"210";
        keqiangModel14.phone = @"18563971233";
        keqiangModel14.ContentID = 13 ;
        [WHC_ModelSqlite insert:keqiangModel14];
    });
}
-(void)keqiangboyHangqingModelConfigers{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangboyHangqingModel * hangModel = [[keqiangboyHangqingModel alloc]init];
           hangModel.name = @"白国华";
           hangModel.header = @"https://avatar.wacdn.com/0ad255043e7548cf89a817b23eff594b.jpg?imageView2/1/w/120/h/120";
           hangModel.time = @"2020-09-22 16:00";
           hangModel.content = @"1982年，中国刚刚结束文革不久，也正处于改革开放的初期\n中国国家队在苏永舜的带领下，差点杀进西班牙世界杯。当时整个亚太区只有一个出线名额，中国队最早结束比赛，以为小组第一已经笃定，结果马放南山，但沙特队0比5惨败于新西兰，导致中国队和新西兰要进行附加赛，准备不足的中国队饮恨而归；\n1985年，曾雪麟率领的国家队上演了5.19，小组赛被淘汰；\n1989年，高丰文率领的国家队在新加坡，两度遭遇黑色三分钟，只差一步到罗马；\n另外，高丰文率领的国家队在1988年的汉城奥运会预选赛中，力克日本队，最终进入决赛圈。\n亚洲杯的比赛中，曾雪麟的国家队在1984年获得亚军，高丰文的国家队1988年进入前四。\n翻一翻老黄历，整个80年代，虽然有5.19这样的阴沟翻船，但从国家队的整体表现看，稳居亚洲一流，同时，从整个亚洲的格局看，韩国队是稳定的霸主，中国队略逊一筹，但和其他亚洲一流强队相比，可谓不相伯仲。";
           hangModel.photos = @[@"https://i3.hoopchina.com.cn/blogfile/20209/22/BbsImg_245138415233972_1600742571_s_284514_o_w_452_h_290_71728.png?x-oss-process=image/resize,w_800/",@"https://i4.hoopchina.com.cn/blogfile/20209/22/BbsImg_245138415233972_1600742669_s_3152445_o_w_1532_h_1326_52363.png?x-oss-process=image/resize,w_800/",@"https://i4.hoopchina.com.cn/blogfile/20209/22/BbsImg_245138415233972_1600742801_s_859886_o_w_2560_h_1707_94439.jpg?x-oss-process=image/resize,w_800/"].mutableCopy;
           hangModel.adress = @"厦门市.长虹路";
           hangModel.contentID =  0;
           hangModel.isZan = NO;
           hangModel.zanNum = 12;
           hangModel.Cellheight = 0;
           [WHC_ModelSqlite insert:hangModel];
           
           
           keqiangboyHangqingModel * hangModel1 = [[keqiangboyHangqingModel alloc]init];
           hangModel1.name = @"西北望看台";
           hangModel1.header = @"https://avatar.wacdn.com/1c833d2dfd1c61988b75b02383bf5fd.jpg?imageView2/1/w/120/h/120";
           hangModel1.time = @"2020-09-22 10:13";
           hangModel1.content = @"今治的海景爱媛小城今治的海景\n作为日本无数小城中的一员，今治最出名的，只有从1894年就开始生产、畅销全日本的“今治毛巾”了。\n2014年，58岁的冈田武史踏上这里，买下今治市附属的一支业余足球队——今治FC队51%的股份，当起了小老板，喊出了令全世界震惊的口号：\n十年内在J1联赛成为一支可以经常争夺冠军的球队，并以亚冠夺冠为目标；\n十年内从今治FC队培养5名日本国脚！";
           hangModel1.photos = @[@"https://i1.hoopchina.com.cn/blogfile/20209/22/BbsImg_92609618993162_1600739483_s_353148_o_w_900_h_360_47886.jpg?x-oss-process=image/resize,w_800/",@"https://i5.hoopchina.com.cn/blogfile/20209/22/BbsImg_92609618993162_1600739498_s_161762_o_w_700_h_468_63214.jpg?x-oss-process=image/resize,w_800/",@"https://i5.hoopchina.com.cn/blogfile/20209/22/BbsImg_92609618993162_1600739580_s_2888514_o_w_1828_h_762_82013.png?x-oss-process=image/resize,w_800/",@"https://i2.hoopchina.com.cn/blogfile/20209/22/BbsImg_92609618993162_1600739630_s_110898_o_w_828_h_550_15958.jpg?x-oss-process=image/resize,w_800/"].mutableCopy;
           hangModel1.adress = @"丽水市.中东路";
           hangModel1.contentID =  1;
           hangModel1.isZan = NO;
           hangModel1.zanNum = 21;
           hangModel1.Cellheight = 0;
           [WHC_ModelSqlite insert:hangModel1];
           

           keqiangboyHangqingModel * hangModel2 = [[keqiangboyHangqingModel alloc]init];
           hangModel2.name = @"铍老师真的皮";
           hangModel2.header = @"https://avatar.wacdn.com/8ba148a8d15a658b3a20dd07d2665b4.jpg?imageView2/1/w/120/h/120";
           hangModel2.time = @"2020-09-22 10:57";
           hangModel2.content = @"凯帕出道于毕尔巴鄂竞技青训，2012年，他加入毕尔巴鄂竞技U19梯队。2015/16赛季，凯帕被租借至巴拉多利德队效力一年。2016/17赛季，凯帕重返毕巴，在当赛季西甲联赛中出场23次。2017/18赛季，凯帕在西甲联赛中为毕巴出场30次。当赛季毕巴位列西甲第16位，失49球 [3]  。2018年8月9日，英超豪门切尔西官方宣布，西班牙门将凯帕加盟球队，双方签订7年合约。据英国媒体《BBC》报道，切尔西为他支付了8000万欧元的解约金，凯帕成为新的世界足坛最贵门将，打破了阿利松创造的7250万欧元的门将最高转会费纪录 [2]  。 阿利松出道于巴西国际足球俱乐部青训，2013年2月他首次代表一线队出场 [1]  。2016年7月，阿利松登陆欧洲加盟意甲罗马足球俱乐部，并在2017-18赛季成为主力门将，帮助球队闯入欧冠四强，个人获得意甲赛季最佳门将，在欧冠赛季最佳门将的3人候选中排名第二，并入选意甲与欧冠的赛季最佳阵容 [2-7]  。2018年7月，阿利松以7250万欧元的身价加盟英超利物浦足球俱乐部，打破世界足坛门将转会费纪录。";
           hangModel2.photos = @[].mutableCopy;
           hangModel2.adress = @"成都市.府兴路";
           hangModel2.contentID =  2;
           hangModel2.isZan = NO;
           hangModel2.zanNum = 19;
           hangModel2.Cellheight = 0;
           [WHC_ModelSqlite insert:hangModel2];

           
           keqiangboyHangqingModel * hangModel3 = [[keqiangboyHangqingModel alloc]init];
           hangModel3.name = @"多伦多德皇";
           hangModel3.header = @"https://avatar.wacdn.com/48a085e4d117065d2ea439449753f6a.jpg?imageView2/1/w/120/h/120";
           hangModel3.time = @"2020-09-22 11:57";
           hangModel3.content = @"现在美国最出名的韩国人是孙兴慜还是柳贤振？ 由  多伦多德皇 \n不算bts，毕竟是组合。 有在美国的朋友亲身说法吗。";
           hangModel3.photos = @[@"https://i10.hoopchina.com.cn/hupuapp/bbs/195944650960194/thread_195944650960194_20200922115723_s_47614_w_493_h_373_98211.jpg?x-oss-process=image/resize,w_800/",@"https://i3.hoopchina.com.cn/hupuapp/bbs/195944650960194/thread_195944650960194_20200922115723_s_28666_w_500_h_317_92023.jpg?x-oss-process=image/resize,w_800/"].mutableCopy;
           hangModel3.adress = @"成都市.五块石";
           hangModel3.contentID =  3;
           hangModel3.isZan = NO;
           hangModel3.zanNum = 31;
           hangModel3.Cellheight = 0;
           [WHC_ModelSqlite insert:hangModel3];
           
           keqiangboyHangqingModel * hangModel4 = [[keqiangboyHangqingModel alloc]init];
             hangModel4.name = @"多伦多德皇";
             hangModel4.header = @"https://avatar.wacdn.com/7c23d91f074f5e7fde62753d25157fd.jpg?imageView2/1/w/120/h/120";
             hangModel4.time = @"2020-09-22 11:57";
             hangModel4.content = @"利物浦在上赛季夺得队史首次英超冠军，本赛季英超，利物浦将开启卫冕征程。利物浦在今年夏窗对阵容进行补强，最近利物浦相继官宣了蒂亚戈和若塔两名重磅引援，中前场的实力得到明显提升。新赛季英超前两轮，利物浦也取得两连胜，在第2轮与切尔西的强强对话中，利物浦2-0完胜蓝军，展现出强大的实力。新援蒂亚戈也在这场比赛上演了他在利物浦的首秀，表现可圈可点。";
             hangModel4.photos = @[@"https://i3.hoopchina.com.cn/blogfile/20209/22/BbsImg_61354296022365_1600760569_s_38398_o_w_585_h_340_38189.jpg?x-oss-process=image/resize,w_800/",@"https://i4.hoopchina.com.cn/blogfile/20209/22/BbsImg_61354296022365_1600760586_s_19247_o_w_575_h_379_45206.jpg?x-oss-process=image/resize,w_800/"].mutableCopy;
             hangModel4.adress = @"成都市.五块石";
             hangModel4.contentID =  4;
             hangModel4.isZan = NO;
             hangModel4.zanNum = 10;
             hangModel4.Cellheight = 0;
             [WHC_ModelSqlite insert:hangModel4];
    });
}
-(void)gaoxiangqingFindDetailModelConfiherModels{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        keqiangboyDetailComenrModle * keqiangitem = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem.name = @"游鱼杂货铺";
           keqiangitem.header = @"https://q.qlogo.cn/qqapp/100245713/82269342587495D7AC66BFF82F4C6325/100?imageView2/1/w/120/h/120";
           keqiangitem.contetn = @"我很讨厌规划、说好的全华班 最后变成了全规划班！ 但是 中国足球自己不争气啊……";
           keqiangitem.time = @"2020-09-22 16:03";
           keqiangitem.ContentID = 0;
           keqiangitem.isZan = NO;
           keqiangitem.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem];
           
           keqiangboyDetailComenrModle * keqiangitem1 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem1.name = @"四井啊";
           keqiangitem1.header = @"https://avatar.wacdn.com/130a30e1ce774babbdaf454d11fde950.jpg?imageView2/1/w/120/h/120";
           keqiangitem1.contetn = @"学来学去，啥也没学到，反而把自己的优势丢掉了。";
           keqiangitem1.time = @"2020-09-22 16:00";
           keqiangitem1.ContentID = 0;
           keqiangitem1.isZan = NO;
           keqiangitem1.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem1];

           keqiangboyDetailComenrModle * keqiangitem2 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem2.name = @"诸葛匹夫王钢蛋";
           keqiangitem2.header = @"https://avatar.wacdn.com/5a239b297cf5457e960808cd9db899e5?imageView2/1/w/120/h/120";
           keqiangitem2.contetn = @"“爸爸爸爸，我想踢足球！” “好孩子，你为什么要踢足球？” “我要为国争光！” “傻孩子，你进不了国家队的，还是放弃吧”";
           keqiangitem2.time = @"2020-09-22 16:22";
           keqiangitem2.ContentID = 0;
           keqiangitem2.isZan = NO;
           keqiangitem2.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem2];
           
           keqiangboyDetailComenrModle * keqiangitem3 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem3.name = @"小猪管着饲养员";
           keqiangitem3.header = @"https://avatar.wacdn.com/42b88b6ca5015db8d8e42df81263faf.jpg?imageView2/1/w/120/h/120";
           keqiangitem3.contetn = @"时至冈田从绿城回日本，有幸曾经在公司的全体会议上现场聆听过他的演讲。无疑，人生在世，设定的目标，不可能每一个都能实现。而他是一个敢于当着全世界的面，喊出自己梦想，而后倒逼自己拼尽全力去实现的人。而现实中的大多数人，只是怯懦的躲在自己的舒适区里，等着看别人的笑话，仿佛那就是他们的梦想一样。";
           keqiangitem3.time = @"2020-09-22 13:38 ";
           keqiangitem3.ContentID = 1;
           keqiangitem3.isZan = NO;
           keqiangitem3.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem3];
           
           
           keqiangboyDetailComenrModle * keqiangitem4 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem4.name = @"阿里爸爸4567";
           keqiangitem4.header = @"https://avatar.wacdn.com/0f416939a4146c33f34f22eea0749c8.jpg?imageView2/1/w/120/h/120";
           keqiangitem4.contetn = @"现在我破城还有不少日本青训教练，每年小球员还都去日本训练啥的，都是当年冈田留下的遗产";
           keqiangitem4.time = @"2020-09-22 12:42";
           keqiangitem4.ContentID = 1;
           keqiangitem4.isZan = NO;
           keqiangitem4.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem4];

           keqiangboyDetailComenrModle * keqiangitem5 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem5.name = @"铁面柔情莫雷诺";
           keqiangitem5.header = @"https://avatar.wacdn.com/dcd213ea549d95ab5dc3c1fed398258.jpg?imageView2/1/w/120/h/120";
           keqiangitem5.contetn = @"当时破车挨宰是必然的，问题是为啥买凯帕？八千万除了几个豪门功勋，砸门将几乎可以随便砸，比如钱多多";
           keqiangitem5.time = @"2020-09-22 11:16";
           keqiangitem5.ContentID = 2;
           keqiangitem5.isZan = NO;
           keqiangitem5.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem5];
           
           keqiangboyDetailComenrModle * keqiangitem6 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem6.name = @"马原原";
           keqiangitem6.header = @"https://avatar.wacdn.com/d0b92591066a804df2e32db94705e79.jpg?imageView2/1/w/120/h/120";
           keqiangitem6.contetn = @"人家的意思是……毕巴原来应该是中游球队，有了凯教练才到保级区";
           keqiangitem6.time = @"2020-09-22 11:17";
           keqiangitem6.ContentID = 2;
           keqiangitem6.isZan = NO;
           keqiangitem6.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem6];
           
           keqiangboyDetailComenrModle * keqiangitem7 = [[keqiangboyDetailComenrModle alloc]init];
           keqiangitem7.name = @"cheasona";
           keqiangitem7.header = @"https://avatar.wacdn.com/5a16993b0ef90352d035b33744f1e9a.jpg?imageView2/1/w/120/h/120";
           keqiangitem7.contetn = @"美国人看soccer的那么少，我觉得这个答案不言自明。 ";
           keqiangitem7.time = @"2020-09-22 12:02";
           keqiangitem7.ContentID = 3;
           keqiangitem7.isZan = NO;
           keqiangitem7.Cellheight = 0 ;
           [WHC_ModelSqlite insert:keqiangitem7];
    });

}
@end
