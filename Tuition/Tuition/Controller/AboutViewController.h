//
//  AboutViewController.h
//  Tuition
//
//  Created by Duy Luong on 7/21/15.
//  Copyright (c) 2015 Duy Luong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AboutViewController : BaseViewController<UIScrollViewDelegate>
{
    NSInteger currentPage;
    CGFloat lastContentOffset;
}
@property(strong, nonatomic)UIImage *uiImagePageNone, *uiImagePageActive;

- (IBAction)ActionClose:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *uiScrollView;

@property (weak, nonatomic) IBOutlet UIButton *uiButtonPage2;
- (IBAction)ActionPage2:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *uiButtonPage3;
- (IBAction)ActionPage3:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *uiButtonPage1;
- (IBAction)ActionPage1:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *uiButtonPage4;
- (IBAction)ActionPage4:(id)sender;

@end
