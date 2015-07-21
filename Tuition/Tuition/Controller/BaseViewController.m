//
//  BaseViewController.m
//  Tuition
//
//  Created by Duy Luong on 7/21/15.
//  Copyright (c) 2015 Duy Luong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*----- Hide Navigation -----*/
- (void)hideNavigationBar{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}

@end
