//
//  ViewController.m
//  DeviceInfo
//
//  Created by MTAC on 12/6/18.
//  Copyright © 2018 MTAC Research. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self loadInfo];

}

- (IBAction)refresh:(NSButton *)sender {

    [self viewDidLoad];

}

- (void)checkImage {

    NSTask *isPluggedIn = [[NSTask alloc] init];
    [isPluggedIn setLaunchPath:@"/bin/sh"];
    [isPluggedIn setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [isPluggedIn setStandardOutput:pipe];
    [isPluggedIn launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [isPluggedIn waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    if ([result containsString:@"No device found, is it plugged in?"]) {

        self.isDevice = false;

    } else if (!(result == nil)) {

        self.isDevice = true;

    }

}

- (void)loadInfo {

    [self iosVersion];
    [self buildVersion];
    [self architecture];
    [self deviceName];
    [self passwordProtected];
    [self hardwareModel];
    [self productType];
    [self udid];
    [self setImage];
    [self activationState];
    [self basebandState];
    [self bluetooth];
    [self bootNonce];
    [self isCellular];
    [self ethernet];
    [self imei];
    [self phone];
    [self clock];
    [self serial];
    [self timeZone];
    [self wifi];

}

- (void)iosVersion {

    NSTask *iosVersion = [[NSTask alloc] init];
    [iosVersion setLaunchPath:@"/bin/sh"];
    [iosVersion setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep ProductVersion", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [iosVersion setStandardOutput:pipe];
    [iosVersion launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [iosVersion waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"ProductVersion" withString:@"iOS Version"];

    [self.productVersionLabel setStringValue:result];

}

- (void)buildVersion {

    NSTask *buildVersion = [[NSTask alloc] init];
    [buildVersion setLaunchPath:@"/bin/sh"];
    [buildVersion setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep BuildVersion", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [buildVersion setStandardOutput:pipe];
    [buildVersion launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [buildVersion waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"BuildVersion" withString:@"iOS Build Version"];

    [self.buildVersionLabel setStringValue:result];

}

- (void)architecture {

    NSTask *iosVersion = [[NSTask alloc] init];
    [iosVersion setLaunchPath:@"/bin/sh"];
    [iosVersion setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep CPUArchitecture", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [iosVersion setStandardOutput:pipe];
    [iosVersion launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [iosVersion waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"CPUArchitecture" withString:@"CPU Architecture"];

    result = [result stringByReplacingOccurrencesOfString:@"arm" withString:@"ARM"];

    [self.architectureLabel setStringValue:result];

}

- (void)deviceName {

    NSTask *deviceName = [[NSTask alloc] init];
    [deviceName setLaunchPath:@"/bin/sh"];
    [deviceName setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep DeviceName", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [deviceName setStandardOutput:pipe];
    [deviceName launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [deviceName waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"DeviceName: " withString:@""];

    [self.deviceNameLabel setStringValue:result];

    [self.deviceNameLabel2 setStringValue:result];

}

- (void)passwordProtected {

    NSTask *password = [[NSTask alloc] init];
    [password setLaunchPath:@"/bin/sh"];
    [password setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep PasswordProtected", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [password setStandardOutput:pipe];
    [password launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [password waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"PasswordProtected" withString:@"Password Protected"];

    [self.passwordLabel setStringValue:result];

}

- (void)hardwareModel {

    NSTask *hardware = [[NSTask alloc] init];
    [hardware setLaunchPath:@"/bin/sh"];
    [hardware setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep HardwareModel", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [hardware setStandardOutput:pipe];
    [hardware launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [hardware waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"HardwareModel" withString:@"Hardware Model"];

    [self.hardwareModelLabel setStringValue:result];

}

- (void)productType {

    NSTask *productType = [[NSTask alloc] init];
    [productType setLaunchPath:@"/bin/sh"];
    [productType setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep ProductType", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [productType setStandardOutput:pipe];
    [productType launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [productType waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"ProductType" withString:@"Hardware ID"];

    [self.productTypeLabel setStringValue:result];

}

- (void)udid {

    NSTask *udidTask = [[NSTask alloc] init];
    [udidTask setLaunchPath:@"/bin/sh"];
    [udidTask setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep UniqueDeviceID", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [udidTask setStandardOutput:pipe];
    [udidTask launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [udidTask waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"UniqueDeviceID" withString:@"UDID"];

    _globalIdentifier = result;

    [self.udidLabel setStringValue:result];

}

- (void)setImage {

    NSTask *type = [[NSTask alloc] init];
    [type setLaunchPath:@"/bin/sh"];
    [type setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep ProductType", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [type setStandardOutput:pipe];
    [type launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [type waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"ProductType" withString:@"Hardware ID"];

    [self checkImage];

    if (self.isDevice == false) {

        _sixseveneight.image = [NSImage imageNamed:@"Plug"];

    } else {

    if ([result containsString:@"iPhone10,6"] || [result containsString:@"iPhone10,3"] || [result containsString:@"iPhone11,2"] || [result containsString:@"iPhone11,6"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPhoneX"];

    } else if ([result containsString:@"iPhone10,1"] || [result containsString:@"iPhone10,4"] || [result containsString:@"iPhone9,3"] || [result containsString:@"iPhone9,1"] || [result containsString:@"iPhone8,1"] || [result containsString:@"iPhone7,2"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPhone7"];

    } else if ([result containsString:@"iPhone7,1"] || [result containsString:@"iPhone8,2"] || [result containsString:@"iPhone9,2"] || [result containsString:@"iPhone9,4"] || [result containsString:@"iPhone10,2"] || [result containsString:@"iPhone10,5"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPhone7Plus"];

    } else if ([result containsString:@"iPhone8,4"] || [result containsString:@"iPhone6,1"] || [result containsString:@"iPhone6,2"] || [result containsString:@"iPhone5,1"] || [result containsString:@"iPhone5,2"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPhoneSE"];

    } else if ([result containsString:@"iPhone4,1"] || [result containsString:@"iPhone3,1"] || [result containsString:@"iPhone3,2"] || [result containsString:@"iPhone3,3"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPhone4S"];

    } else if ([result containsString:@"iPad2,5"] || [result containsString:@"iPad2,6"] || [result containsString:@"iPad2,7"] || [result containsString:@"iPad4,4"] || [result containsString:@"iPad4,5"] || [result containsString:@"iPad4,6"] || [result containsString:@"iPad4,7"] || [result containsString:@"iPad4,8"] || [result containsString:@"iPad4,9"] || [result containsString:@"iPad5,1"] || [result containsString:@"iPad5,2"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPadMini"];

    } else if ([result containsString:@"iPad1,1"] || [result containsString:@"iPad2,1"] || [result containsString:@"iPad2,2"] || [result containsString:@"iPad2,3"] || [result containsString:@"iPad2,4"] || [result containsString:@"iPad3,1"] || [result containsString:@"iPad3,2"] || [result containsString:@"iPad3,3"] || [result containsString:@"iPad3,4"] || [result containsString:@"iPad3,5"] || [result containsString:@"iPad3,6"] || [result containsString:@"iPad4,1"] || [result containsString:@"iPad4,2"] || [result containsString:@"iPad4,3"] || [result containsString:@"iPad5,3"] || [result containsString:@"iPad5,4"] || [result containsString:@"iPad6,3"] || [result containsString:@"iPad6,4"] || [result containsString:@"iPad6,7"] || [result containsString:@"iPad6,8"] || [result containsString:@"iPad6,11"] || [result containsString:@"iPad6,12"] || [result containsString:@"iPad7,1"] || [result containsString:@"iPad7,2"] || [result containsString:@"iPad7,3"] || [result containsString:@"iPad7,4"] || [result containsString:@"iPad7,5"] || [result containsString:@"iPad7,6"] || [result containsString:@"iPad8,1"] ||  [result containsString:@"iPad8,2"] || [result containsString:@"iPad8,3"] ||  [result containsString:@"iPad8,4"] || [result containsString:@"iPad8,5"] ||  [result containsString:@"iPad8,6"] || [result containsString:@"iPad8,7"] ||  [result containsString:@"iPad8,8"]) {

        _sixseveneight.image = [NSImage imageNamed:@"iPad"];

        }

    }

}

- (void)activationState {

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep ActivationState", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput:pipe];
    [task launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [task waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"ActivationState" withString:@"Activation State"];

    result = [result stringByReplacingOccurrencesOfString:@"Activated" withString:@"True"];

    [_activationStateLabel setStringValue:result];

}

- (void)basebandState {

    NSTask *baseband = [[NSTask alloc] init];
    [baseband setLaunchPath:@"/bin/sh"];
    [baseband setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep BasebandStatus", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [baseband setStandardOutput:pipe];
    [baseband launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [baseband waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"BasebandStatus" withString:@"Baseband Status"];

    NSString *final = [result stringByReplacingOccurrencesOfString:@"BBInfoAvailable" withString:@"Available"];

    [_basebandStatusLabel setStringValue:final];

}

- (void)bluetooth {

    NSTask *bt = [[NSTask alloc] init];
    [bt setLaunchPath:@"/bin/sh"];
    [bt setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep BluetoothAddress", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [bt setStandardOutput:pipe];
    [bt launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [bt waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"BluetoothAddress" withString:@"Bluetooth Address"];

    [_bluetoothAddressLabel setStringValue:result];

}

- (void)bootNonce {

    // com.apple.System.boot-nonce

    NSTask *bn = [[NSTask alloc] init];
    [bn setLaunchPath:@"/bin/sh"];
    [bn setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep com.apple.System.boot-nonce", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [bn setStandardOutput:pipe];
    [bn launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [bn waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    if (result == nil) {

        NSString *final = @"Not Available";

        [_bootNonceLabel setStringValue:final];

    } else {

        result = [result stringByReplacingOccurrencesOfString:@" com.apple.System.boot-nonce" withString:@"Boot Nonce"];

        [_bootNonceLabel setStringValue:result];

    }

}

- (void)isCellular {

    NSTask *isCell = [[NSTask alloc] init];
    [isCell setLaunchPath:@"/bin/sh"];
    [isCell setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep TelephonyCapability", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [isCell setStandardOutput:pipe];
    [isCell launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [isCell waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"TelephonyCapability" withString:@"Cellular Capabilities"];

    result = [result stringByReplacingOccurrencesOfString:@"true" withString:@"Yes"];

    result = [result stringByReplacingOccurrencesOfString:@"false" withString:@"No"];

    [_isCellularDeviceLabel setStringValue:result];

}

- (void)ethernet {

    NSTask *eth = [[NSTask alloc] init];
    [eth setLaunchPath:@"/bin/sh"];
    [eth setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep EthernetAddress", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [eth setStandardOutput:pipe];
    [eth launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [eth waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"EthernetAddress" withString:@"Ethernet Address"];

    [_ethernetAddressLabel setStringValue:result];

}

- (void)imei {

    NSTask *im = [[NSTask alloc] init];
    [im setLaunchPath:@"/bin/sh"];
    [im setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep EthernetAddress", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [im setStandardOutput:pipe];
    [im launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [im waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"InternationalMobileEquipmentIdentity" withString:@"IMEI"];

    [_imeiLabel setStringValue:result];

}

- (void)phone {

    NSTask *telephone = [[NSTask alloc] init];
    [telephone setLaunchPath:@"/bin/sh"];
    [telephone setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep PhoneNumber", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [telephone setStandardOutput:pipe];
    [telephone launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [telephone waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"PhoneNumber" withString:@"Phone Number"];

    [_phoneNumberLabel setStringValue:result];

}

- (void)clock {

    NSTask *cl = [[NSTask alloc] init];
    [cl setLaunchPath:@"/bin/sh"];
    [cl setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep Uses24HourClock", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [cl setStandardOutput:pipe];
    [cl launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [cl waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"Uses24HourClock" withString:@"Uses 24 Hour Clock"];

    result = [result stringByReplacingOccurrencesOfString:@"true" withString:@"Yes"];

    result = [result stringByReplacingOccurrencesOfString:@"false" withString:@"No"];

    [_clockLabel setStringValue:result];

}

- (void)serial {

    NSTask *sn = [[NSTask alloc] init];
    [sn setLaunchPath:@"/bin/sh"];
    [sn setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep -w SerialNumber", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [sn setStandardOutput:pipe];
    [sn launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [sn waitUntilExit];

    NSString * out = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    out = [out stringByReplacingOccurrencesOfString:@"SerialNumber" withString:@"Serial Number"];

    [_serialNumberLabel setStringValue:out];

}

- (void)timeZone {

    NSTask *time = [[NSTask alloc] init];
    [time setLaunchPath:@"/bin/sh"];
    [time setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep -w TimeZone", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [time setStandardOutput:pipe];
    [time launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [time waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"TimeZone" withString:@"Time Zone"];

    [_timeZoneLabel setStringValue:result];

}

- (void)wifi {

    NSTask *wifiAddress = [[NSTask alloc] init];
    [wifiAddress setLaunchPath:@"/bin/sh"];
    [wifiAddress setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinfo | grep WiFiAddress", nil]];
    NSPipe *pipe = [NSPipe pipe];
    [wifiAddress setStandardOutput:pipe];
    [wifiAddress launch];
    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];
    [wifiAddress waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    result = [result stringByReplacingOccurrencesOfString:@"WiFiAddress" withString:@"WiFi Address"];

    [_wifiAddressLabel setStringValue:result];

}

- (IBAction)shutdown:(NSButton *)sender {

    NSTask *halt = [[NSTask alloc] init];
    [halt setLaunchPath:@"/Applications/DeviceInfo.app/Contents/Resources/idevicediagnostics"];
    [halt setArguments:[NSArray arrayWithObjects:@"shutdown", nil]];
    [halt launch];

    NSPipe *pipe = [NSPipe pipe];

    [halt setStandardOutput:pipe];

    [halt launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];

    [halt waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self showAlert:result];

}

- (IBAction)restart:(NSButton *)sender {

    NSTask *reboot = [[NSTask alloc] init];
    [reboot setLaunchPath:@"/Applications/DeviceInfo.app/Contents/Resources/idevicediagnostics"];
    [reboot setArguments:[NSArray arrayWithObjects:@"-u", _globalIdentifier, @"restart", nil]];
    [reboot launch];

    NSPipe *pipe = [NSPipe pipe];

    [reboot setStandardOutput:pipe];

    [reboot launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];

    [reboot waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self showAlert:result];

}

- (IBAction)toRecovery:(NSButton *)sender {

    NSTask *recovery = [[NSTask alloc] init];
    [recovery setLaunchPath:@"/Applications/DeviceInfo.app/Contents/Resources/ideviceenterrecovery"];
    [recovery setArguments:[NSArray arrayWithObjects:_globalIdentifier, nil]];
    [recovery launch];

    NSPipe *pipe = [NSPipe pipe];

    [recovery setStandardOutput:pipe];

    [recovery launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];

    [recovery waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self showAlert:result];

}

- (IBAction)fromRecovery:(NSButton *)sender {

    NSTask *fRecovery = [[NSTask alloc] init];
    [fRecovery setLaunchPath:@"/Applications/DeviceInfo.app/Contents/Resources/idevicediagnostics"];
    [fRecovery setArguments:[NSArray arrayWithObjects:@"-u", _globalIdentifier, @"restart", nil]];
    [fRecovery launch];

    NSPipe *pipe = [NSPipe pipe];

    [fRecovery setStandardOutput:pipe];

    [fRecovery launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];

    [fRecovery waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self showAlert:result];

}

- (IBAction)installApp:(NSButton *)sender {

    NSOpenPanel *panel = [NSOpenPanel openPanel];

    [panel setCanChooseFiles:YES];

    [panel setCanChooseDirectories:NO];

    [panel setAllowsMultipleSelection:NO];

    [panel setAllowedFileTypes:[NSArray arrayWithObjects:@"ipa", nil]];

    if ([panel runModal] == NSModalResponseOK) {

        NSString *file = [NSString stringWithFormat:@"%@", [panel URL]];

        file = [file stringByReplacingOccurrencesOfString:@"file://" withString:@""];

        [self showAlert:file];

        [self installer:file];

        [panel canHide];

    }

}

- (void)installer:(NSString *)input {

    NSTask *install = [[NSTask alloc] init];

    NSString *path = [NSString stringWithContentsOfFile:input encoding:NSUTF8StringEncoding error:nil];

    [install setLaunchPath:@"/bin/bash"];

    [install setArguments:[NSArray arrayWithObjects:@"-c", @"/Applications/DeviceInfo.app/Contents/Resources/ideviceinstaller", @"-i", path, nil]];

    NSPipe *pipe = [NSPipe pipe];

    [install setStandardOutput:pipe];

    [install launch];

    NSData *data = [[pipe fileHandleForReading] readDataToEndOfFile];

    [install waitUntilExit];

    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self showAlert:result];

}

- (void)showAlert:(NSString *)info {

    NSAlert *alert = [NSAlert new];
    alert.messageText = @"Device Info";
    alert.informativeText = info;
    [alert addButtonWithTitle:@"Ok"];

    [alert beginSheetModalForWindow:[self.view window] completionHandler:^(NSInteger result) {

    }];

}

- (IBAction)screenshotButton:(NSButton *)sender {

    NSOpenPanel *panel = [NSOpenPanel openPanel];

    [panel setCanChooseFiles:YES];

    [panel setCanChooseDirectories:YES];

    [panel setAllowsMultipleSelection:NO];

    NSTask *task = [[NSTask alloc] init];

    [task setLaunchPath:@"/Applications/DeviceInfo.app/Contents/Resources/idevicescreenshot"];

    if ([panel runModal] == NSModalResponseOK) {

        NSString *file = [NSString stringWithFormat:@"%@", [panel URL]];

        NSString *image = [file stringByAppendingString:@"screenshot.png"];

        image = [image stringByReplacingOccurrencesOfString:@"file://" withString:@""];

        [task setArguments:[NSArray arrayWithObjects:image, nil]];

        [task launch];

        [task waitUntilExit];

        NSString *output = @"Saved to: ";

        output = [output stringByAppendingString:image];

        [self showAlert:output];

        [panel canHide];

    }

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];



}


@end
