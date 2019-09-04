//
//  MenuViewController.m
//  NailSalon
//
//  Created by Alexandra Smau on 5/7/13.
//  Copyright (©) 2015 Delirious Ltd. All rights reserved.
//

#import "MenuViewController.h"
#import "NailDecorateViewController.h"
#import "StoreViewController.h"
#import "AppDelegate.h"
@import GoogleMobileAds;


@implementation MenuViewController

- (id)init
{
    if([[UIScreen mainScreen] bounds].size.height == 568)
        self = [super initWithNibName:@"MenuViewController-5" bundle:[NSBundle mainBundle]];
    else
        self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	bool areAdsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"areAdsRemoved"];
	
	//this will load wether or not they bought the in-app purchase
	
	if(!areAdsRemoved){
		//NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
		self.bannerView.adUnitID = @"ca-app-pub-4362817468632751/3732066708";
		self.bannerView.rootViewController = self;
		[self.bannerView loadRequest:[GADRequest request]];
	}
}


- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidAppear:(BOOL)animated
{
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:5];
    long count = [[NSUserDefaults standardUserDefaults]  integerForKey:@"mainMenu"];
        if(count %2 == 0)
        {
            
        }
    
    count++;
    [[NSUserDefaults standardUserDefaults] setInteger:count forKey:@"mainMenu"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [super viewDidAppear:animated];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startAnimating) name:@"circle" object:nil];
    if([(AppDelegate*)[[UIApplication sharedApplication] delegate] fromLastPage] == YES)
    {
        ((AppDelegate*)[[UIApplication sharedApplication] delegate]).fromLastPage = NO;
    }
    
    if([(AppDelegate*)[[UIApplication sharedApplication] delegate] nailsLocked] == NO)
    {
		
    }
    
    if([(AppDelegate*)[[UIApplication sharedApplication] delegate] firstTime] == YES)
    {
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:2];
        ((AppDelegate*)[[UIApplication sharedApplication] delegate]).firstTime = NO;
    }
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 2.5; // Speed
    rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [unlockSparkle.layer addAnimation:rotation forKey:@"Spin"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)startAnimating
{
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 2.5; // Speed
    rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
    [unlockSparkle.layer addAnimation:rotation forKey:@"Spin"];
}

#pragma mark - IBAction

- (IBAction)play:(id)sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:1];
    NailDecorateViewController *nail = [[NailDecorateViewController alloc] init];
    [self.navigationController pushViewController:nail animated:YES];
}

#pragma mark - UIAlertViewDelegate

/*- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        if([[alertView textFieldAtIndex:0].text isEqualToString:[NSString stringWithFormat:@"%d", nr1 * nr2]])
        {
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [UIView transitionWithView:self.navigationController.view duration:1.0 options:UIViewAnimationOptionTransitionCurlDown animations:^
             {
				 
			 } completion:nil];
        }
    }
}*/

- (IBAction)storeButton{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:1];
	StoreViewController *store = [[StoreViewController alloc] init];
	[self.navigationController pushViewController:store animated:NO];
}

@end
