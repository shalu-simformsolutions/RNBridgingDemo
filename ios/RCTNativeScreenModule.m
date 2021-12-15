//
//  NativeScreenModule.m
//  RNBridgingDemo
//
//  Created by Simform Solutions on 03/12/21.
//

#import "RCTNativeScreenModule.h"
#import <React/RCTLog.h>
#import "AppDelegate.h"
#import "HomeViewController.h"

@implementation RCTNativeScreenModule
// To export a module named NativeScreenModule
RCT_EXPORT_MODULE(NativeScreen);

RCT_EXPORT_METHOD(NavigateToNative:(NSString *)url)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    HomeViewController *homeViewController = [[UIStoryboard storyboardWithName:@"HomeStoryboard" bundle: nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    homeViewController.imageUrl = url;
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate.window.rootViewController presentViewController: homeViewController animated:YES completion:nil];
  });
}


RCT_EXPORT_METHOD(TestingEvent:(NSString *)name)
{
 RCTLogInfo(@"Testing ios event %@", name);
}

@end
