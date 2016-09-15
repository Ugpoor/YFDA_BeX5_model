#import "Weibo.h"

NSString *WEBIO_APP_ID = @"weibo_app_id";
NSString *WEBIO_REDIRECT_URI = @"redirecturi";
NSString *WEBIO_DEFUALT_REDIRECT_URI = @"https://api.weibo.com/oauth2/default.html";
NSString *WEIBO_CANCEL_BY_USER = @"cancel by user";
NSString *WEIBO_SHARE_INSDK_FAIL = @"share in sdk failed";
NSString *WEIBO_SEND_FAIL = @"send failed";
NSString *WEIBO_UNSPPORTTED = @"Weibo unspport";
NSString *WEIBO_AUTH_ERROR = @"Weibo auth error";
NSString *WEIBO_UNKNOW_ERROR = @"Weibo unknow error";
NSString *WEIBO_USER_CANCEL_INSTALL = @"user cancel install weibo";

@implementation Weibo
/**
 *  插件初始化主要用于appkey的注册
 */
- (void)pluginInitialize {
    NSString *weiboAppId = [[self.commandDelegate settings] objectForKey:WEBIO_APP_ID];
    self.weiboAppId = weiboAppId;
    [WeiboSDK registerApp:weiboAppId];
    NSString *redirectURI = [[self.commandDelegate settings] objectForKey:WEBIO_REDIRECT_URI];
    if (nil == redirectURI) {
        self.redirectURI = WEBIO_DEFUALT_REDIRECT_URI;
    } else {
        self.redirectURI = redirectURI;
    }
}
/**
 *  微博单点登录
 *
 *  @param command CDVInvokedUrlCommand
 */
- (void)ssoLogin:(CDVInvokedUrlCommand *)command {
    self.callback = command.callbackId;
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = self.redirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From" : @"Weibo",
                         @"Other_Info_1" : [NSNumber numberWithInt:123],
                         @"Other_Info_2" : @[@"obj1", @"obj2"],
                         @"Other_Info_3" : @{@"key1" : @"obj1", @"key2" : @"obj2"}};
    [WeiboSDK sendRequest:request];
}
/**
 *  微博登出
 *
 *  @param command CDVInvokedUrlCommand
 */
- (void)logout:(CDVInvokedUrlCommand *)command {
    NSUserDefaults *saveDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [saveDefaults objectForKey:@"access_token"];
    [saveDefaults removeObjectForKey:@"userid"];
    [saveDefaults removeObjectForKey:@"access_token"];
    [saveDefaults synchronize];
    if (token) {
        [WeiboSDK logOutWithToken:token delegate:self.appDelegate withTag:nil];
    }
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

/**
 *  分享到微博
 *
 *  @param command CDVInvokedUrlCommand
 */
- (void)shareToWeibo:(CDVInvokedUrlCommand *)command {
    self.callback = command.callbackId;
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.redirectURI = self.redirectURI;
    authRequest.scope = @"all";
    NSDictionary *params = [command.arguments objectAtIndex:0];
    if (!params) {
        //参数为空，直接失败回调
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        return;
    } else {
        //取到参数，检查微博app是否安装
        if ([WeiboSDK isWeiboAppInstalled]) {
            NSString *deafultText = [params objectForKey:@"defaultText"];
            NSString *urlStr = [params objectForKey:@"url"];
            WBMessageObject *messageObj = [WBMessageObject message];
            messageObj.text = [deafultText stringByAppendingString:urlStr];
            NSDictionary *media = [params objectForKey:@"media"];
            NSString *mediaType = [media objectForKey:@"type"];
            if ([mediaType isEqualToString:@"image"]) {
                //分享简单的图片
                NSString *imageURL = [media objectForKey:@"url"];
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
                WBImageObject *imgObj = [WBImageObject object];
                imgObj.imageData = imageData;
                messageObj.imageObject = imgObj;
            }else{
                
                //暂不支持，等后续版本
                //分享音频/视频
                
            }
            NSUserDefaults *saveDefaults = [NSUserDefaults standardUserDefaults];
            NSString *token = [saveDefaults objectForKey:@"access_token"];
            WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:messageObj authInfo:authRequest access_token:token];
            request.userInfo = @{@"ShareMessageFrom" : @"WEIBO",
                                 @"Other_Info_1" : [NSNumber numberWithInt:123],
                                 @"Other_Info_2" : @[@"obj1", @"obj2"],
                                 @"Other_Info_3" : @{@"key1" : @"obj1", @"key2" : @"obj2"}};
            [WeiboSDK sendRequest:request];
        }
    }
}

/**
 *  检查微博官方客户端是否安装
 *
 *  @param command CDVInvokedUrlCommand
 */
- (void)checkClientInstalled:(CDVInvokedUrlCommand *)command {
    Boolean installed = [WeiboSDK isWeiboAppInstalled];
    if (installed) {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    } else {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
}

/**
 *  处理URL
 *
 *  @param notification cordova传递的消息对象
 */
- (void)handleOpenURL:(NSNotification *)notification {
    NSURL *url = [notification object];
    NSString *wb = @"wb";
    if ([url isKindOfClass:[NSURL class]] && [url.absoluteString hasPrefix:[wb stringByAppendingString:self.weiboAppId]]) {
        [WeiboSDK handleOpenURL:url delegate:self];
    }
}

#pragma mark - WeiboSDKDelegate
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class]) {
        if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {
            WBSendMessageToWeiboResponse *sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse *) response;
            NSString *accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
            NSString *userID = [sendMessageToWeiboResponse.authResponse userID];
            if (accessToken && userID) {
                NSUserDefaults *saveDefaults = [NSUserDefaults standardUserDefaults];
                [saveDefaults setValue:accessToken forKey:@"access_token"];
                [saveDefaults setValue:userID forKey:@"userid"];
                [saveDefaults synchronize];
            }
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUserCancel) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_CANCEL_BY_USER];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeSentFail) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_SEND_FAIL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeShareInSDKFailed) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_SHARE_INSDK_FAIL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUnsupport) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_UNSPPORTTED];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUnknown) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_UNKNOW_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeAuthDeny) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_AUTH_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUserCancelInstall) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_USER_CANCEL_INSTALL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        }
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        if (response.statusCode == WeiboSDKResponseStatusCodeSuccess) {
            NSMutableDictionary *Dic = [NSMutableDictionary dictionaryWithCapacity:2];
            [Dic setObject:[(WBAuthorizeResponse *) response userID] forKey:@"userid"];
            [Dic setObject:[(WBAuthorizeResponse *) response accessToken] forKey:@"access_token"];
            NSUserDefaults *saveDefaults = [NSUserDefaults standardUserDefaults];
            [saveDefaults setValue:[(WBAuthorizeResponse *) response userID] forKey:@"userid"];
            [saveDefaults setValue:[(WBAuthorizeResponse *) response accessToken] forKey:@"access_token"];
            [saveDefaults synchronize];
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:Dic];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUserCancel) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_CANCEL_BY_USER];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeSentFail) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_SEND_FAIL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeShareInSDKFailed) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_SHARE_INSDK_FAIL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUnsupport) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_UNSPPORTTED];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUnknown) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_UNKNOW_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeAuthDeny) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_AUTH_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        } else if (response.statusCode == WeiboSDKResponseStatusCodeUserCancelInstall) {
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:WEIBO_USER_CANCEL_INSTALL];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callback];
        }
    }
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

@end
