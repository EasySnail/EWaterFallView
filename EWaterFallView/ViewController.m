//
//  ViewController.m
//  EWaterFallView
//
//  Created by Easy on 2018/6/11.
//  Copyright © 2018年 Easy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,retain)UIButton *startButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self startButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)start{

    [self.navigationController pushViewController:[[NSClassFromString(@"TestVC") alloc] init] animated:true];
}
- (UIButton *)startButton{
    if (_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _startButton.bounds = CGRectMake(0, 0, 100, 40);
        _startButton.center = self.view.center;
        [_startButton setTitle:@"开始" forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_startButton];
    }
    return _startButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
