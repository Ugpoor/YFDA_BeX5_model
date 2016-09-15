//
//  TouchID.h
//  Created by LiangQiangkun on 16/3/15.
//

#import <Cordova/CDVPlugin.h>

@interface TouchID : CDVPlugin

- (void) authenticate:(CDVInvokedUrlCommand*)command;
- (void) checkSupport:(CDVInvokedUrlCommand*)command;

@end
