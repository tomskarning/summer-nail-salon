//
//  NailFinalViewController.m
//  NailSalon
//
//  Created by Alexandra Smau on 5/9/13.
//  Copyright (©) 2015 Delirious Ltd. All rights reserved.
//

#import "NailFinalViewController.h"
#import "AppDelegate.h"
@import GoogleMobileAds;
#import "MenuViewController.h"

@implementation NailFinalViewController
@synthesize nail1ColorNr, nail1GlossNr, nail1PatternNr, nail1TipNr, nail2ColorNr, nail2GlossNr, nail2PatternNr, nail2TipNr, nail3ColorNr, nail3GlossNr, nail3PatternNr, nail3TipNr, nail4ColorNr, nail4GlossNr, nail4PatternNr, nail4TipNr, nail5ColorNr, nail5GlossNr, nail5PatternNr, nail5TipNr, hand, background, extras1Array, extras2Array, extras3Array, extras4Array, extras5Array, fromFridge;


#pragma mark - General

- (instancetype)init
{
    if([UIScreen mainScreen].bounds.size.height == 568)
        self = [super initWithNibName:@"NailFinalViewController-5" bundle:[NSBundle mainBundle]];
    else
        self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	bool areAdsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"areAdsRemoved"];
	//this will load wether or not they bought the in-app purchase
	
	if(!areAdsRemoved) {
		self.bannerView.adUnitID = @"ca-app-pub-4362817468632751/3732066708";
		self.bannerView.rootViewController = self;
		[self.bannerView loadRequest:[GADRequest request]];
	}
	
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        nail1Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d@2x.png", nail1ColorNr]];
        nail2Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d@2x.png", nail2ColorNr]];
        nail3Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d@2x.png", nail3ColorNr]];
        nail4Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d@2x.png", nail4ColorNr]];
        nail5Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d@2x.png", nail5ColorNr]];
        
        nail1Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d@2x.png", nail1GlossNr]];
        nail2Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d@2x.png", nail2GlossNr]];
        nail3Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d@2x.png", nail3GlossNr]];
        nail4Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d@2x.png", nail4GlossNr]];
        nail5Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d@2x.png", nail5GlossNr]];
        
        nail1Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d@2x.png",nail1PatternNr]];
        nail2Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d@2x.png", nail2PatternNr]];
        nail3Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d@2x.png", nail3PatternNr]];
        nail4Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d@2x.png", nail4PatternNr]];
        nail5Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d@2x.png", nail5PatternNr]];
        
        nail1Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d@2x.png",nail1TipNr]];
        nail2Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d@2x.png", nail2TipNr]];
        nail3Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d@2x.png", nail3TipNr]];
        nail4Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d@2x.png", nail4TipNr]];
        nail5Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d@2x.png", nail5TipNr]];
    }
    else
    {
        nail1Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d.png", nail1ColorNr]];
        nail2Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d.png", nail2ColorNr]];
        nail3Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d.png", nail3ColorNr]];
        nail4Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d.png", nail4ColorNr]];
        nail5Color.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailC%d.png", nail5ColorNr]];
        
        nail1Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d.png", nail1GlossNr]];
        nail2Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d.png", nail2GlossNr]];
        nail3Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d.png", nail3GlossNr]];
        nail4Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d.png", nail4GlossNr]];
        nail5Gloss.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailG%d.png", nail5GlossNr]];
        
        nail1Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d.png",nail1PatternNr]];
        nail2Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d.png", nail2PatternNr]];
        nail3Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d.png", nail3PatternNr]];
        nail4Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d.png", nail4PatternNr]];
        nail5Pattern.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailP%d.png", nail5PatternNr]];
        
        nail1Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d.png",nail1TipNr]];
        nail2Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d.png", nail2TipNr]];
        nail3Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d.png", nail3TipNr]];
        nail4Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d.png", nail4TipNr]];
        nail5Tip.image = [UIImage imageNamed:[NSString stringWithFormat:@"smallnailT%d.png", nail5TipNr]];
    }
    
    handImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"hand%d.png", hand]];
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        backgroundImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d~ipad.png", background]];
    else if([UIScreen mainScreen].bounds.size.height == 568)
        backgroundImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d_568.png", background]];
    else
        backgroundImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", background]];
    
    [self addMaskToHoleView];
    [self updateExtras];
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-0.26);
    nail1View.transform = transform;
    
    transform = CGAffineTransformMakeRotation(-0.12);
    nail2View.transform = transform;
    
    transform = CGAffineTransformMakeRotation(+0.9);
    nail5View.transform = transform;
    
    if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == YES)
    {
        CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotation.fromValue = @0.0f;
        rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
        rotation.duration = 0.8; // Speed
        rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
        [unlockSparkle.layer addAnimation:rotation forKey:@"Spin"];
    }
    
    if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == NO)
    {
        [unlockSparkle removeFromSuperview];
    }
    
    firstTime = YES;
    saved = NO;
    
    int timesFinished = [[[NSUserDefaults standardUserDefaults] objectForKey:@"timesFinished"] intValue] + 1;
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", timesFinished] forKey:@"timesFinished"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if(timesFinished == 3 || timesFinished == 6 || timesFinished == 9 || timesFinished == 12 || timesFinished == 15)
		
    

    if(fromFridge == NO)
        ((AppDelegate*)[UIApplication sharedApplication].delegate).fromLastPage = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    long count = [[NSUserDefaults standardUserDefaults]  integerForKey:@"gameOver"];
    if(count % 2 == 0)
    {
		
    }
    count++;
    [[NSUserDefaults standardUserDefaults] setInteger:count forKey:@"gameOver"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startAnimating) name:@"circle" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadScroll) name:@"update" object:nil];
    
    if(firstTime == YES)
    {
        [((AppDelegate*)[UIApplication sharedApplication].delegate) playSoundEffect:4];
        
        CAEmitterLayer *emitter = [CAEmitterLayer layer];
        emitter.emitterCells = @[[self sparkCell]];
        emitter.emitterShape = kCAEmitterLayerPoint;
        emitter.renderMode = kCAEmitterLayerAdditive;
        emitter.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, ([UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.width)/2 + [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
        emitter.birthRate = 1;
        [self.view.layer addSublayer:emitter];

        [self performSelector:@selector(stopEmitting:) withObject:emitter afterDelay:1.5];
        
        firstTime = NO;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - IBAction

- (IBAction)backClick:(id)sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [(AppDelegate*)[UIApplication sharedApplication].delegate playSoundEffect:1];
    [(AppDelegate*)[UIApplication sharedApplication].delegate stopSoundEffect:4];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)homeClick:(id)sender
{
    //[(AppDelegate *)[UIApplication sharedApplication].delegate playSoundEffect:1];
    /*if(fromFridge == YES)
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [(AppDelegate*)[UIApplication sharedApplication].delegate stopSoundEffect:4];
        ((AppDelegate*)[UIApplication sharedApplication].delegate).fromLastPage = YES;
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if(saved == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You didn't save your nails! Do you really want to leave?" delegate:self cancelButtonTitle:@"Leave" otherButtonTitles:@"Save", nil];
        [alert show];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        [(AppDelegate*)[UIApplication sharedApplication].delegate stopSoundEffect:4];
		((AppDelegate*)[UIApplication sharedApplication].delegate).fromLastPage = YES;
		[self.navigationController popToRootViewControllerAnimated:YES];
    }*/
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] playSoundEffect:1];
	MenuViewController *menu = [[MenuViewController alloc] init];
	[self.navigationController pushViewController:menu animated:NO];
}

