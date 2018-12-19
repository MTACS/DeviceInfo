//
//  ViewController.h
//  DeviceInfo
//
//  Created by MTAC on 12/6/18.
//  Copyright © 2018 MTAC Research. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSImageView *sixseveneight;

@property (weak) IBOutlet NSTextField *productVersionLabel;

@property (weak) IBOutlet NSTextField *buildVersionLabel;

@property (weak) IBOutlet NSTextField *architectureLabel;

@property (weak) IBOutlet NSTextField *deviceNameLabel;

@property (weak) IBOutlet NSTextField *deviceNameLabel2;

@property (weak) IBOutlet NSTextField *passwordLabel;

@property (weak) IBOutlet NSTextField *hardwareModelLabel;

@property (weak) IBOutlet NSTextField *productTypeLabel;

@property (weak) IBOutlet NSTextField *udidLabel;

@property (weak) NSString *device;



@property (weak) IBOutlet NSTextField *activationStateLabel;

@property (weak) IBOutlet NSTextField *basebandStatusLabel;

@property (weak) IBOutlet NSTextField *bluetoothAddressLabel;

@property (weak) IBOutlet NSTextField *bootNonceLabel;

@property (weak) IBOutlet NSTextField *isCellularDeviceLabel;

@property (weak) IBOutlet NSTextField *ethernetAddressLabel;

@property (weak) IBOutlet NSTextField *imeiLabel;

@property (weak) IBOutlet NSTextField *phoneNumberLabel;

@property (weak) IBOutlet NSTextField *clockLabel;

@property (weak) IBOutlet NSTextField *serialNumberLabel;

@property (weak) IBOutlet NSTextField *timeZoneLabel;

@property (weak) IBOutlet NSTextField *wifiAddressLabel;

@property (nonatomic, assign) BOOL *isDevice;

@property (weak) NSString *globalIdentifier;

@end
