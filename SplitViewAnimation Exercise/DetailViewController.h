//
//  DetailViewController.h
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIPopoverController *popController;

@end