- (IBAction)shareClick:(id)sender
{
    [(AppDelegate *)[UIApplication sharedApplication].delegate playSoundEffect:1];
    
    //Parental Control
    nr1 = arc4random() % 5 + 4;
    nr2 = arc4random() % 5 + 4;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"%d x %d = ?", nr1, nr2] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    alert.tag = 13;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].keyboardType = UIKeyboardTypeNumberPad;
    [alert show];
}

- (IBAction)saveClick:(id)sender
{
    [((AppDelegate *)[UIApplication sharedApplication].delegate) playSoundEffect:1];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save Your Nails" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Save to Photos", nil];
    actionSheet.tag = 16;
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    [actionSheet showInView:self.view];
}

#pragma mark - Share/Save

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [((AppDelegate*)[UIApplication sharedApplication].delegate) playSoundEffect:1];
    if(actionSheet.tag == 16)
    {
        if(buttonIndex == 1)
        {
            saved = YES;
            //Album
            (self.view).backgroundColor = [UIColor clearColor];
            [backButton removeFromSuperview];
            [saveButton removeFromSuperview];
            [homeButton removeFromSuperview];
            [unlockSparkle removeFromSuperview];
            [backgroundImgView removeFromSuperview];
            
            if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
                UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, [UIScreen mainScreen].scale);
            else
                UIGraphicsBeginImageContext(self.view.frame.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
            
            [self.view addSubview:backButton];
            [self.view addSubview:saveButton];
            [self.view addSubview:homeButton];
            
            if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == YES)
            {
                [self.view addSubview:unlockSparkle];
            }
            [self.view insertSubview:backgroundImgView atIndex:0];

            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = paths[0];
            NSTimeInterval timeStamp = [NSDate date].timeIntervalSince1970;
            NSNumber *timeStampObj = @(timeStamp);
            
            NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",timeStampObj]];
            NSData *imageData = UIImagePNGRepresentation(img);
            [imageData writeToFile:savedImagePath atomically:NO];
            
            if([[NSUserDefaults standardUserDefaults] objectForKey:@"alex_fairies"] == nil)
            {
                NSMutableArray *alex_drinks = [[NSMutableArray alloc] init];
                NSMutableDictionary *md = [[NSMutableDictionary alloc] init];
                md[@"path"] = savedImagePath;
                md[@"nail1ColorNr"] = [NSString stringWithFormat:@"%d", nail1ColorNr];
                md[@"nail1GlossNr"] = [NSString stringWithFormat:@"%d", nail1GlossNr];
                md[@"nail1PatternNr"] = [NSString stringWithFormat:@"%d", nail1PatternNr];
                md[@"nail1TipNr"] = [NSString stringWithFormat:@"%d", nail1TipNr];
                md[@"nail2ColorNr"] = [NSString stringWithFormat:@"%d", nail2ColorNr];
                md[@"nail2GlossNr"] = [NSString stringWithFormat:@"%d", nail2GlossNr];
                md[@"nail2PatternNr"] = [NSString stringWithFormat:@"%d", nail2PatternNr];
                md[@"nail2TipNr"] = [NSString stringWithFormat:@"%d", nail2TipNr];
                md[@"nail3ColorNr"] = [NSString stringWithFormat:@"%d", nail3ColorNr];
                md[@"nail3GlossNr"] = [NSString stringWithFormat:@"%d", nail3GlossNr];
                md[@"nail3PatternNr"] = [NSString stringWithFormat:@"%d", nail3PatternNr];
                md[@"nail3TipNr"] = [NSString stringWithFormat:@"%d", nail3TipNr];
                md[@"nail4ColorNr"] = [NSString stringWithFormat:@"%d", nail4ColorNr];
                md[@"nail4GlossNr"] = [NSString stringWithFormat:@"%d", nail4GlossNr];
                md[@"nail4PatternNr"] = [NSString stringWithFormat:@"%d", nail4PatternNr];
                md[@"nail4TipNr"] = [NSString stringWithFormat:@"%d", nail4TipNr];
                md[@"nail5ColorNr"] = [NSString stringWithFormat:@"%d", nail5ColorNr];
                md[@"nail5GlossNr"] = [NSString stringWithFormat:@"%d", nail5GlossNr];
                md[@"nail5PatternNr"] = [NSString stringWithFormat:@"%d", nail5PatternNr];
                md[@"nail5TipNr"] = [NSString stringWithFormat:@"%d", nail5TipNr];
                md[@"hand"] = [NSString stringWithFormat:@"%d", hand];
                md[@"background"] = [NSString stringWithFormat:@"%d", background];
                md[@"extras1Array"] = extras1Array;
                md[@"extras2Array"] = extras2Array;
                md[@"extras3Array"] = extras3Array;
                md[@"extras4Array"] = extras4Array;
                md[@"extras5Array"] = extras5Array;
                [alex_drinks addObject:md];
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject:alex_drinks];
                [defaults setObject:data forKey:@"alex_fairies"];
                [defaults synchronize];
            }
            else
            {
                NSMutableArray *alex_drinks = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"alex_fairies"]];
                NSMutableDictionary *md = [[NSMutableDictionary alloc] init];
                md[@"path"] = savedImagePath;
                md[@"nail1ColorNr"] = [NSString stringWithFormat:@"%d", nail1ColorNr];
                md[@"nail1GlossNr"] = [NSString stringWithFormat:@"%d", nail1GlossNr];
                md[@"nail1PatternNr"] = [NSString stringWithFormat:@"%d", nail1PatternNr];
                md[@"nail1TipNr"] = [NSString stringWithFormat:@"%d", nail1TipNr];
                md[@"nail2ColorNr"] = [NSString stringWithFormat:@"%d", nail2ColorNr];
                md[@"nail2GlossNr"] = [NSString stringWithFormat:@"%d", nail2GlossNr];
                md[@"nail2PatternNr"] = [NSString stringWithFormat:@"%d", nail2PatternNr];
                md[@"nail2TipNr"] = [NSString stringWithFormat:@"%d", nail2TipNr];
                md[@"nail3ColorNr"] = [NSString stringWithFormat:@"%d", nail3ColorNr];
                md[@"nail3GlossNr"] = [NSString stringWithFormat:@"%d", nail3GlossNr];
                md[@"nail3PatternNr"] = [NSString stringWithFormat:@"%d", nail3PatternNr];
                md[@"nail3TipNr"] = [NSString stringWithFormat:@"%d", nail3TipNr];
                md[@"nail4ColorNr"] = [NSString stringWithFormat:@"%d", nail4ColorNr];
                md[@"nail4GlossNr"] = [NSString stringWithFormat:@"%d", nail4GlossNr];
                md[@"nail4PatternNr"] = [NSString stringWithFormat:@"%d", nail4PatternNr];
                md[@"nail4TipNr"] = [NSString stringWithFormat:@"%d", nail4TipNr];
                md[@"nail5ColorNr"] = [NSString stringWithFormat:@"%d", nail5ColorNr];
                md[@"nail5GlossNr"] = [NSString stringWithFormat:@"%d", nail5GlossNr];
                md[@"nail5PatternNr"] = [NSString stringWithFormat:@"%d", nail5PatternNr];
                md[@"nail5TipNr"] = [NSString stringWithFormat:@"%d", nail5TipNr];
                md[@"hand"] = [NSString stringWithFormat:@"%d", hand];
                md[@"background"] = [NSString stringWithFormat:@"%d", background];
                md[@"extras1Array"] = extras1Array;
                md[@"extras2Array"] = extras2Array;
                md[@"extras3Array"] = extras3Array;
                md[@"extras4Array"] = extras4Array;
                md[@"extras5Array"] = extras5Array;
                [alex_drinks addObject:md];
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject:alex_drinks];
                [defaults setObject:data forKey:@"alex_fairies"];
                [defaults synchronize];
            }
        }
        else if(buttonIndex == 0)
        {
            saved = YES;

            //Photos
            if(imageWithBackground == nil)
            {
                [backButton removeFromSuperview];
                [saveButton removeFromSuperview];
                [homeButton removeFromSuperview];
				
				bool areAdsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:@"areAdsRemoved"];
				if(!areAdsRemoved) {
					[_bannerView removeFromSuperview];
					adDuringSave.hidden = NO;
				}
				
                [unlockSparkle removeFromSuperview];
                
                if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
                    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, [UIScreen mainScreen].scale);
                else
                    UIGraphicsBeginImageContext(self.view.frame.size);
                [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
                imageWithBackground = UIGraphicsGetImageFromCurrentImageContext();
                
                [self.view addSubview:backButton];
                [self.view addSubview:saveButton];
                [self.view addSubview:homeButton];
				
				if(!areAdsRemoved) {
					adDuringSave.hidden = YES;
					[self.view addSubview:_bannerView];
				}
				
                if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == YES)
                {
                    [self.view addSubview:unlockSparkle];
                }
            }
            
            UIImageWriteToSavedPhotosAlbum(imageWithBackground, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    if(actionSheet.tag == 17)
    {
        if(buttonIndex == 0)
        {
			
        }
        else if(buttonIndex == 1)
        {
			
        }
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
	UIAlertView *alert;
    
	if(error)
		alert = [[UIAlertView alloc] initWithTitle:@"Failure"
										   message:@"This pic couldn't be saved in your photo album."
										  delegate:nil cancelButtonTitle:@"Ok"
								 otherButtonTitles:nil];
	else
		alert = [[UIAlertView alloc] initWithTitle:@""
										   message:@"This pic was saved in your photo album"
										  delegate:nil cancelButtonTitle:@"Ok"
								 otherButtonTitles:nil];
	[alert show];
}

#pragma mark - UIAlertView

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 13)
    {
        if(buttonIndex == 0)
        {
            if([[alertView textFieldAtIndex:0].text isEqualToString:[NSString stringWithFormat:@"%d", nr1 * nr2]])
            {
                [alertView dismissWithClickedButtonIndex:-1 animated:YES];
                
                if(imageWithBackground == nil)
                {
                    [backButton removeFromSuperview];
                    [saveButton removeFromSuperview];
                    [homeButton removeFromSuperview];
                    [unlockSparkle removeFromSuperview];
                    
                    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
                        UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, [UIScreen mainScreen].scale);
                    else
                        UIGraphicsBeginImageContext(self.view.frame.size);
                    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
                    imageWithBackground = UIGraphicsGetImageFromCurrentImageContext();
                    
                    [self.view addSubview:backButton];
                    [self.view addSubview:saveButton];
                    [self.view addSubview:homeButton];
                    if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == YES)
					{
						[self.view addSubview:unlockSparkle];
                    }
                }
                
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share Your Nails" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Share to Facebook", @"Email to Friends", nil];
                actionSheet.tag = 17;
                actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
                [actionSheet showInView:self.view];
            }
        }
    }
    else
    {
        if(buttonIndex == 0)
        {
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            [((AppDelegate *)[UIApplication sharedApplication].delegate) playSoundEffect:1];
            ((AppDelegate*)[UIApplication sharedApplication].delegate).fromLastPage = YES;
            [(AppDelegate*)[UIApplication sharedApplication].delegate stopSoundEffect:4];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            [alertView dismissWithClickedButtonIndex:0 animated:YES];
        }
        else
        {
            [alertView dismissWithClickedButtonIndex:1 animated:YES];
            [self saveClick:nil];
        }
    }
}

