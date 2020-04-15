//
//  gamepanelViewController.m
//  nine
//
//  Created by USER on 2019/01/01.
//  Copyright © 2019年 USER. All rights reserved.
//

#import "GameController.h"
#import "GameButton.h"

@interface GameController ()
@end

@implementation GameController

-(void) initmethod{
    [self initMember];
    NSInteger initrow = 100;//初始的位置 y竖着的位置
    CGFloat rp = 0;//行的位置 y竖着的 每行的位置
    CGFloat cp = 0;//列的位置 x横着的 每列的位置
    rowarr = [[NSMutableArray  alloc] init];//button放入这个集合中 模拟二维数组
    
    //消息栏图标加载
    UIButton *msg = [[UIButton alloc] init];
    msg.tag=404;
    msg.frame = CGRectMake(80, 100, 100, 30);
    msg.hidden=YES;
    [self.view addSubview:msg];
 
    //开始按钮图标加载 小乌龟
    UIButton *startview = [[UIButton alloc] init];
    [startview setImage:[UIImage imageNamed:@"wugui"] forState:UIControlStateNormal];
    startview.frame = CGRectMake(35, 100, 40, 30);
    [self.view addSubview:startview];
    int tmptag = 1;
    //初始化按钮
    for (int i = 0 ; i<rows; i++) {
        rp = initrow + (i+1)*35 ;//算出y的位置
        NSMutableArray  *colarr = [[NSMutableArray  alloc] init];//每一行的集合
        for (int j= 0 ; j<cols; j++) {
            cp = (j+1)*35;//算每个x的位置
            
            GameButton *button =[[GameButton alloc] init];
            button.backgroundColor = [UIColor lightGrayColor];
            button.frame = CGRectMake(cp, rp, 30, 30);
            int x = (arc4random() % rdmmax)+1;
            button->value1 = x;
            button.tag = tmptag;
            tmptag=tmptag+1;
            button->indrow=i;
            button->indcol=j;
            [button setTitle:[NSString stringWithFormat:@"%d",x] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:button];
            
            [colarr addObject:button];
        }
        [rowarr addObject:colarr];
    }
    //结束按钮图标加载
    UIButton *endview = [[UIButton alloc] init];
    [endview setImage:[UIImage imageNamed:@"hongqi"] forState:UIControlStateNormal];
    endview.frame = CGRectMake(cols*35, initrow+ ((rows+1)*35), 30, 30);
    [self.view addSubview:endview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initmethod];
    _bView = [[GADBannerView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-50 , self.view.frame.size.width, 50)];
    _bView.adUnitID = @"ca-app-pub-5743988609105071/3738040047";
    _bView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[@"0cf362d54cdae8493852332ffc51a1fb7901f947"];
    [_bView loadRequest:request];
    [self.view addSubview:_bView];
    //NSLog(self->guanshu);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//玩家点击的时候触发
-(void) btnClick:(id)sender{
    GameButton *sbtn = sender;
    //NSLog(sbtn.titleLabel.text);
    if (sbtn->isDown4User) {
        //如果已经按下 则什么都不做
    }else  {
        //刚进入游戏时
        if (self->activerow==-1 && self->activecol==-1) {
            if (sbtn->indrow==0 && sbtn->indcol==0) {
                [sbtn setBtnColor4User];
                self->activerow=0;
                self->activecol=0;
                self->cnt4User=self->cnt4User+1;
                self->max4user=self->max4user+sbtn->value1;
            }else{
            }
        }else{
            if (self->activerow+1==sbtn->indrow && self->activecol==sbtn->indcol) {
                [sbtn setBtnColor4User];
                self->activerow=sbtn->indrow;
                self->activecol=sbtn->indcol;
                self->cnt4User=self->cnt4User+1;
                self->max4user=self->max4user+sbtn->value1;
            } else if(self->activerow==sbtn->indrow && self->activecol+1==sbtn->indcol){
                [sbtn setBtnColor4User];
                self->activerow=sbtn->indrow;
                self->activecol=sbtn->indcol;
                self->cnt4User=self->cnt4User+1;
                self->max4user=self->max4user+sbtn->value1;
            } else{
            }
        }
    }
}

//返回主界面
-(IBAction)domain:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void) initMember{
self->activerow=-1;//玩家当前点击行
self->activecol=-1;//玩家当前点击列
    
self->max4user=0;//玩家得出的最大值
self->max4man=0;//系统得出的最大值
    
self->cnt4User=0;//选了几个 玩家
self->cnt4Man=0;//选了几个 系统
}
//再来一局
-(IBAction) initclick:(id)sender{
    [self initMember];
    
    for (int i = 0 ; i<[rowarr count]; i++) {
        for (int j= 0 ; j<[[rowarr objectAtIndex:i] count]; j++) {
            GameButton *button = [[rowarr objectAtIndex:i] objectAtIndex:j];
            //随机数重置
            int x = (arc4random() % rdmmax)+1;
            button->value1 = x;//值重置
            button->isDown4Man=false;
            button->isDown4User=false;
            [button setTitle:[NSString stringWithFormat:@"%d",x] forState:UIControlStateNormal];//表示重置
            //颜色重置
            button.backgroundColor = [UIColor lightGrayColor];
            button.layer.borderColor = nil;
            button.layer.borderWidth = 0.0f;
            
            UIButton *msg =  [self.view viewWithTag:404];
            msg.hidden = YES;
        }
    }
}

