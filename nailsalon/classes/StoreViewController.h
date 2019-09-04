//
//  StoreViewController.h
//  Summer Nail Salon
//
//  Created by Tom Andre Skarning on 18.11.2015.
//  Copyright © 2015 Delirious Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface StoreViewController : UIViewController
{
	
}

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@property (weak, nonatomic) IBOutlet UIButton *purchaseButton;

@property (weak, nonatomic) IBOutlet UILabel *removeAdsStatus;

- (IBAction)StoreBackButton;

- (IBAction)purchase;
- (IBAction)restore;

@end

BOOL areAdsRemoved;