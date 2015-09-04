//
//  ViewController.h
//  amke_bluetooth
//
//  Created by Asimo on 9/4/15.
//  Copyright (c) 2015 Tellart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MetaWear/MetaWear.h>

#import "RFduinoManagerDelegate.h"

@class RFduinoManager;
@class RFduino;

@interface ViewController : UIViewController<RFduinoManagerDelegate>

@property (nonatomic,strong) MBLMetaWear* pairedBoard;
    
- (void) blink;

@end

