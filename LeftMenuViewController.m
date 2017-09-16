//
//  LeftMenuViewController.m
//  Drawer
//
//  Created by Gideon Bamuleseyo on 9/16/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "AppDelegate.h"
#import "SlideNavigationController.h"

@interface LeftMenuViewController ()
@property (strong, nonatomic) NSArray *menuItems;
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _menuItems=@[@{@"name": @"Home", @"icon":@"home.png"}, @{@"name": @"Notifications", @"icon":@"notifications-button.png"}];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _menuItems.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menu_cell"];
    NSDictionary *item = [_menuItems objectAtIndex:indexPath.row];
    UIImageView *iv = [cell viewWithTag:1];
    UILabel *name = [cell viewWithTag:2];
    
    iv.image = [UIImage imageNamed:[item objectForKey:@"icon"]];
    name.text = [item objectForKey:@"name"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSString *vc_id = @"";
   NSString *name = [[_menuItems objectAtIndex:indexPath.row] objectForKey:@"name"];
   
    if ([name isEqualToString:@"Home"]){
        vc_id = @"main_vc";
    }else if ([name isEqualToString:@"Notifications"]){
        vc_id = @"notifications_vc";
    }
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:vc_id];
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc withCompletion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)helloWorld:(UIButton *)sender {
    NSLog(@"HELLO WORLD");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
