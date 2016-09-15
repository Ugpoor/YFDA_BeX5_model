//
//  SMSPlugin.h
//  SMSPlugin
//
//  Created by LiangQiangkun on 15/12/8.
//
//


#import <Cordova/CDVPlugin.h>

@interface PluginSMSSDK : CDVPlugin
@property(nonatomic,strong)NSString *mobsms_mMode;
@property(nonatomic,strong)NSString *mobsms_appKey;
@property(nonatomic,strong)NSString *mobsms_appSecret;
@property(nonatomic,strong)NSString *mobsms_phoneNumber;
@property(nonatomic,strong)NSString *mobsms_zone;
@property(nonatomic,strong)NSString *mobsms_verificationCode;

-(void)init:(CDVInvokedUrlCommand *)command;
-(void)send:(CDVInvokedUrlCommand *)command;
-(void)getInfo:(CDVInvokedUrlCommand *)command;
-(void)verify:(CDVInvokedUrlCommand *)command;
-(void)extend:(CDVInvokedUrlCommand *)command;
@end


