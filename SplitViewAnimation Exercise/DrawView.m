//
//  DrawView.m
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import "DrawView.h"
#import "OptionsViewController.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(53, 75, 662, 500)];
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_button setFrame:CGRectMake(48, 10, 100, 50)];
        [_button setTitle:@"Options" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(bringPopOver) forControlEvents:UIControlEventTouchUpInside];
        [_button setHidden:YES];
        [self addSubview:_button];
        [self addSubview:self.imageView];
        
        OptionsViewController *OVC = [[OptionsViewController alloc]init];
        self.pop = [[UIPopoverController alloc]initWithContentViewController:OVC];
        [self.pop setPopoverContentSize:CGSizeMake(360, 50)];
        
    }
    return self;
}

-(void) updateImageWithFilter:(UIImage *)img
{
    [self.imageView setImage:img];
    
}
-(void) bringPopOver
{
    OptionsViewController *OVC = (OptionsViewController*)self.pop.contentViewController;
    OVC.currImage = self.imageView.image;
    OVC.delegate = self;
    [self.pop presentPopoverFromRect:self.button.frame inView:self permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
            
}

- (void)drawRect:(CGRect)rect
{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    [lineLayer setFrame:CGRectMake(self.imageView.frame.origin.x-5, self.imageView.frame.origin.y-5, self.imageView.frame.size.width+10, self.imageView.frame.size.height+10)];
    [lineLayer setFillColor:[[UIColor clearColor]CGColor]];
    [lineLayer setStrokeColor:[[UIColor yellowColor]CGColor]];
    [lineLayer setLineCap:kCALineCapSquare];
    [lineLayer setLineJoin:kCALineJoinBevel];
    [lineLayer setLineWidth:5.0];
    
    CGMutablePathRef linePath = CGPathCreateMutable();
    CGPathMoveToPoint(linePath, NULL, 0, 0);
    CGPathAddLineToPoint(linePath, NULL, self.imageView.frame.size.width+10, 0);
    CGPathAddLineToPoint(linePath, NULL, self.imageView.frame.size.width+10, self.imageView.frame.size.height+10);
    CGPathAddLineToPoint(linePath, NULL, 0, self.imageView.frame.size.height+10);
    CGPathAddLineToPoint(linePath, NULL, 0, 0);
    
    [lineLayer setPath:linePath];
    
    CGPathRelease(linePath);
    
    [CATransaction begin];
	[CATransaction setAnimationDuration:2.0];
	[CATransaction setCompletionBlock:^{
        
		[self.imageView setHidden:NO];
        [self.button setHidden:NO];
        
	}];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2.0;
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    
    [lineLayer addAnimation:animation forKey:@"animateStrokeEnd"];
    
    [CATransaction commit];
    
    [self.layer addSublayer:lineLayer];
    
}


@end
