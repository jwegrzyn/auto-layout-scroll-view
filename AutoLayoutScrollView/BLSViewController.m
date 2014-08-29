//
//  BLSViewController.m
//  AutoLayoutScrollView
//
//  Created by Jakub Wegrzyn on 29/08/14.
//  Copyright (c) 2014 BLStream. All rights reserved.
//

#import "BLSViewController.h"
#import "UIView+FLKAutoLayout.h"

@interface BLSViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIView *bottomView;

@end

@implementation BLSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.scrollView];

    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:self.contentView];

    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.topView];

    self.bottomView = [[UIView alloc] init];
    self.bottomView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.bottomView];

    [self setupAutolayoutConstraints];
}

- (void)setupAutolayoutConstraints
{
    [self.scrollView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.view];

    [self.contentView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.scrollView];
    [self.contentView constrainWidthToView:self.view predicate:@"0"];

    [self.topView alignTopEdgeWithView:self.contentView predicate:@"0"];
    [self.topView alignLeading:@"0" trailing:@"0" toView:self.contentView];
    [self.topView constrainHeight:@"600"];

    [self.bottomView alignAttribute:NSLayoutAttributeTop
                        toAttribute:NSLayoutAttributeBottom
                             ofView:self.topView
                          predicate:@"0"];

    [self.bottomView alignLeading:@"0" trailing:@"0" toView:self.contentView];
    [self.bottomView constrainHeight:@"600"];

    // Make sure that contentView size is expanded by its subviews
    [self.bottomView alignBottomEdgeWithView:self.contentView predicate:@"0"];
}

@end
