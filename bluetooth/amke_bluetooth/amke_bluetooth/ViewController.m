//
//  ViewController.m
//  amke_bluetooth
//
//  Created by Asimo on 9/4/15.
//  Copyright (c) 2015 Tellart. All rights reserved.
//

#import "ViewController.h"
#import "RFduinoManager.h"
#import "RFduino.h"

@interface ViewController ()
{
    //MBLMetaWearManager *manager;
    RFduinoManager *rfduinoManager;
}
@end

@implementation ViewController
@synthesize pairedBoard;

- (void)viewDidLoad {
    [super viewDidLoad];
  
    rfduinoManager = [RFduinoManager sharedRFduinoManager];
    rfduinoManager.delegate = self;
    [rfduinoManager startScan];

//
//    manager = [MBLMetaWearManager sharedManager];
//
//    [[MBLMetaWearManager sharedManager] startScanForMetaWearsAllowDuplicates:NO handler:^(NSArray *array) {
//        for (MBLMetaWear *device in array) {
//            NSLog(@"Found MetaWear: %@", device);
//            
//            [device connectWithHandler:^(NSError *error) {
//                NSLog(@"Connected");
//                pairedBoard = device;
//                //[pairedBoard rememberDevice];
//               // [pairedBoard initiatePairing];
//         
//                //[pairedBoard.led flashLEDColor:[UIColor redColor] withIntensity:1.0];
//                //[device.hapticBuzzer startHapticWithDutyCycle:255 pulseWidth:500 completion:nil];
//                [self performSelector:@selector(blink) withObject:nil afterDelay:3];
//                
//            }];
//            return;
//        }
//    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)blink{
    
   // [pairedBoard.hapticBuzzer startHapticWithDutyCycle:255 pulseWidth:500 completion:nil];
   // [pairedBoard.led flashLEDColor:[UIColor greenColor] withIntensity:1 numberOfFlashes:2];
    [self performSelector:@selector(blink) withObject:nil afterDelay:3];
    NSLog(@"blink");
}

- (void)didDiscoverRFduino:(RFduino *)rfduino
{
    NSLog(@"didDiscoverRFduino");
     [rfduinoManager connectRFduino:rfduino];
    
}

- (void)didUpdateDiscoveredRFduino:(RFduino *)rfduino
{
    // NSLog(@"didUpdateRFduino");
}

- (void)didConnectRFduino:(RFduino *)rfduino
{
    NSLog(@"didConnectRFduino");
    
    [rfduinoManager stopScan];
    
    }

- (void)didLoadServiceRFduino:(RFduino *)rfduino
{
   
}

- (void)didDisconnectRFduino:(RFduino *)rfduino
{
    
    [rfduinoManager startScan];
}


@end
