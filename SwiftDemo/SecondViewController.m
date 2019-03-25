//
//  SecondViewController.m
//  SwiftDemo
//
//  Created by 周智勇 on 2018/11/6.
//  Copyright © 2018年 zhouzhiyong. All rights reserved.
//

#import "SecondViewController.h"
#import "SwiftDemo-Swift.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clicked{
    ViewController *vc = [[ViewController alloc] init];
    [vc OCBackValueToSwiftFileWithText:@"666666.swift类中的方法只有加了@objc才能在OC文件中直接调用"];
    if (self.block) {
        self.block();
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)swiftGiveOCValue:(NSString *)text{
    NSLog(@"\n\n\n%@", text);
}

@end
