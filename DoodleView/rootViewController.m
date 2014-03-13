//
//  rootViewController.m
//  DoodleView
//
//  Created by Lanou on 14-1-21.
//  Copyright (c) 2014年 Lanou. All rights reserved.
//

#import "rootViewController.h"
#import "DrawView.h"
@interface rootViewController ()

@end

@implementation rootViewController

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
	// Do any additional setup after loading the view.
    
    DrawView * draw = [[DrawView alloc] initWithFrame:CGRectMake(0, 20, 320, 460)];
    [draw setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:draw];
    [draw release];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
