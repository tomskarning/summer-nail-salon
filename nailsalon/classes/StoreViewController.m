//
//  StoreViewController.m
//  Summer Nail Salon
//
//  Created by Tom Andre Skarning on 18.11.2015.
//  Copyright © 2015 Delirious Ltd. All rights reserved.
//

#import "StoreViewController.h"
#import "MenuViewController.h"
#import "AppDelegate.h"
#import <StoreKit/StoreKit.h>
@import GoogleMobileAds;

@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	bool areAdsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"areAdsRemoved"];
	//this will load wether or not they bought the in-app purchase
	
	if(!areAdsRemoved) {
		dispatch_async(dispatch_get_main_queue(), ^{
			_removeAdsStatus.hidden= YES;
		});
		self.bannerView.adUnitID = @"ca-app-pub-4362817468632751/3732066708";
		self.bannerView.rootViewController = self;
		[self.bannerView loadRequest:[GADRequest request]];
	} else {
		dispatch_async(dispatch_get_main_queue(), ^{
			[_bannerView removeFromSuperview];
			_purchaseButton.enabled = NO;
			_removeAdsStatus.hidden = NO;
		});
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//If you have more than one in-app purchase, you can define both of
//of them here. So, for example, you could define both kRemoveAdsProductIdentifier
//and kBuyCurrencyProductIdentifier with their respective product ids
//
//for this example, we will only use one product

#define kRemoveAdsProductIdentifier @"removeAds"

- (IBAction)tapsRemoveAds{
	NSLog(@"User requests to remove ads");
	
	if([SKPaymentQueue canMakePayments]){
		NSLog(@"User can make payments");
		
		//If you have more than one in-app purchase, and would like
		//to have the user purchase a different product, simply define
		//another function and replace kRemoveAdsProductIdentifier with
		//the identifier for the other product
		
		SKProductsRequest *productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:kRemoveAdsProductIdentifier]];
		productsRequest.delegate = self;
		[productsRequest start];
		
	}
	else{
		NSLog(@"User cannot make payments due to parental controls");
		//this is called the user cannot make payments, most likely due to parental controls
	}
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
	SKProduct *validProduct = nil;
	int count = [response.products count];
	if(count > 0){
		validProduct = [response.products objectAtIndex:0];
		NSLog(@"Products Available!");
		[self purchase:validProduct];
	}
	else if(!validProduct){
		NSLog(@"No products available");
		//this is called if your product id is not valid, this shouldn't be called unless that happens.
	}
}

- (IBAction)purchase:(SKProduct *)product{
	SKPayment *payment = [SKPayment paymentWithProduct:product];
	
	[[SKPaymentQueue defaultQueue] addTransactionObserver:self];
	[[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (IBAction) restore{
	//this is called when the user restores purchases, you should hook this up to a button
	[[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
	NSLog(@"received restored transactions: %i", queue.transactions.count);
	for(SKPaymentTransaction *transaction in queue.transactions){
		if(transaction.transactionState == SKPaymentTransactionStateRestored){
			//called when the user successfully restores a purchase
			NSLog(@"Transaction state -> Restored");
			
			[self doRemoveAds];
			[[SKPaymentQueue defaultQueue] finishTransaction:transaction];
			break;
		}
	}
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
	for(SKPaymentTransaction *transaction in transactions){
		switch(transaction.transactionState){
			case SKPaymentTransactionStatePurchasing: NSLog(@"Transaction state -> Purchasing");
				//called when the user is in the process of purchasing, do not add any of your own code here.
				break;
			case SKPaymentTransactionStatePurchased:
				//this is called when the user has successfully purchased the package (Cha-Ching!)
				[self doRemoveAds]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
				[[SKPaymentQueue defaultQueue] finishTransaction:transaction];
				NSLog(@"Transaction state -> Purchased");
				break;
			case SKPaymentTransactionStateRestored:
				NSLog(@"Transaction state -> Restored");
				//add the same code as you did from SKPaymentTransactionStatePurchased here
				[[SKPaymentQueue defaultQueue] finishTransaction:transaction];
				break;
			case SKPaymentTransactionStateFailed:
				//called when the transaction does not finish
				if(transaction.error.code == SKErrorPaymentCancelled){
					NSLog(@"Transaction state -> Cancelled");
					//the user cancelled the payment ;(
				}
				[[SKPaymentQueue defaultQueue] finishTransaction:transaction];
				break;
		}
	}
}

- (void)doRemoveAds{
	[self.view setBackgroundColor:[UIColor blueColor]];
	//areAdsRemoved = YES;
	//set the bool for whether or not they purchased it to YES, you could use your own boolean here, but you would have to declare it in your .h file
	
	[[NSUserDefaults standardUserDefaults] setBool:true forKey:@"areAdsRemoved"];
	//use NSUserDefaults so that you can load wether or not they bought it
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	[self viewDidLoad];
}

- (IBAction)StoreBackButton{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:1];
	MenuViewController *menu = [[MenuViewController alloc] init];
	[self.navigationController pushViewController:menu animated:NO];
}
@end
