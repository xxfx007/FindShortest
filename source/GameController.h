//
//  gamepanelViewController.h
//  nine
//
//  Created by USER on 2019/01/01.
//  Copyright © 2019年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface GameController : UIViewController
{
    
@public NSMutableDictionary *gameDict;
@public NSString *filePath;
    
@public NSMutableArray  *rowarr;//游戏主界面的表格
@public NSString *guanshu;//当前是第几关

@public int rows;//该关总行数
@public int cols;//该关总列数
@public int rdmmax;//最大随机数
    
@public int activerow;//玩家当前点击行
@public int activecol;//玩家当前点击列
    
@public long max4user;//玩家得出的最大值
@public long max4man;//系统得出的最大值
    
@public int cnt4User;//选了几个 玩家
@public int cnt4Man;//选了几个 系统
    
}
@property (nonatomic, strong) GADBannerView *bView;

-(void) initMember;
@end
