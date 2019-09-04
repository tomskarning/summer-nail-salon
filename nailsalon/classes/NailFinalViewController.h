//
//  NailFinalViewController.h
//  NailSalon
//
//  Created by Alexandra Smau on 5/9/13.
//  Copyright (©) 2015 Delirious Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
@import GoogleMobileAds;

@interface NailFinalViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>
{
    IBOutlet UIImageView *handImgView;
    IBOutlet UIImageView *unlockSparkle;
    IBOutlet UIImageView *backgroundImgView;
    
    IBOutlet UIView *nail1View;
    IBOutlet UIView *nail2View;
    IBOutlet UIView *nail3View;
    IBOutlet UIView *nail4View;
    IBOutlet UIView *nail5View;
    
    IBOutlet UIImageView *nail1Color;
    IBOutlet UIImageView *nail1Gloss;
    IBOutlet UIImageView *nail1Pattern;
    IBOutlet UIImageView *nail1Tip;
    
    IBOutlet UIImageView *nail2Color;
    IBOutlet UIImageView *nail2Gloss;
    IBOutlet UIImageView *nail2Pattern;
    IBOutlet UIImageView *nail2Tip;
    
    IBOutlet UIImageView *nail3Color;
    IBOutlet UIImageView *nail3Gloss;
    IBOutlet UIImageView *nail3Pattern;
    IBOutlet UIImageView *nail3Tip;
    
    IBOutlet UIImageView *nail4Color;
    IBOutlet UIImageView *nail4Gloss;
    IBOutlet UIImageView *nail4Pattern;
    IBOutlet UIImageView *nail4Tip;
    
    IBOutlet UIImageView *nail5Color;
    IBOutlet UIImageView *nail5Gloss;
    IBOutlet UIImageView *nail5Pattern;
    IBOutlet UIImageView *nail5Tip;
    
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *saveButton;
    IBOutlet UIButton *homeButton;

	__weak IBOutlet UIImageView *adDuringSave;
	
    int nail1ColorNr;
    int nail1GlossNr;
    int nail1PatternNr;
    int nail1TipNr;
    int nail2ColorNr;
    int nail2GlossNr;
    int nail2PatternNr;
    int nail2TipNr;
    int nail3ColorNr;
    int nail3GlossNr;
    int nail3PatternNr;
    int nail3TipNr;
    int nail4ColorNr;
    int nail4GlossNr;
    int nail4PatternNr;
    int nail4TipNr;
    int nail5ColorNr;
    int nail5GlossNr;
    int nail5PatternNr;
    int nail5TipNr;
    int hand;
    int background;
    
    NSMutableArray *extras1Array;
    NSMutableArray *extras2Array;
    NSMutableArray *extras3Array;
    NSMutableArray *extras4Array;
    NSMutableArray *extras5Array;
    
    UIImage *imageWithBackground;
    BOOL saved;
    BOOL fromFridge;
    BOOL firstTime;
    
    int nr1;
    int nr2;
}

@property (nonatomic) BOOL fromFridge;

@property (nonatomic) int nail1ColorNr;
@property (nonatomic) int nail1GlossNr;
@property (nonatomic) int nail1PatternNr;
@property (nonatomic) int nail1TipNr;
@property (nonatomic) int nail2ColorNr;
@property (nonatomic) int nail2GlossNr;
@property (nonatomic) int nail2PatternNr;
@property (nonatomic) int nail2TipNr;
@property (nonatomic) int nail3ColorNr;
@property (nonatomic) int nail3GlossNr;
@property (nonatomic) int nail3PatternNr;
@property (nonatomic) int nail3TipNr;
@property (nonatomic) int nail4ColorNr;
@property (nonatomic) int nail4GlossNr;
@property (nonatomic) int nail4PatternNr;
@property (nonatomic) int nail4TipNr;
@property (nonatomic) int nail5ColorNr;
@property (nonatomic) int nail5GlossNr;
@property (nonatomic) int nail5PatternNr;
@property (nonatomic) int nail5TipNr;
@property (nonatomic) int hand;
@property (nonatomic) int background;
@property (nonatomic, strong) NSMutableArray *extras1Array;
@property (nonatomic, strong) NSMutableArray *extras2Array;
@property (nonatomic, strong) NSMutableArray *extras3Array;
@property (nonatomic, strong) NSMutableArray *extras4Array;
@property (nonatomic, strong) NSMutableArray *extras5Array;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

- (IBAction)backClick:(id)sender;
- (IBAction)homeClick:(id)sender;
- (IBAction)saveClick:(id)sender;

@end
