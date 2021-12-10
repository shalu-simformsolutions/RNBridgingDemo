//
//  HomeViewController.m
//  RNBridgingDemo
//
//  Created by Simform Solutions on 09/12/21.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import <React/RCTLog.h>

@interface HomeViewController ()


@end

@implementation HomeViewController
@synthesize imageUrl;
- (void)viewDidLoad {
    [super viewDidLoad];
    RCTLogInfo(@"imageUrl %@", [self imageUrl]);
  dispatch_async(dispatch_get_global_queue(0,0), ^{
              NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [self imageUrl]]];
              if ( data == nil )
                  return;
              dispatch_async(dispatch_get_main_queue(), ^{
                  // WARNING: is the cell still using the same data by this point??
                  UIImage *image = [UIImage imageWithData:data];
                  NSLog(@"%@",image);
                [self.imageView setImage:image];

              });
          });
    // Do any additional setup after loading the view.
}
- (IBAction)backToRoot:(UIButton *)sender {
  dispatch_async(dispatch_get_main_queue(), ^{
//    RCTLogInfo(@"dispatch_asynct");
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
  });
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
