//
//  ViewController.m
//  nine
//
//  Created by USER on 2018/12/23.
//  Copyright © 2018年 USER. All rights reserved.
//

#import "ViewController.h"
#import "ViewButton.h"
#import "GameController.h"
#import "HelpController.h"
@interface ViewController ()
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;//隐藏迁移栏
    //从前页面返回后 刷新
    [self init3];
}
-(IBAction)aboutme:(id)sender{
    HelpController *gp = [self.storyboard instantiateViewControllerWithIdentifier:@"help1"];
   
    [self.navigationController pushViewController:gp animated:YES];
}

//初始化plist
-(void) init1{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//找document路径 查询
    NSString *path = [paths objectAtIndex:0];//从查询出来的数组里 选第一个
    filePath = [path stringByAppendingPathComponent:@"game.plist"];//把文件名也拼上
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    gameDict = [[NSMutableDictionary alloc] init];
    NSLog(@"%@",filePath);
    if (result) {
        gameDict =  [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    }else{
    
        //1 是够过关 0是没有过关 1是已经过关
        //2 行
        //3 列
        //4 随机max 难易度
        
        //1-10
        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"3",@"3",nil] forKey:@"1"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"3",@"3",@"5",nil] forKey:@"2"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"3",@"4",@"8",nil] forKey:@"3"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"3",@"4",@"10",nil] forKey:@"4"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"3",@"4",@"20",nil] forKey:@"5"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"4",@"4",@"3",nil] forKey:@"6"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"4",@"4",@"5",nil] forKey:@"7"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"4",@"4",@"8",nil] forKey:@"8"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"10",nil] forKey:@"9"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"15",nil] forKey:@"10"];
        //11-20
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"20",nil] forKey:@"11"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"25",nil] forKey:@"12"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"30",nil] forKey:@"13"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"35",nil] forKey:@"14"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"40",nil] forKey:@"15"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"45",nil] forKey:@"16"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"50",nil] forKey:@"17"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"55",nil] forKey:@"18"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"60",nil] forKey:@"19"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"4",@"65",nil] forKey:@"20"];
        //21-30
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"3",nil] forKey:@"21"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"5",nil] forKey:@"22"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"8",nil] forKey:@"23"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"10",nil] forKey:@"24"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"15",nil] forKey:@"25"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"20",nil] forKey:@"26"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"25",nil] forKey:@"27"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"30",nil] forKey:@"28"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"40",nil] forKey:@"29"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"5",@"5",@"45",nil] forKey:@"30"];
        //31-40
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"3",nil] forKey:@"31"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"5",nil] forKey:@"32"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"8",nil] forKey:@"33"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"10",nil] forKey:@"34"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"15",nil] forKey:@"35"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"20",nil] forKey:@"36"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"5",@"25",nil] forKey:@"37"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"30",nil] forKey:@"38"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"40",nil] forKey:@"39"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"45",nil] forKey:@"40"];
        //41-50
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"3",nil] forKey:@"41"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"5",nil] forKey:@"42"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"8",nil] forKey:@"43"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"10",nil] forKey:@"44"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"15",nil] forKey:@"45"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"20",nil] forKey:@"46"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"25",nil] forKey:@"47"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"30",nil] forKey:@"48"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"40",nil] forKey:@"49"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"45",nil] forKey:@"50"];
        //51-60
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"3",nil] forKey:@"51"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"5",nil] forKey:@"52"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"8",nil] forKey:@"53"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"10",nil] forKey:@"54"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"6",@"6",@"15",nil] forKey:@"55"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"20",nil] forKey:@"56"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"25",nil] forKey:@"57"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"30",nil] forKey:@"58"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"40",nil] forKey:@"59"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"45",nil] forKey:@"60"];
        //61-70
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"3",nil] forKey:@"61"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"5",nil] forKey:@"62"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"8",nil] forKey:@"63"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"10",nil] forKey:@"64"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"15",nil] forKey:@"65"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"20",nil] forKey:@"66"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"25",nil] forKey:@"67"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"30",nil] forKey:@"68"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"40",nil] forKey:@"69"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"6",@"45",nil] forKey:@"70"];
        
        //71-80
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"3",nil] forKey:@"71"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"5",nil] forKey:@"72"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"8",nil] forKey:@"73"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"10",nil] forKey:@"74"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"15",nil] forKey:@"75"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"20",nil] forKey:@"76"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"25",nil] forKey:@"77"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"30",nil] forKey:@"78"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"40",nil] forKey:@"79"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"7",@"7",@"45",nil] forKey:@"80"];
        //81-90
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"7",@"5",nil] forKey:@"81"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"7",@"10",nil] forKey:@"82"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"7",@"20",nil] forKey:@"83"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"7",@"30",nil] forKey:@"84"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"7",@"50",nil] forKey:@"85"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"8",@"5",nil] forKey:@"86"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"8",@"10",nil] forKey:@"87"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"8",@"20",nil] forKey:@"88"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"8",@"30",nil] forKey:@"89"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"8",@"8",@"50",nil] forKey:@"90"];
        //91-99
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"8",@"5",nil] forKey:@"91"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"8",@"10",nil] forKey:@"92"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"8",@"20",nil] forKey:@"93"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"8",@"30",nil] forKey:@"94"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"8",@"50",nil] forKey:@"95"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"9",@"20",nil] forKey:@"96"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"9",@"40",nil] forKey:@"97"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"9",@"60",nil] forKey:@"98"];
        [gameDict setObject:[NSArray arrayWithObjects:@"0",@"9",@"9",@"85",nil] forKey:@"99"];
        
        
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"3",@"5",nil] forKey:@"2"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"3",@"8",nil] forKey:@"3"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"3",@"10",nil] forKey:@"4"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"3",@"20",nil] forKey:@"5"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"5",@"5",@"3",nil] forKey:@"6"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"4",@"5",nil] forKey:@"7"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"4",@"8",nil] forKey:@"8"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"3",@"4",@"10",nil] forKey:@"9"];
//        [gameDict setObject:[NSArray arrayWithObjects:@"1",@"9",@"9",@"20",nil] forKey:@"10"];
//        
        [gameDict writeToFile:filePath atomically:YES];
    }
}

