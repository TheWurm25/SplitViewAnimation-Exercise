//
//  DrawView.h
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OptionsViewController.h"

@interface DrawView : UIView <OptionsViewDelegate>

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIPopoverController *pop;

@end
