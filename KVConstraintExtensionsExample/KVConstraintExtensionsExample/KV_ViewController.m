//
//  KV_ViewController.m
//  KVConstraintExtensionsExample
//
//  Created by Welcome on 04/08/15.
//  Copyright (c) 2015 Keshav. All rights reserved.
//

#import "KV_ViewController.h"
#import "KVConstraintExtensions.h"

@interface KV_ViewController ()

@property (strong, nonatomic) UIView *containerView;

@end

@implementation KV_ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
    
    [self.containerView applyTopPinConstraintToSuperviewWithPadding:40];
    [self.containerView applyLeadingPinConstraintToSuperviewWithPadding:40];
    [self.containerView applyTrailingPinConstraintToSuperviewWithPadding:40];
    [self.containerView applyHeightConstrain:self.view.center.y];
   
}

- (void)setupViews
{
    self.containerView = [UIView prepareNewViewForConstraint];
    self.containerView.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    [self.view addSubview:self.containerView];
}

- (IBAction)updateConstraintToggleAction:(id)sender
{
    [self.containerView accessAppliedConstraintByAttribute:NSLayoutAttributeHeight completion:^(NSLayoutConstraint *expectedConstraint){
        if (expectedConstraint) {
            if (expectedConstraint.constant) {
                expectedConstraint.constant = 0;
            }else{
                expectedConstraint.constant = self.view.center.y*0.65;
            }
            
            [UIView animateWithDuration:0.25 animations:^{
                [self.view layoutIfNeeded];
                [self.containerView.superview setNeedsDisplay];
            }];
        }
    }];
}


@end
