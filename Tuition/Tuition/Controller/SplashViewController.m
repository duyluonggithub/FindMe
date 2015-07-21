//
//  SplashViewController.m
//  Tuition
//
//  Created by Duy Luong on 7/21/15.
//  Copyright (c) 2015 Duy Luong. All rights reserved.
//

#import "SplashViewController.h"

const float TIME_DELAY = 2.0;
__strong NSString *IDENTIFIER_SEGUE_ABOUT = @"IdentifierSegueAbout";

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Hide Navigation Bar
    [self hideNavigationBar];
    
    //Init Logo
    [self initLogo];
}

- (void)viewDidAppear:(BOOL)animated
{
    //Goto screen About
    [self performSelector:@selector(goToAboutScreen:) withObject:nil afterDelay:TIME_DELAY];
}

- (void)initLogo
{
    CGRect frameOfLogo1 = self.uiImageViewLogo1.frame;
    CGRect frameOfLogo1New = self.uiImageViewLogo1.frame;
    frameOfLogo1New.origin.y -= TIME_DELAY* frameOfLogo1New.size.height;
    self.uiImageViewLogo1.frame = frameOfLogo1New;
    
    [UIView animateWithDuration:TIME_DELAY animations:^{
        self.uiImageViewLogo1.frame = frameOfLogo1;
    }];
    
}

- (void)goToAboutScreen:(id)sender{
    [self performSegueWithIdentifier:IDENTIFIER_SEGUE_ABOUT sender:sender];
}

@end
