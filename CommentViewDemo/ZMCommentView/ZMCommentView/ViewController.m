//
//  ViewController.m
//  ZMCommentView
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import "ViewController.h"
#import "ZMCusCommentView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showCommentView{
    [[ZMCusCommentManager shareManager] showCommentWithSourceId:nil];
}


@end
