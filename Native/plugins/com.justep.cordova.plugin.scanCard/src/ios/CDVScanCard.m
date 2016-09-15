//
//  CDVScanCard.m
//  综合演示
//
//  Created by LiangQiangkun on 16/3/22.
//
//

#import "CDVScanCard.h"
#import "ScanCardSDK.h"

@implementation CDVScanCard

//插件初始化方法
- (void)pluginInitialize
{
    
    //在这里进行插件初始化操作
}
#pragma mark--授权
- (void)auth:(CDVInvokedUrlCommand*)command{
    self.key = [[self.commandDelegate settings] objectForKey:@"key"];
    self.sign = [[self.commandDelegate settings] objectForKey:@"sign"];
    self.name = [command argumentAtIndex:0];
    [[ScanCardSDK shareInstance] auth:self.key secure:self.sign uid:self.name authBlock:^(NSInteger code, NSString *message, NSString *uid) {
        if ([[ScanCardSDK shareInstance] isAuth]) {
            //应用验证成功，返回UID
            NSDictionary *info = [NSDictionary dictionaryWithObject:uid forKey:@"UID"];
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }else{
            //应用验证失败
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"验证失败"];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
    }];
}
#pragma mark--检查授权
- (void)checkAuth:(CDVInvokedUrlCommand*)command{
    if ([[ScanCardSDK shareInstance] isAuth]) {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"已经授权"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }else{
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"未授权"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }
    
}
#pragma mark--清除授权
- (void)clearAuthentication:(CDVInvokedUrlCommand*)command{
    [[ScanCardSDK shareInstance] clearAuth];
    if ([[ScanCardSDK shareInstance] isAuth]) {
        //清除验证失败
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"清除失败"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }else{
        //清除验证成功
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"清除成功"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }

    
}
#pragma mark--打开摄像头拍照上传
- (void)takePicture:(CDVInvokedUrlCommand*)command{
    self.callID = command.callbackId;
    
    if ([[ScanCardSDK shareInstance] isAuth]) {
        //开始上传
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(scanCardUploadStartNotificationAction:) name:MSScanCardUploadStartNotification object:nil];
        //上传成功
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(scanCardUploadedNotificationAction:) name:MSScanCardUploadedNotification object:nil];
        //上传失败
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(scanCardUploadErrorNotificationAction:) name:MSScanCardUploadErrorNotification object:nil];
        [[ScanCardSDK shareInstance] openCamera:self.viewController];
        
    }else{
        //并没有通过验证
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"验证未通过，请先通过验证"];
        [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }

    
    
}
#pragma mark--获取图片原图
- (void)getCardPicture:(CDVInvokedUrlCommand*)command{
    NSString *UUID = [command argumentAtIndex:0];
    NSDictionary *save = [command argumentAtIndex:1];
    BOOL album = false;
    album = [save objectForKey:@"album"];
    NSString *imgPath = [save objectForKey:@"imgPath"];
    NSString *imgName = [save objectForKey:@"imgName"];
    
    [[ScanCardSDK shareInstance] getCardImage:UUID imageBlock:^(UIImage *image) {
        if (album) {
            //保存到相册
            UIImageWriteToSavedPhotosAlbum(image, self, @selector ( image:didFinishSavingWithError:contextInfo:) , nil ) ;
        }
        if (imgName && imgPath) {
            //保存到指定路径
            NSString *pth = [@"/" stringByAppendingString:imgName];
            NSString *path = [imgPath stringByAppendingString:pth];
            [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
            [UIImagePNGRepresentation(image) writeToFile:imgPath atomically:YES];
        }
    }];
    
}
#pragma mark--关闭摄像头
- (void)closeCamera:(CDVInvokedUrlCommand*)command{
    [[ScanCardSDK shareInstance] closeCamera];
    
}
#pragma mark--再次上传图片
- (void)uploadPicture:(CDVInvokedUrlCommand*)command{
    NSString *UUID = [command argumentAtIndex:0];
    [[ScanCardSDK shareInstance] uploadImage:UUID];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
#pragma mark--根据UUID获取数据
- (void)getCardByUuid:(CDVInvokedUrlCommand*)command{
    NSDictionary *arg = [command argumentAtIndex:0];
    NSArray *uuids = [arg objectForKey:@"uuids"];
    [[ScanCardSDK shareInstance] getDataWithUUID:uuids dataBlock:^(NSInteger code, NSString *message, NSArray *datas) {
        NSMutableDictionary * info = [[NSMutableDictionary alloc]init];
        if (code == 0) {
            [info setObject:datas forKey:@"datas"];
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }else{
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }

    }];
    
}
#pragma mark--根据时间获取数据
- (void)getCardByTime:(CDVInvokedUrlCommand*)command{
    NSNumber *time = [command argumentAtIndex:0];
    
    [[ScanCardSDK shareInstance] getDataWithTime:[time intValue] dataBlock:^(NSInteger code, NSString *message, NSArray *datas) {
        NSMutableDictionary * info = [[NSMutableDictionary alloc]init];
        if (code == 0) {
            [info setObject:datas forKey:@"datas"];
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }else{
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:message];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
    }];
    
}
#pragma mark--删除数据
- (void)deleteDataWithUUIDs:(CDVInvokedUrlCommand*)command{
    NSArray *UUIDs = [command argumentAtIndex:0];
    [[ScanCardSDK shareInstance] deleteDataWithUUIDs:UUIDs dataBlock:^(NSInteger code, NSString *message, NSArray *datas) {
        if (datas.count != 0) {
            [self.commandDelegate runInBackground:^{
                CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"删除数据失败"];
                [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

            }];
        }else{
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"删除数据成功"];
            [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
        }
    }];
    
}
#pragma mark--接受图片开始上传的通知
-(void)scanCardUploadStartNotificationAction:(NSNotification*)notification{
    
}
#pragma mark--接受图片上传成功的通知
-(void)scanCardUploadedNotificationAction:(NSNotification*)notification{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:notification.object,@"UUID",notification.userInfo,@"userInfo",nil];
    [self.commandDelegate runInBackground:^{
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:info];
        [self.commandDelegate sendPluginResult:result callbackId:self.callID];
    }];

   
}
#pragma mark--接受图片上传失败的通知
-(void)scanCardUploadErrorNotificationAction:(NSNotification*)notification{
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:notification.object,@"UUID",notification.userInfo,@"userInfo",nil];
    [self.commandDelegate runInBackground:^{
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:info];
        [self.commandDelegate sendPluginResult:result callbackId:self.callID];
    }];
    
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo{
    if (error != NULL)
    {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:result callbackId:self.callID];
        
    }
    else  // No errors
    {
        CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:result callbackId:self.callID];
    }
    
}




















@end
