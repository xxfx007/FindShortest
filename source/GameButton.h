//
//  suibutton.h
//  nine
//
//  Created by USER on 2018/12/26.
//  Copyright © 2018年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameButton : UIButton
{
   @public int value1 ;//按钮上面的数字
   @public int value2 ;//加算得出的最小值
   @public int indrow ;//按钮所在行
   @public int indcol ;//按钮所在列
   @public bool isDown4User ;//是否按下 玩家按下
   @public bool isDown4Man ;//是否按下 系统算出
}
-(void) setBtnColor4User;
-(void) setBtnColor4Man;
-(void) initMethod;
-(void) resetMethod;
@end
