//
//  RTViewController.m
//  StoryboardRotationTests
//
//  Created by Teoni Valois on 1/3/13.
//  Copyright (c) 2013 ngnapps. All rights reserved.
//

#import "RTViewController.h"

@interface RTViewController ()
- (void) deviceOrientationChanged:(NSNotification*)notification;
@end

@implementation RTViewController{
    UIView* _portraitView;
    UIView* _landscapeView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _portraitView = self.view;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)deviceOrientationChanged:(NSNotification *)notification
{
    if(UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ){
        if(!_landscapeView) _landscapeView = [[[NSBundle mainBundle] loadNibNamed:@"LandscapeView" owner:self options:nil] objectAtIndex:0];
        self.view = _landscapeView;
    }else{
        self.view = _portraitView;
    }
}

- (IBAction)minhaAcao:(id)sender {
    [[[UIAlertView alloc] initWithTitle:@"Teste" message:@"Estou funcionando!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}
@end