#pragma mark - Extras

- (void)updateExtras
{
//    if(nailSelected == 1)
//    {
        for(UIView *view in nail1Tip.subviews)
            [view removeFromSuperview];
        
        for(int i = 0; i < extras1Array.count; i++)
        {
            UIImageView *label = [[UIImageView alloc] init];
            
            CGRect frame = CGRectFromString(extras1Array[i][@"frame"]);
            frame.origin.x *= 0.1192;
            frame.origin.y *= 0.1058;
            frame.size.width *= 0.1192;
            frame.size.height *= 0.1192;
            
            label.frame = frame;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d@2x.png", [extras1Array[i][@"pic"] intValue]]];
            else
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d.png", [extras1Array[i][@"pic"] intValue]]];
            
            label.tag = i + 1;
            label.userInteractionEnabled = YES;
            [nail1Tip addSubview:label];
        }
//    }
//    else if(nailSelected == 2)
//    {
        for(UIView *view in nail2Tip.subviews)
            [view removeFromSuperview];
        
        for(int i = 0; i < extras2Array.count; i++)
        {
            UIImageView *label = [[UIImageView alloc] init];
            
            CGRect frame = CGRectFromString(extras2Array[i][@"frame"]);
            frame.origin.x *= 0.1324;
            frame.origin.y *= 0.1204;
            frame.size.width *= 0.1324;
            frame.size.height *= 0.1324;
            
            label.frame = frame;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d@2x.png", [extras2Array[i][@"pic"] intValue]]];
            else
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d.png", [extras2Array[i][@"pic"] intValue]]];
            
            label.tag = i + 1;
            label.userInteractionEnabled = YES;
            [nail2Tip addSubview:label];
        }
//    }
//    else if(nailSelected == 3)
//    {
        for(UIView *view in nail3Tip.subviews)
            [view removeFromSuperview];
        
        for(int i = 0; i < extras3Array.count; i++)
        {
            UIImageView *label = [[UIImageView alloc] init];
            
            CGRect frame = CGRectFromString(extras3Array[i][@"frame"]);
            frame.origin.x *= 0.1324;
            frame.origin.y *= 0.124;
            frame.size.width *= 0.1324;
            frame.size.height *= 0.1324;
            
            label.frame = frame;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d@2x.png", [extras3Array[i][@"pic"] intValue]]];
            else
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d.png", [extras3Array[i][@"pic"] intValue]]];
            
            label.tag = i + 1;
            label.userInteractionEnabled = YES;
            [nail3Tip addSubview:label];
        }
//    }
//    else if(nailSelected == 4)
//    {
        for(UIView *view in nail4Tip.subviews)
            [view removeFromSuperview];
        
        for(int i = 0; i < extras4Array.count; i++)
        {
            UIImageView *label = [[UIImageView alloc] init];
            
            CGRect frame = CGRectFromString(extras4Array[i][@"frame"]);
            frame.origin.x *= 0.1324;
            frame.origin.y *= 0.1204;
            frame.size.width *= 0.1324;
            frame.size.height *= 0.1324;
            
            label.frame = frame;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d@2x.png", [extras4Array[i][@"pic"] intValue]]];
            else
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d.png", [extras4Array[i][@"pic"] intValue]]];
            
            label.tag = i + 1;
            label.userInteractionEnabled = YES;
            [nail4Tip addSubview:label];
        }
//    }
//    else if(nailSelected == 5)
//    {
        for(UIView *view in nail5Tip.subviews)
            [view removeFromSuperview];
        
        for(int i = 0; i < extras5Array.count; i++)
        {
            UIImageView *label = [[UIImageView alloc] init];
            
            CGRect frame = CGRectFromString(extras5Array[i][@"frame"]);
            frame.origin.x *= 0.139;
            frame.origin.y *= 0.124;
            frame.size.width *= 0.139;
            frame.size.height *= 0.139;
            
            label.frame = frame;
            
            if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d@2x.png", [extras5Array[i][@"pic"] intValue]]];
            else
                label.image = [UIImage imageNamed:[NSString stringWithFormat:@"x%d.png", [extras5Array[i][@"pic"] intValue]]];
            
            label.tag = i + 1;
            label.userInteractionEnabled = YES;
            [nail5Tip addSubview:label];
        }
//    }
}

