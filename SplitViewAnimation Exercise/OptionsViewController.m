//
//  OptionsViewController.m
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()
{
    CIImage *image;
    CIContext *context;
}

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    
}

-(void)viewWillAppear:(BOOL)animated
{
    context = [CIContext contextWithOptions:nil];
    CGImageRef currRef =  (CGImageRef)[self.currImage CGImage];
    image = [CIImage imageWithCGImage:currRef];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)filterSepia:(UIButton *)sender {
    [self.sepiaProp setEnabled:NO];
    [self.invertProp setEnabled:NO];
    [self.posterizeProp setEnabled:NO];
    [self.sepiaActivity startAnimating];
    
    dispatch_async(dispatch_queue_create("newQueue", NULL), ^{
        
        CIFilter *sepFilter = [CIFilter filterWithName:@"CISepiaTone"];
        [sepFilter setValue:image forKey:kCIInputImageKey];
        [sepFilter setValue:[NSNumber numberWithFloat:0.9f] forKey:@"InputIntensity"];
        CIImage *resultImg = [sepFilter valueForKey:kCIOutputImageKey];
        self.myImage = [UIImage imageWithCGImage:[context createCGImage:resultImg fromRect:[resultImg extent]]];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            if([self.delegate respondsToSelector:@selector(updateImageWithFilter:)])
            {
                [self.delegate updateImageWithFilter:self.myImage];
            }
        
            [self.sepiaActivity stopAnimating];
            [self.invertProp setEnabled:YES];
            [self.posterizeProp setEnabled:YES];
            [self.sepiaProp setEnabled:YES];
       });
        
   });

}

- (IBAction)filterInvert:(UIButton *)sender {
    [self.sepiaProp setEnabled:NO];
    [self.invertProp setEnabled:NO];
    [self.posterizeProp setEnabled:NO];
    [self.invertActivity startAnimating];
    
    dispatch_async(dispatch_queue_create("newQueue", NULL), ^{
       
        CIFilter *invFilter = [CIFilter filterWithName:@"CIColorInvert"];
        [invFilter setValue:image forKey:kCIInputImageKey];

        CIImage *resultImg = [invFilter valueForKey:kCIOutputImageKey];
        self.myImage = [UIImage imageWithCGImage:[context createCGImage:resultImg fromRect:[resultImg extent]]];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate updateImageWithFilter:self.myImage];
            [self.invertActivity stopAnimating];
            [self.invertProp setEnabled:YES];
            [self.posterizeProp setEnabled:YES];
            [self.sepiaProp setEnabled:YES];
        });
        
    });
}

- (IBAction)filterPosterize:(UIButton *)sender {
    [self.sepiaProp setEnabled:NO];
    [self.invertProp setEnabled:NO];
    [self.posterizeProp setEnabled:NO];
    [self.sepiaActivity startAnimating];
    dispatch_async(dispatch_queue_create("newQueue", NULL), ^{
        
        CIFilter *posFilter = [CIFilter filterWithName:@"CIColorPosterize"];
        [posFilter setValue:image forKey:kCIInputImageKey];

        CIImage *resultImg = [posFilter valueForKey:kCIOutputImageKey];
        self.myImage = [UIImage imageWithCGImage:[context createCGImage:resultImg fromRect:[resultImg extent]]];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate updateImageWithFilter:self.myImage];
            [self.sepiaActivity stopAnimating];
            [self.invertProp setEnabled:YES];
            [self.posterizeProp setEnabled:YES];
            [self.sepiaProp setEnabled:YES];
        });
        
    });
}
@end
