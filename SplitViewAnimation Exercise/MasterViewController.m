//
//  MasterViewController.m
//  SplitViewAnimation Exercise
//
//  Created by Unbounded Solutions on 2/27/13.
//  Copyright (c) 2013 unlimited. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DrawView.h"

@interface MasterViewController ()
{
    NSArray *pictures;
}
@end

@implementation MasterViewController

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
    UIImage *clunk = [UIImage imageNamed:@"clunk.png"];
    UIImage *leon = [UIImage imageNamed:@"leon.png"];
    UIImage *lonestar = [UIImage imageNamed:@"lonestar.png"];
    UIImage *voltar = [UIImage imageNamed:@"voltar.png"];
    UIImage *froggy = [UIImage imageNamed:@"froggy.png"];
    pictures = [[NSArray alloc]initWithObjects:clunk, leon, lonestar, voltar, froggy, nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 204;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    UIImageView *image = [[UIImageView alloc]initWithImage:[pictures objectAtIndex:indexPath.row]];
    [image setFrame:CGRectMake(24, 0, 272, 204)];
    [tableView setBackgroundColor:[UIColor blackColor]];
    [cell addSubview:image];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pictures.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *DVC = [[[[self.splitViewController viewControllers] objectAtIndex:1]viewControllers]objectAtIndex:0];
    DrawView *DV = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, DVC.view.frame.size.width, DVC.view.frame.size.height)];
    [DVC.view addSubview:DV];
    [DV.imageView setImage:[pictures objectAtIndex:indexPath.row]];
    [DV.imageView setHidden:YES];
    [DV setNeedsDisplay];
    [DVC.popController dismissPopoverAnimated:YES];
    
}
@end