- (void)addMaskToHoleView
{
    CGRect bounds = nail1Tip.bounds;
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"smallnailC1.png"].CGImage;
    nail1Tip.layer.mask = maskLayer;
    
    bounds = nail2Tip.bounds;
    maskLayer = [CALayer layer];
    maskLayer.frame = bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"smallnailC1.png"].CGImage;
    nail2Tip.layer.mask = maskLayer;
    
    bounds = nail3Tip.bounds;
    maskLayer = [CALayer layer];
    maskLayer.frame = bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"smallnailC1.png"].CGImage;
    nail3Tip.layer.mask = maskLayer;
    
    bounds = nail4Tip.bounds;
    maskLayer = [CALayer layer];
    maskLayer.frame = bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"smallnailC1.png"].CGImage;
    nail4Tip.layer.mask = maskLayer;
    
    bounds = nail5Tip.bounds;
    maskLayer = [CALayer layer];
    maskLayer.frame = bounds;
    maskLayer.contents = (id)[UIImage imageNamed:@"smallnailC1.png"].CGImage;
    nail5Tip.layer.mask = maskLayer;
}


#pragma mark - Notif

- (void)startAnimating
{
    if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == YES)
    {
        CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotation.fromValue = @0.0f;
        rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
        rotation.duration = 0.8; // Speed
        rotation.repeatCount = HUGE_VALF; // Repeat forever. Can be a finite number.
        [unlockSparkle.layer addAnimation:rotation forKey:@"Spin"];
    }
}

