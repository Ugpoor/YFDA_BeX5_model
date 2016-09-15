//
//  CDVVoiceManager.m
//
//  Created by LiangQiangkun on 16/2/25.
//
//

#import "CDVVoiceManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation CDVVoiceManager
{
    NSString *_callbackId;
}
-(void)pluginInitialize{
    
}
- (void)setPlayMode:(CDVInvokedUrlCommand*)command{
    _callbackId = command.callbackId;
    NSNumber *number =[command argumentAtIndex:0];
    int mode = [number intValue];
    if (mode == 0) {
        //此时选择的是外放模式
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        [audioSession setActive:YES error:nil];
        NSLog(@"提示：现在选择的是外放模式");
        [self.commandDelegate runInBackground:^{
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:result callbackId:_callbackId];
        }];
       
    }else if (mode == 1){
        //此时选择的是听筒模式
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        //    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        //    [audioSession setActive:YES error:nil];
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        [audioSession setActive:YES error:nil];
        NSLog(@"提示：现在选择的是听筒模式");
        [self.commandDelegate runInBackground:^{
            CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:result callbackId:_callbackId];
        }];
    }
    
}

@end
