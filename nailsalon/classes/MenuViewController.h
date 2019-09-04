//
//  MenuViewController.h
//  NailSalon
//
//  Created by Alexandra Smau on 5/7/13.
//  Copyright (©) 2015 Delirious Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface MenuViewController : UIViewController <UIAlertViewDelegate>

{
    IBOutlet UIImageView *unlockSparkle;
    int nr1;
    int nr2;
}

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

- (IBAction)storeButton;

- (IBAction)play:(id)sender;

@end