- (void)reloadScroll
{
    if(((AppDelegate *)[UIApplication sharedApplication].delegate).nailsLocked == NO)
    {
        [unlockSparkle removeFromSuperview];
    }
}

#pragma mark - Dealloc


#pragma mark - Particles

- (void)stopEmitting:(CAEmitterLayer*)emitter
{
    emitter.birthRate = 0;
    [emitter performSelector:@selector(removeFromSuperlayer) withObject:nil afterDelay:3.0];
}

- (CAEmitterCell*)sparkCell
{
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    spark.contents = (id)[UIImage imageNamed:@"white-star.png"].CGImage;
    spark.birthRate = 700;
    spark.lifetime = 3;
    spark.scale = 0.1;
    spark.scaleRange = 0.2;
    spark.emissionRange = 2 * M_PI;
    spark.velocity = 180;
    spark.velocityRange = 8;
    //spark.yAcceleration = -100;
    spark.alphaRange = 0.5;
    spark.alphaSpeed = -1;
    spark.spin = 1;
    spark.spinRange = 6;
    spark.alphaRange = 0.6;
    spark.redRange = 2;
    spark.greenRange = 3;
    spark.blueRange = 3;
    spark.name = @"spark";
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        spark.scale = 0.25;
        spark.lifetime = 5;
        spark.velocity = 350;
    }
    return spark;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch;)");
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    [(AppDelegate*)[UIApplication sharedApplication].delegate playSoundEffect:3];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.emitterCells = @[[self sparkCell2]];
    emitter.emitterShape = kCAEmitterLayerPoint;
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.frame = CGRectMake(touchPoint.x, touchPoint.y, 100, 100);
    emitter.birthRate = 1;
    [self.view.layer addSublayer:emitter];
    
    [self performSelector:@selector(stopEmitting2:) withObject:emitter afterDelay:0.4];
}

#pragma mark - Particles

- (void)stopEmitting2:(CAEmitterLayer*)emitter
{
    emitter.birthRate = 0;
    [emitter performSelector:@selector(removeFromSuperlayer) withObject:nil afterDelay:3.0];
}

- (CAEmitterCell*)sparkCell2
{
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    spark.contents = (id)[UIImage imageNamed:@"spark.png"].CGImage;
    spark.birthRate = 800;
    spark.lifetime = 3;
    spark.scale = 0.1;
    spark.scaleRange = 0.2;
    spark.emissionRange = 2 * M_PI;
    spark.velocity = 60;
    spark.velocityRange = 8;
    //spark.yAcceleration = -100;
    spark.alphaRange = 0.5;
    spark.alphaSpeed = -1;
    spark.spin = 1;
    spark.spinRange = 6;
    spark.alphaRange = 0.8;
    spark.redRange = 2;
    spark.greenRange = 1;
    spark.blueRange = 1;
    spark.name = @"spark";
    return spark;
}

@end
