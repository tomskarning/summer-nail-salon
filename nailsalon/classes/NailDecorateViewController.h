//
//  NailDecorateViewController.h
//  NailSalon
//
//  Created by Alexandra Smau on 5/7/13.
//  Copyright (©) 2015 Delirious Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface NailDecorateViewController : UIViewController
{
    IBOutlet UIImageView *handImgView;
    IBOutlet UIImageView *fingerImgView;
    IBOutlet UIImageView *unlockSparkle1;
    IBOutlet UIImageView *unlockSparkle2;
    IBOutlet UIImageView *backgroundImgView;
    IBOutlet UIImageView *background2ImgView;
    
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
    
    IBOutlet UIView *singleFinger;
    IBOutlet UIImageView *singleColor;
    IBOutlet UIImageView *singleGloss;
    IBOutlet UIImageView *singlePattern;
    IBOutlet UIImageView *singleTip;
    
    IBOutlet UIScrollView *secondScroll;
    IBOutlet UIImageView *greyImgView;
    IBOutlet UIScrollView *menuScroll;
    
    IBOutlet UIButton *unlockEv1;
    IBOutlet UIButton *unlockEv2;
    
    long nailSelected;
    long lastAccessory;
    
    long nail1ColorNr;
    long nail1GlossNr;
    long nail1PatternNr;
    long nail1TipNr;
    long nail2ColorNr;
    long nail2GlossNr;
    long nail2PatternNr;
    long nail2TipNr;
    long nail3ColorNr;
    long nail3GlossNr;
    long nail3PatternNr;
    long nail3TipNr;
    long nail4ColorNr;
    long nail4GlossNr;
    long nail4PatternNr;
    long nail4TipNr;
    long nail5ColorNr;
    long nail5GlossNr;
    long nail5PatternNr;
    long nail5TipNr;
    long hand;
    long background;
    
    NSMutableArray *extras1Array;
    NSMutableArray *extras2Array;
    NSMutableArray *extras3Array;
    NSMutableArray *extras4Array;
    NSMutableArray *extras5Array;
    NSMutableArray *changes1;
    NSMutableArray *changes2;
    NSMutableArray *changes3;
    NSMutableArray *changes4;
    NSMutableArray *changes5;
}

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerViewFinger;

- (IBAction)nailSelected:(UIButton*)sender;
- (IBAction)backFromFinger:(id)sender;
- (IBAction)menuChosen:(UIButton*)sender;
- (IBAction)backClick:(id)sender;
- (IBAction)undoClick:(id)sender;
- (IBAction)nextClick:(id)sender;
- (IBAction)applyToAll:(id)sender;

@end
