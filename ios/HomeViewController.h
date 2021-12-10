//
//  HomeViewController.h
//  RNBridgingDemo
//
//  Created by Simform Solutions on 09/12/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (nonatomic, retain) NSString* imageUrl;
@end

NS_ASSUME_NONNULL_END
