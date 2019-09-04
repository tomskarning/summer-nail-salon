//
//  AppDelegate.m
//  NailSalon
//
//  Created by Alexandra Smau on 5/7/13.
/*
 MIT License
 
 Copyright (c) 2019 Tom Skarning
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "Countly.h"

@implementation AppDelegate
@synthesize nailsLocked, colorLocked, glossLocked, patternLocked, tipLocked, extrasLocked, backgroundLocked;
@synthesize fromLastPage;
@synthesize firstTime;



#pragma mark - Locked
- (void)initializeLocked
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"nailsLocked"] == nil)
    {
        nailsLocked = NO; // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"nailsLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"nailsLocked"] isEqualToString:@"YES"])
    {
        nailsLocked = NO;
    }
    else
    {
        nailsLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"colorLocked"] == nil)
    {
        colorLocked = NO;  // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"colorLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"colorLocked"] isEqualToString:@"YES"])
    {
        colorLocked = NO; // HERE OLD IS YES
    }
    else
    {
        colorLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"glossLocked"] == nil)
    {
        glossLocked = NO; // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"glossLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"glossLocked"] isEqualToString:@"YES"])
    {
        glossLocked = NO; // HERE OLD IS YES
    }
    else
    {
        glossLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"patternLocked"] == nil)
    {
        patternLocked = NO; // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"patternLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"patternLocked"] isEqualToString:@"YES"])
    {
        patternLocked = NO; // HERE OLD IS YES
    }
    else
    {
        patternLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"backgroundLocked"] == nil)
    {
        backgroundLocked = YES;
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"backgroundLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"backgroundLocked"] isEqualToString:@"YES"])
    {
        backgroundLocked = NO; // HERE OLD IS YES
    }
    else
    {
        backgroundLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"tipLocked"] == nil)
    {
        tipLocked = NO; // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"tipLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"tipLocked"] isEqualToString:@"YES"])
    {
        tipLocked = NO; // HERE OLD IS YES
    }
    else
    {
        tipLocked = NO;
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"extrasLocked"] == nil)
    {
        extrasLocked = NO; // HERE OLD IS YES
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"extrasLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if([[[NSUserDefaults standardUserDefaults] objectForKey:@"extrasLocked"] isEqualToString:@"YES"])
    {
        extrasLocked = NO; // HERE OLD IS YES
    }
    else
    {
        extrasLocked = NO;
    }
}

#pragma mark - Sounds

- (void)prepareSoundEffects
{
    NSURL *soundPath = nil;
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    
    
    soundPath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"General_UIButtonSound_MS" ofType:@"mp3"]];
    buttonTap = [[AVAudioPlayer alloc]initWithContentsOfURL:soundPath error:NULL];
    [buttonTap setDelegate:nil];
    [buttonTap prepareToPlay];
    
    soundPath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Magic Wand Noise-SoundBible.com-375928671" ofType:@"mp3"]];
    initialSound = [[AVAudioPlayer alloc]initWithContentsOfURL:soundPath error:NULL];
    [initialSound setDelegate:nil];
    [initialSound prepareToPlay];
    
    soundPath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"magic-chime-06" ofType:@"mp3"]];
    sparkleSound = [[AVAudioPlayer alloc]initWithContentsOfURL:soundPath error:NULL];
    [sparkleSound setDelegate:nil];
    [sparkleSound prepareToPlay];
    
    soundPath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CompletedDishMusic_CF" ofType:@"mp3"]];
    finalSound = [[AVAudioPlayer alloc]initWithContentsOfURL:soundPath error:NULL];
    [finalSound setDelegate:nil];
    [finalSound prepareToPlay];
    
    soundPath = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BCrutchfield - Peaceful Video Game Loop" ofType:@"mp3"]];
    loopSong = [[AVAudioPlayer alloc]initWithContentsOfURL:soundPath error:NULL];
    [loopSong setDelegate:nil];
    [loopSong prepareToPlay];
    loopSong.numberOfLoops = -1;    
}

- (void)playSoundEffect:(NSInteger)sound
{
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"sounds"] isEqualToString:@"yes"])
    {
        if(sound == 1)
        {
            [buttonTap play];
        }
        else if(sound == 2)
        {
            [initialSound play];
        }
        else if(sound == 3)
        {
            [sparkleSound stop];
            sparkleSound.currentTime = 0.0;
            [sparkleSound play];
        }
        else if(sound == 4)
        {
            finalSound.currentTime = 0.0;
            [finalSound play];
        }
        else if(sound == 5)
        {
            [loopSong play];
        }
    }
}

- (void)stopSoundEffect:(NSInteger)sound
{
    if(sound == 4)
    {
        [finalSound stop];
    }
    else if(sound == 5)
    {
        [loopSong stop];
    }
}

#pragma mark - General

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[Countly sharedInstance] startWithMessagingUsing:@"3058efb28c4a200f280ba4e0735819aee9c22a7b" withHost:@"https://cloud.count.ly/" andOptions:launchOptions];
	
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"IS_FIRST_RUN"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"mainMenu"];
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"gameOver"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self initializeLocked];
    [self prepareSoundEffects];
    
    fromLastPage = YES;
    firstTime = YES;
       
    if(![[[NSUserDefaults standardUserDefaults] objectForKey:@"sounds"] isEqualToString:@"no"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"sounds"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"timesFinished"] == nil)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"timesFinished"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    self.navigationController.navigationBarHidden = YES;
    
    NSString *deviceType = [UIDevice currentDevice].systemVersion;
    int ios = [deviceType componentsSeparatedByString:@"."][0].intValue;
    
    [self.navigationController setNavigationBarHidden:YES];
    if(ios < 6)
        [self.window addSubview:self.navigationController.view];
    else
        (self.window).rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    if(nailsLocked == YES)
        [[NSNotificationCenter defaultCenter] postNotificationName:@"circle" object:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
