//
//  SMSPlugin.m
//  SMSPlugin
//
//  Created by LiangQiangkun on 15/12/8.
//
//
#import <Cordova/CDV.h>
#import "PluginSMSSDK.h"
#import <SMS_SDK/SMSSDK.h>

@implementation PluginSMSSDK

-(void)pluginInitialize{
	
    CDVViewController *viewController = (CDVViewController *)self.viewController;
    self.mobsms_appKey = [viewController.settings objectForKey:@"mobsms_appkey"];
    self.mobsms_appSecret = [viewController.settings objectForKey:@"mobsms_appsecret"];
    self.mobsms_mMode = [viewController.settings objectForKey:@"mobsms_mMode"];
    [SMSSDK registerApp:self.mobsms_appKey withSecret:self.mobsms_appSecret];
}


-(void)init:(CDVInvokedUrlCommand *)command{
	
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    NSDictionary *appInfo  = [self checkArgs:command];
    self.mobsms_appKey = appInfo[@"appKey"];
    self.mobsms_appSecret = appInfo[@"appSecret"];
    self.mobsms_mMode = appInfo[@"mMode"];
    [SMSSDK registerApp:self.mobsms_appKey withSecret:self.mobsms_appSecret];
    
}
-(void)send:(CDVInvokedUrlCommand *)command{
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    NSDictionary *phoneDic = [self checkArgs:command];
    self.mobsms_phoneNumber = phoneDic[@"phoneNumber"];
    self.mobsms_zone = phoneDic[@"zone"];
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.mobsms_phoneNumber zone:self.mobsms_zone customIdentifier:nil result:nil];
    
}
-(void)getInfo:(CDVInvokedUrlCommand *)command{
	//这是一个测试的接口  返回app信息
    NSDictionary *info = [[NSDictionary alloc]init];
    [info setValue:self.mobsms_appKey forKey:@"appKey"];
    [info setValue:self.mobsms_appSecret forKey:@"appSecret"];
    [info setValue:self.mobsms_mMode forKey:@"mMode"];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    
}
-(void)verify:(CDVInvokedUrlCommand *)command{
    NSDictionary *phoneDic = [self checkArgs:command];
    self.mobsms_phoneNumber = phoneDic[@"phoneNumber"];
    self.mobsms_zone = phoneDic[@"zone"];
    self.mobsms_verificationCode = phoneDic[@"verificationCode"];
    [SMSSDK commitVerificationCode:self.mobsms_verificationCode phoneNumber:self.mobsms_phoneNumber zone:self.mobsms_zone result:^(NSError *error) {
        if (!error) {
            NSDictionary *info = [NSDictionary dictionaryWithObject:@"-1" forKey:@"result"];
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
            
        }else{
            NSDictionary *info = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:error.code] forKey:@"result"];
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
    }];
}
-(void)extend:(CDVInvokedUrlCommand *)command{
    
}
-(NSDictionary *)checkArgs:(CDVInvokedUrlCommand *) command{
    // check arguments
    NSDictionary *params = [command.arguments objectAtIndex:0];
    if (!params)
    {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"参数错误"] callbackId:command.callbackId];
        
        
        return nil;
    }
    return params;
}

@end
