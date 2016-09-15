# com.justep.cordova.plugin.iFlytek #

This plugin provides the ability to speech recognition and synthesis (over iFlytek voicecloud) on a device.


Attentioin: You need apply an App Id and SDK from http://open.voicecloud.cn/.

Please replace:
- the iFlytek SDK files(ios/iflyMSC.framework and android/libs) with the version for your app.
- the SPEECH_APP_ID in ios/CDVSpeech.m and android/Speech.java

## Supported Platforms ##

* Android
* iOS

## Javascript APIs ##

    addEventListener( event_name, your_callback );
    removeEventListener( event_name );

    syncContact(success, fail);
    updateContact( names, success, fail);
    updateUserWord( talbe_name, words, success, fail);

    startListening(options, callback);
    stopListening();
    cancelListening();
    
    startSpeaking( what_to_say, options );
    pauseSpeaking();
    resumeSpeaking();
    stopSpeaking();
    
## Events ##
    
    SpeechBegin
    SpeechEnd
    SpeechCancel
    SpeechResults
    SpeechError  
    VolumeChanged

    SpeakBegin
    SpeakPaused
    SpeakResumed
    SpeakCancel
    SpeakCompleted 
    SpeakProgress
    BufferProgress
    
## Example Code ##
```javascript
function onLoad() {
    document.addEventListener("deviceready", onDeviceReady, false);
}
function onDeviceReady() {
	$('div#status').html( 'speech engine ready' );
}
function startReading() {
	var text = $('textarea#read').val();
	navigator.speech.startSpeaking( text, {voice_name: 'xiaoyan'} );
}
function stopReading() {
	navigator.speech.stopSpeaking();
}
function startListening() {
	$('div#status').html( 'Listening, please speak.' );

	navigator.speech.startListening({language:'zh_cn', accent:'mandarin'} function(str) {
            // this is what the device hear and understand
            $('textarea#read').val( str );
        });
}
function stopListening() {
	navigator.speech.stopListening();
}
```

## Credit ##

This plugin code was based on project of Lu Huiguo. His code is very good but not tuned to work. 
It seems that he is not very active, so I start a new repository.

 
