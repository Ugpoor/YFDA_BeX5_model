/********* CDVSpeech.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "iflyMSC/IFlyMSC.h"

@interface CDVSpeech : CDVPlugin <IFlySpeechRecognizerDelegate, IFlySpeechSynthesizerDelegate>{

}
@property (nonatomic, copy) NSString* appId;
@property (nonatomic, strong) NSString* callbackId;
@property (nonatomic, strong) IFlySpeechRecognizer* recognizer;
@property (nonatomic, strong) IFlySpeechSynthesizer* synthesizer;


- (void)startListening:(CDVInvokedUrlCommand*)command;
- (void)stopListening:(CDVInvokedUrlCommand*)command;
- (void)cancelListening:(CDVInvokedUrlCommand*)command;

- (void)startSpeaking:(CDVInvokedUrlCommand*)command;
- (void)pauseSpeaking:(CDVInvokedUrlCommand*)command;
- (void)resumeSpeaking:(CDVInvokedUrlCommand*)command;
- (void)stopSpeaking:(CDVInvokedUrlCommand*)command;

@end

