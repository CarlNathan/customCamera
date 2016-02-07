//
//  CameraOverViewController.m
//  CustomCamera
//
//  Created by Carl Udren on 2/7/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "CameraOverViewController.h"

@implementation CameraOverViewController

- (void) viewDidLoad {
    
    [self prepareCaptureSession];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureImage)];
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(captureVideo)];
    [self.view addGestureRecognizer:longTap];

}

- (void) prepareCaptureSession{
    self.captureSession = [[AVCaptureSession alloc] init];
    [self.captureSession setSessionPreset:AVCaptureSessionPresetHigh];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = [NSError new];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    if ( [self.captureSession canAddInput:deviceInput] )
        [self.captureSession addInput:deviceInput];
    
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    [previewLayer setFrame:CGRectMake(-70, 0, rootLayer.bounds.size.height, rootLayer.bounds.size.height)];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    [self.captureSession startRunning];
}

- (void) captureImage {
    NSLog(@"Tap");
}

- (void) captureVideo {
    NSLog(@"LongTap");
}
@end
