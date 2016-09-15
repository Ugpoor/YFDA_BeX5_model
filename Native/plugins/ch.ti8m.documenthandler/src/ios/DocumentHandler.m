
#import "DocumentHandler.h"

@implementation DocumentHandler
{
    NSData *_data;
}

- (void)HandleDocumentWithURL:(CDVInvokedUrlCommand*)command;
{
    __weak DocumentHandler* weakSelf = self;
    
    dispatch_queue_t asyncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(asyncQueue, ^{
        
        NSDictionary* dict = [command.arguments objectAtIndex:0];
        NSString* urlStr = dict[@"url"];
        NSURL* url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLResponse * response = nil;
        NSError *error = nil;
        _data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if (error) {
            CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsInt:2];
            [weakSelf.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
            return;
        }
        NSString *type = response.suggestedFilename;
        NSString* fileName = type;
        NSString* path = [NSTemporaryDirectory() stringByAppendingPathComponent: fileName];
        NSURL* tmpFileUrl = [[NSURL alloc] initFileURLWithPath:path];
        [_data writeToURL:tmpFileUrl atomically:YES];
        weakSelf.fileUrl = tmpFileUrl;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            QLPreviewController* cntr = [[QLPreviewController alloc] init];
            cntr.delegate = weakSelf;
            cntr.dataSource = weakSelf;
        
            UIViewController* root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            [root presentViewController:cntr animated:YES completion:nil];
        });
        
        CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
        [weakSelf.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
        });
}

#pragma mark - QLPreviewController data source

- (NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller
{
    return 1;
}

- (id <QLPreviewItem>) previewController: (QLPreviewController *) controller previewItemAtIndex: (NSInteger) index
{
    return self;
}

#pragma mark - QLPreviewItem protocol

- (NSURL*)previewItemURL
{
    return self.fileUrl;
}

@end
