//
//  CDVScanCard.h
//  综合演示
//
//  Created by LiangQiangkun on 16/3/22.
//
//

#import "Cordova/CDVPlugin.h"


@interface CDVScanCard : CDVPlugin<UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property(nonatomic,strong)NSString* key;
@property(nonatomic,strong)NSString* sign;
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)UIImage* image;
@property(nonatomic,strong)NSString* callID;
- (void)auth:(CDVInvokedUrlCommand*)command;
- (void)checkAuth:(CDVInvokedUrlCommand*)command;
- (void)clearAuthentication:(CDVInvokedUrlCommand*)command;
- (void)takePicture:(CDVInvokedUrlCommand*)command;
- (void)closeCamera:(CDVInvokedUrlCommand*)command;
- (void)uploadPicture:(CDVInvokedUrlCommand*)command;
- (void)getCardByUuid:(CDVInvokedUrlCommand*)command;
- (void)getCardByTime:(CDVInvokedUrlCommand*)command;
- (void)deleteDataWithUUIDs:(CDVInvokedUrlCommand*)command;
- (void)getCardPicture:(CDVInvokedUrlCommand*)command;



@end
