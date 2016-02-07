//
//  ViewController.m
//  CustomCamera
//
//  Created by Carl Udren on 2/7/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"
#import "CameraOverViewController.h"
#import "OverlayView.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) OverlayView *overlayView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.overlayView = [[OverlayView alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureImage)];
    [self.overlayView addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(captureVideo)];
    [self.overlayView addGestureRecognizer:longTap];
    
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self prepareImagePickerController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareImagePickerController{
    UIImagePickerController *imagePickerController  = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = NO;
    imagePickerController.showsCameraControls = NO;
    
    
    imagePickerController.cameraOverlayView = self.overlayView;

    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}


- (void) captureImage{
    NSLog(@"Tap");

    
}

- (void) captureVideo{
    NSLog(@"LongTap");
}
@end
