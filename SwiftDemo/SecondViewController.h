//
//  SecondViewController.h
//  SwiftDemo
//
//  Created by 周智勇 on 2018/11/6.
//  Copyright © 2018年 zhouzhiyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SecondViewControllerBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

- (void)swiftGiveOCValue:(NSString *)text;

@property (nonatomic, copy)SecondViewControllerBlock block;
@end

NS_ASSUME_NONNULL_END
