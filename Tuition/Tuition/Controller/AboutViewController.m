//
//  AboutViewController.m
//  Tuition
//
//  Created by Duy Luong on 7/21/15.
//  Copyright (c) 2015 Duy Luong. All rights reserved.
//

#import "AboutViewController.h"

__strong NSString *ABOUT_VIEW_PAY_SB = @"AboutViewPaySB";
__strong NSString *ABOUT_VIEW_TRACK_SB = @"AboutViewTrackSB";
__strong NSString *ABOUT_VIEW_SHARE_SB = @"AboutViewShareSB";
__strong NSString *ABOUT_VIEW_MATCH_SB = @"AboutViewMatchSB";
const int TOTAL_ITEM_ABOUT = 4;
__strong NSString *NAME_IMAGE_PAGE_NONE = @"slideabout_page_none";
__strong NSString *NAME_IMAGE_PAGE_ACTIVE = @"slideabout_page_selected";


@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initScrollViewSlideAbout];
}

- (void)initData
{
    self.uiImagePageNone = [UIImage imageNamed:NAME_IMAGE_PAGE_NONE];
    self.uiImagePageActive = [UIImage imageNamed:NAME_IMAGE_PAGE_ACTIVE];
}

/*------------- Init Scrollview SlideAbout -------*/
- (void)initScrollViewSlideAbout
{
    //set frame for scrollview
    CGRect frameOfScrollView = self.uiScrollView.frame;
    frameOfScrollView.size.width = self.view.frame.size.width;
    self.uiScrollView.frame = frameOfScrollView;
    [self.uiScrollView setContentSize:CGSizeMake(TOTAL_ITEM_ABOUT * frameOfScrollView.size.width, frameOfScrollView.size.height)];
    for (int i=0; i< TOTAL_ITEM_ABOUT; i++) {
        [self addSubviewAbout:i];
    }
    self.uiScrollView.delegate = self;
    
    //Set current Page
    [self setCurrentPage:0 animated:YES];
    lastContentOffset = self.uiScrollView.contentOffset.x;
}

- (void)addSubviewAbout : (int)itemAt{
    UIViewController *viewItemAbout = nil;
    CGRect frameItemAbout = self.uiScrollView.frame;
    frameItemAbout.origin.x = frameItemAbout.size.width * itemAt;
    switch (itemAt) {
        case 0:
            viewItemAbout = [self.storyboard instantiateViewControllerWithIdentifier:ABOUT_VIEW_PAY_SB];
            break;
        case 1:
            viewItemAbout = [self.storyboard instantiateViewControllerWithIdentifier:ABOUT_VIEW_TRACK_SB];
            break;
        case 2:
            viewItemAbout = [self.storyboard instantiateViewControllerWithIdentifier:ABOUT_VIEW_SHARE_SB];
            break;
        case 3:
            viewItemAbout = [self.storyboard instantiateViewControllerWithIdentifier:ABOUT_VIEW_MATCH_SB];
            break;
            
        default:
            break;
    }
    viewItemAbout.view.frame = frameItemAbout;
    [viewItemAbout.view removeFromSuperview];
    [self.uiScrollView addSubview:viewItemAbout.view];
}

/*------------- Method set current page for Slide ------*/
- (void)setCurrentPage:(NSInteger)_currentPage animated:(BOOL)animated
{
    currentPage = _currentPage;
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    }
    switch (_currentPage)
    {
        case 0:
            [self.uiButtonPage1 setImage:self.uiImagePageActive forState:UIControlStateNormal];
            [self.uiButtonPage2 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage3 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage4 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            break;
        case 1:
            [self.uiButtonPage1 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage2 setImage:self.uiImagePageActive forState:UIControlStateNormal];
            [self.uiButtonPage3 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage4 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            break;
        case 2:
            [self.uiButtonPage1 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage2 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage3 setImage:self.uiImagePageActive forState:UIControlStateNormal];
            [self.uiButtonPage4 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            break;
        case 3:
            [self.uiButtonPage1 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage2 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage3 setImage:self.uiImagePageNone forState:UIControlStateNormal];
            [self.uiButtonPage4 setImage:self.uiImagePageActive forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}

- (void)setPageForScrollView : (int)position{
    CGRect frame = self.uiScrollView.frame;
    frame.origin.x = frame.size.width * position;
    frame.origin.y = 0;
    [self.uiScrollView scrollRectToVisible:frame animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    lastContentOffset = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (lastContentOffset < scrollView.contentOffset.x)
    {
        // moved right
        currentPage = (scrollView.contentOffset.x/(int)scrollView.frame.size.width);
        [self setCurrentPage:currentPage animated:YES];
    }
    else if (lastContentOffset > (int)scrollView.contentOffset.x)
    {
        // moved left
        currentPage = (scrollView.contentOffset.x/(int)scrollView.frame.size.width);
        [self setCurrentPage:currentPage animated:YES];
    }
}

- (IBAction)ActionClose:(id)sender {
}
- (IBAction)ActionPage2:(id)sender {
    [self setPageForScrollView:1];
    [self setCurrentPage:1 animated:YES];
}
- (IBAction)ActionPage3:(id)sender {
    [self setPageForScrollView:2];
    [self setCurrentPage:2 animated:YES];
}
- (IBAction)ActionPage1:(id)sender {
    [self setPageForScrollView:0];
    [self setCurrentPage:0 animated:YES];
}
- (IBAction)ActionPage4:(id)sender {
    [self setPageForScrollView:3];
    [self setCurrentPage:3 animated:YES];
}
@end
