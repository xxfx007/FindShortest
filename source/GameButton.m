//
//  suibutton.m
//  nine
//
//  Created by USER on 2018/12/26.
//  Copyright © 2018年 USER. All rights reserved.
//

#import "GameButton.h"

@implementation GameButton

-(void) setBtnColor4User{
    self.backgroundColor = [UIColor orangeColor];
    self->isDown4User=true;
}
-(void) setBtnColor4Man{
    self.layer.borderColor = [[UIColor greenColor] CGColor];
    self.layer.borderWidth = 3.0f;
}
-(void) initMethod{
    
}
-(void) resetMethod{
    
}
@end