//玩家提交
-(IBAction) submitclick:(id)sender{
    GameButton *tmp = [[rowarr objectAtIndex:0] objectAtIndex:0];
    tmp->value2 = tmp->value1;
    //row init 把第一行的最小值算出
    for (int i = 1 ; i<[[rowarr objectAtIndex:0] count]; i++) {
        GameButton *init1 = [[rowarr objectAtIndex:0] objectAtIndex:i];
        GameButton *init2 = [[rowarr objectAtIndex:0] objectAtIndex:i-1];
        
        init1->value2 = init2->value2+init1->value1;
    }
    //col init 把第一列的最小值算出
    for (int i = 1 ; i<[rowarr count]; i++) {
        GameButton *init1 = [[rowarr objectAtIndex:i] objectAtIndex:0];
        GameButton *init2 = [[rowarr objectAtIndex:i-1] objectAtIndex:0];
        
        init1->value2 = init2->value2+init1->value1;
    }
    //把所有的按钮的最小值都算出
    for (int i = 1 ; i<[rowarr count]; i++) {
        for (int j= 1 ; j<[[rowarr objectAtIndex:i] count]; j++) {
            if (((GameButton *)[[rowarr objectAtIndex:i-1] objectAtIndex:j])->value2 >
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j-1])->value2) {
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j])->value2=
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j])->value1+
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j-1])->value2;
                //((suibutton *)[[rowarr objectAtIndex:i] objectAtIndex:j-1]).backgroundColor = [UIColor blueColor];
            }else{
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j])->value2=
                ((GameButton *)[[rowarr objectAtIndex:i] objectAtIndex:j])->value1+
                ((GameButton *)[[rowarr objectAtIndex:i-1] objectAtIndex:j])->value2;
                //((suibutton *)[[rowarr objectAtIndex:i] objectAtIndex:j-1]).backgroundColor = [UIColor blueColor];
            }
        }
    }
    
    // 把最小值都表示出来
    //        for (int i = 0 ; i<[rowarr count]; i++) {
    //            for (int j= 0 ; j<[[rowarr objectAtIndex:i] count]; j++) {
    //                suibutton *btn = [[rowarr objectAtIndex:i] objectAtIndex:j];
    //
    //                NSString *title1 = [NSString stringWithFormat:@"%d",btn->value2];
    //                [btn setTitle:title1 forState:nil];
    //
    //            }
    //        }
    
    long xx;
    long yy;
    
    //系统算正确的答案
    xx =(long)[rowarr count]-1;
    yy =(long)[[rowarr objectAtIndex:0] count] -1;
    ((GameButton *)[[rowarr objectAtIndex:xx] objectAtIndex:yy])->isDown4Man=true;
    self->max4man = self->max4man +((GameButton *)[[rowarr objectAtIndex:xx] objectAtIndex:yy])->value1;
    self->cnt4Man = self->cnt4Man + 1 ;
    while (xx > 0 || yy >0 ) {
        if (xx==0) {
            yy=yy-1;
        }else if(yy==0){
            xx=xx-1;
        }else if (((GameButton *)[[rowarr objectAtIndex:xx-1] objectAtIndex:yy])->value2 >
                  ((GameButton *)[[rowarr objectAtIndex:xx] objectAtIndex:yy-1])->value2 ) {
            yy=yy-1;
        }else{
            xx=xx-1;
        }
        ((GameButton *)[[rowarr objectAtIndex:xx] objectAtIndex:yy])->isDown4Man=true;
        self->max4man = self->max4man +((GameButton *)[[rowarr objectAtIndex:xx] objectAtIndex:yy])->value1;
        self->cnt4Man = self->cnt4Man + 1 ;
    }
    //判断是否正确
    if (self->cnt4User==self->cnt4Man && self->max4user<=self->max4man) {
        //ok情况
        UIButton *msg =  [self.view viewWithTag:404];
        msg.hidden = NO;
        [msg setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
        if (([guanshu intValue] +1) == 99) {
            //到最大关数 什么都不做
        }else{
            //更新plist
            NSString *key =[NSString stringWithFormat:@"%d",[guanshu intValue]+1];
            NSArray *arr = [gameDict objectForKey:key];
            [gameDict setObject:[NSArray arrayWithObjects:@"1",arr[1],arr[2],arr[3],nil] forKey:key];
            [gameDict writeToFile:filePath atomically:YES];//写入文件
        }
        //跳转回主页面
        NSTimer *timer;
        timer =  [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(delayMethods) userInfo:nil repeats:NO];
        
    }else{
        //错误的分支
        //设置错误消息
        UIButton *msg =  [self.view viewWithTag:404];
        msg.hidden = NO;
        [msg setImage:[UIImage imageNamed:@"try"] forState:UIControlStateNormal];

        [NSThread sleepForTimeInterval:1.0];//延时
        //把正确的标注颜色出来
        for (int i = 0 ; i<[rowarr count]; i++) {
            for (int j= 0 ; j<[[rowarr objectAtIndex:i] count]; j++) {
                GameButton *btn = [[rowarr objectAtIndex:i] objectAtIndex:j];
                if (btn->isDown4Man) {
                    [btn setBtnColor4Man];
                }else{
                }
            }
        }
    }
}

-(void)delayMethods{
    [self domain:nil];//回到主页
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
