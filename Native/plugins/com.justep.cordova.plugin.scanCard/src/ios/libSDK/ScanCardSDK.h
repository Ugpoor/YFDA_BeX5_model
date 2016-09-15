//
//  ScanCardSDK.h
//  ScanCardSDK
//
//  Created by Spark on 13-8-8.
//  Copyright (c) 2013年 Maketion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark -- Block
/*
 * 验证回调
 * code：		0为正确，其他为错误。
 * message：		code为非零时，返回错误信息。
 * datas：		验证完成后，返回Maketion系统用户标识。
 */
typedef void(^MSScanCardAuthBlock)(NSInteger code, NSString *message, NSString *uid);

/*
 * Block名片数据回调
 * code：		0为正确，其他为错误。
 * message：		code为非零时，返回错误信息。
 * datas：		用户名片数据。数组。
 *
 * 注：[datas]   多个名片识别信息（NSDictionary），格式见说明文档（名片数据结构）
 */
typedef void(^MSScanCardDataBlock)(NSInteger code, NSString *message, NSArray *datas);

/*
 * 名片图片回调
 * image： 图片对象
 */
typedef void(^MSScanCardImageBlock)(UIImage *image);



#pragma mark -- 图片上传通知
/*
 * 拍照
 * 拍照图片通知，返回object为图片标识UUID,userInfo为nil。
 */
UIKIT_EXTERN NSString *const MSScanCardPictureNotification;
/*
 * 上传开始
 * 上传图片开始通知，返回object为图片标识UUID,userInfo为nil。
 */
UIKIT_EXTERN NSString *const MSScanCardUploadStartNotification;
/*
 * 上传完成
 * 上传图片完成通知，返回object为图片标识UUID,userInfo为完成信息。
 */
UIKIT_EXTERN NSString *const MSScanCardUploadedNotification;
/*
 * 上传错误
 * 上传图片错误通知，返回object为图片标识UUID,userInfo为错误信息。
 */
UIKIT_EXTERN NSString *const MSScanCardUploadErrorNotification;
/*
 * 上传超时
 */
UIKIT_EXTERN NSString *const MSScanCardUploadTimeoutNotification;



#pragma mark -- ScanCardSDK
@interface ScanCardSDK : NSObject

+ (ScanCardSDK *)shareInstance;

#pragma mark -- 验证

//判断是否验证
- (BOOL)isAuth;

//清除验证缓存
- (void)clearAuth;

//获取用户标识
- (NSString *)getScanCardSDKUID;

/*
 * 验证
 * pkey：	由脉可寻云名片识别服务申请获得；
 * secure：	由脉可寻云名片识别服务申请获得；
 * uid：		合作伙伴客户标识。如果没有,不能为0。
 * authBlock：验证成功与失败，用户UID（ScanCardSDK端，获取数据可根据此标识来获取）。
 *
 */
- (void)auth:(NSString *)pkey secure:(NSString *)secure uid:(NSString *)uid authBlock:(MSScanCardAuthBlock)authBlock;

#pragma mark -- 拍照，上传名片。
//打开摄像头，拍摄名片，返回状态。
- (void)openCamera:(UIViewController *)ownerViewController;
//打开摄像头，拍摄名片不上传。
- (void)openCameraNoUpload:(UIViewController *)ownerViewController;
//打开摄像头，拍摄名片不上传，不连拍。
- (void)openCameraTakeOneNoUploadAlert:(UIViewController *)ownerViewController alertView:(UIAlertView *)alertView;
//关闭摄像头
- (void)closeCamera;



#pragma mark -- 获取数据

/*
 * 通过Block获取数据
 * uuids：拍照上传后获取的标识。数组，多个。
 * dataBlock：Block方式，数组，多个名片识别信息（NSDictionary），格式见说明文档（名片数据结构）。
 *
 * 注: 通过名片的uuid获取名片详细数据, 0为所有名片信息
 */
- (void)getDataWithUUID:(NSArray *)uuids dataBlock:(MSScanCardDataBlock)dataBlock;

/*
 * 通过Block获取数据
 * time：为时间戳，当前时间距1970年秒数，如果是0表示全部数据。
 * dataBlock：Block方式，数组，多个名片识别信息（NSDictionary），格式见说明文档（名片数据结构）。
 *
 * 注：无删除过或是无法识别名片数据。
 */
- (void)getDataWithTime:(int)time dataBlock:(MSScanCardDataBlock)dataBlock;


/* 上传图片
 * uuid：图片标识，名片的uuid
 *
 * 功能：可用于重新上传图片
 */
- (void)uploadImage:(NSString *)uuid;

/*
 * 获取名片图片
 * uuid：名片的uuid
 * imageBlock：Block，异步处理
 *
 * 注：通过uuid获取单张名片的原图。默认从沙盒里取原图,若沙盒中没有会从服务器中取
 */
- (void)getCardImage:(NSString *)uuid imageBlock:(MSScanCardImageBlock)imageBlock;

/*
 * 删除名片
 * uuids：拍照上传后获取的标识。数组，多个。
 * dataBlock：Block方式，数组，多个名片识别信息（NSDictionary），格式见说明文档（名片数据结构）。
 *
 * 注：该函数只能是fields == 100 的时候调用才会有效
 */
- (void)deleteDataWithUUIDs:(NSArray *)uuids dataBlock:(MSScanCardDataBlock)dataBlock;


/*
 * SDK版本
 */
- (NSString *)version;


#pragma mark -- 其他（第三方）

//畅捷通 验证
- (BOOL)cjtAuth:(NSString *)clientID key:(NSString *)clientKey;

/*
 畅捷通 Email数据转成联系人
 sendEmail 发送人邮箱
 sendName  发送人显示名称
 textb     内容块
 type      邮件类型
 toEmail   收件人
 */
- (NSDictionary *)cjtEmailToContacts:(NSString *)sendEmail sendName:(NSString *)sendName text:(NSString *)text
                           emailType:(NSString *)type toEmail:(NSString *)toEmail;

#pragma mark -- 打印日志设置
+ (void)setIsDebug:(BOOL)isDebug;

@end

