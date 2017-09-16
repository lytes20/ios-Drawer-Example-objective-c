//
//  ViewController.m
//  Drawer
//
//  Created by Gideon Bamuleseyo on 9/16/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "LeftMenuViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main";
    // Do any additional setup after loading the view, typically from a nib.
    
    LeftMenuViewController *leftMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"left_menu"];
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    //left_menu
  
}


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
