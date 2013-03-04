//
//  OptionsViewController.h
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>

@class OptionsViewController;

@protocol OptionsViewDelegate <NSObject>

@required

-(void) updateImageWithFilter: (UIImage*) img;

@end

@interface OptionsViewController : UIViewController
@property (strong, nonatomic) UIImage *currImage;
@property (strong, nonatomic) UIImage *myImage;
@property (weak, nonatomic) id<OptionsViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *sepiaActivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *invertActivity;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *posterizeActivity;
@property (strong, nonatomic) IBOutlet UIButton *sepiaProp;
@property (strong, nonatomic) IBOutlet UIButton *invertProp;
@property (strong, nonatomic) IBOutlet UIButton *posterizeProp;

- (IBAction)filterSepia:(UIButton *)sender;
- (IBAction)filterInvert:(UIButton *)sender;
- (IBAction)filterPosterize:(UIButton *)sender;

@end