//初始化 关卡
-(void) init2{
    CGFloat rp = 100;
    CGFloat cp = 0;
    int cnt = 1;
    
    for (int i = 1 ; i<=99; i++) {
        cp=cp+35;
        guibutton *button =[[guibutton alloc] init];
        button.frame = CGRectMake(cp, rp, 35, 35);
        button.tag=i;
        //从plist中取出状态，用于后面的判断  是[0]
        button->svalue =[gameDict objectForKey:[NSString stringWithFormat:@"%d",i]][0] ;
        if ([[gameDict objectForKey:[NSString stringWithFormat:@"%d",i]][0] isEqualToString:@"1"]) {
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setImage:nil forState:UIControlStateNormal];
        }else{
            UIImage *img = [UIImage imageNamed:@"s"];
            [button setImage:img forState:UIControlStateNormal];
        }
        
        int x = cnt;
        cnt=cnt+1;
        NSString *title1 = [NSString stringWithFormat:@"%d",x];
        [button setTitle:title1 forState:UIControlStateNormal];
        [button addTarget:self action:@selector(luanchbutton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
        if (i % 9 == 0) {
            rp=rp+35;
            cp = 0;
        }
    }
}

//返回时 更新状态
-(void) init3{
    for (int i = 1 ; i<=99; i++) {
        
        guibutton *button =[self.view viewWithTag:i];

        if ([[gameDict objectForKey:[NSString stringWithFormat:@"%d",i]][0] isEqualToString:@"1"]) {
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setImage:nil forState:UIControlStateNormal];
        }else{
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self init1];
    [self init2];
    _bView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-50 , self.view.frame.size.width, 50)];
    _bView.adUnitID = @"ca-app-pub-5743988609105071/7878054473";
    _bView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[@"0cf362d54cdae8493852332ffc51a1fb7901f947"];
    [_bView loadRequest:request];
    [self.view addSubview:_bView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)quitapp:(id)sender{

//      NSFileManager *fileManager = [NSFileManager defaultManager];
//      [fileManager removeItemAtPath:filePath error:nil];
exit(0);//退出程序
}

//迁移到游戏界面
-(void)luanchbutton:(id)sender{
    
    guibutton *btn = (guibutton*) sender;
    btn->svalue =[gameDict objectForKey:btn.titleLabel.text][0] ;
    if ([btn->svalue isEqualToString:@"1"]) {
        GameController *gp = [self.storyboard instantiateViewControllerWithIdentifier:@"game"];
        gp->guanshu = btn.titleLabel.text;
        gp->rows=[[gameDict objectForKey:gp->guanshu][1] intValue];
        gp->cols=[[gameDict objectForKey:gp->guanshu][2] intValue];
        gp->rdmmax=[[gameDict objectForKey:gp->guanshu][3] intValue];
        gp->gameDict= gameDict;
        gp->filePath=filePath;
        [self.navigationController pushViewController:gp animated:YES];
    }else{
    }
}
@end
