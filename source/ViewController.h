//
//  ViewController.h
//  nine
//
//  Created by USER on 2018/12/23.
//  Copyright © 2018年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController : UIViewController
{
@public NSMutableDictionary *gameDict;
@public NSString *filePath;
}
@property (nonatomic, strong) GADBannerView *bView;
@end

