//
//  PhotoViewController.m
//  Memory album
//
//  Created by sugc on 16/2/22.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MAPhotoViewController.h"
#import "MAContext.h"
#import "MABrowseViewController.h"
#import "MACollectionViewController.h"
#import "MAAlbumViewController.h"
#import "MATabBarController.h"

#define ratio [UIScreen mainScreen].bounds.size.width / 375.0

@interface MAPhotoViewController ()

@property (nonatomic, strong) UIView *toolBarView;
@property (nonatomic, strong) UIButton *photoButton;
@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UIScrollView *effectsScrollView;
@end

@implementation MAPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.effectsScrollView];
    stillCamera = [[GPUImageStillCamera alloc] init];
    stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
//    AVCaptureDevice *camera = [stillCamera inputCamera];
//    [camera lockForConfiguration:nil];
//    [camera setTorchMode:AVCaptureTorchModeOn];
//    [camera unlockForConfiguration];
    
    filter = [[GPUImageSketchFilter alloc] init];
    [stillCamera addTarget:filter];
    GPUImageView *gpuView = (GPUImageView *)self.view;
    [filter addTarget:gpuView];

}

- (void)loadView{
    GPUImageView *cameraView = [[GPUImageView alloc] initWithFrame:
                                CGRectZero];
    cameraView.backgroundColor = [UIColor blueColor];
    cameraView.fillMode = kGPUImageFillModePreserveAspectRatio;
    self.view = cameraView;
    
    UISwipeGestureRecognizer *swipeRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    UISwipeGestureRecognizer *swipeRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeRecognizerLeft];
    [self.view addGestureRecognizer:swipeRecognizerRight];
    [self.view addSubview:self.photoButton];
    [self.view addSubview:self.imageButton];
}

- (void)didReceiveMemoryWarning{
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [stillCamera startCameraCapture];


}

- (void)viewDidDisappear:(BOOL)animated{
    [stillCamera stopCameraCapture];
}

- (UIView *)toolBarView{
    if (!_toolBarView) {
        _toolBarView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 30, [UIScreen mainScreen].bounds.size.width, 30)];
        _toolBarView.backgroundColor = [UIColor blackColor];
    }
    return  _toolBarView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (UIButton *)photoButton{
    if (!_photoButton) {
        _photoButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2.0  - 25, [UIScreen mainScreen].bounds.size.height  - 40, 50, 40)];
        _photoButton.backgroundColor = [UIColor grayColor];
        [_photoButton setTitle:@"photo" forState:UIControlStateNormal];
        
        [_photoButton addTarget:self action:@selector(clickPhotoButton) forControlEvents:UIControlEventTouchDown];
    }
    return _photoButton;
}

- (UIButton *)imageButton{
    if (!_imageButton) {
        _imageButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width  - 60, [UIScreen mainScreen].bounds.size.height - 40, 50, 40)];
        _imageButton.backgroundColor = [UIColor whiteColor];
        [_imageButton setTitle:@"image" forState:UIControlStateNormal];
        [_imageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_imageButton addTarget:self action:@selector(clickImageButton) forControlEvents:UIControlEventTouchDown];
    }
    return _imageButton;
}

- (void)clickPhotoButton{
    
    [self.photoButton setEnabled:NO];
    ALAssetsLibrary *library = [[MAContext sharedContext] sharedAssetsLibrary];
    [stillCamera capturePhotoAsJPEGProcessedUpToFilter:filter withCompletionHandler:^(NSData *processedJPEG, NSError *erro){
        
        [library writeImageDataToSavedPhotosAlbum:processedJPEG metadata:stillCamera.currentCaptureMetadata completionBlock:^(NSURL *assetURL, NSError *erro){
            
            [library assetForURL:assetURL resultBlock:^(ALAsset *asset){
             
                [[[MAContext sharedContext] sharedAssetsGroup] addAsset:asset];
                
            } failureBlock:^(NSError *erro){
            }];
        }];
        
        [self.photoButton setEnabled:YES];
    }];
    
}

- (void)clickImageButton{
    MABrowseViewController *BrowseVC = [[MABrowseViewController alloc] init];
    MAAlbumViewController *albumVC = [[MAAlbumViewController alloc] init];
    MACollectionViewController *collectionVC = [[MACollectionViewController alloc] init];
    
    BrowseVC.view.backgroundColor = [UIColor clearColor];
    collectionVC.view.backgroundColor = [UIColor clearColor];
    albumVC.view.backgroundColor = [UIColor clearColor];
    
    UITabBarController *tabBarCon = [[UITabBarController alloc] init];
    tabBarCon.automaticallyAdjustsScrollViewInsets = NO;
    [tabBarCon addChildViewController:collectionVC];
    [tabBarCon addChildViewController:albumVC];
    [tabBarCon addChildViewController:BrowseVC];
    
    [[[MAContext sharedContext] rootViewController] pushViewController:tabBarCon animated:YES];
    [[[MAContext sharedContext] rootViewController] setNavigationBarHidden:NO];
}

- (void)swipe:(UISwipeGestureRecognizer *)recognizer{
    //轻扫手势，调整滤镜
    GPUImageOutput<GPUImageInput> *newFilter = nil;
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        newFilter = [[GPUImageGaussianBlurFilter alloc] init];
    }
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        newFilter = [[GPUImageSketchFilter alloc]init];
    }
    [self changeFilter:newFilter];
}

- (void)changeFilter:(id<GPUImageInput>)input{
    if (input) {
        [filter removeTarget:(GPUImageView *)self.view];
        [stillCamera removeTarget:filter];
        filter = input;
        [filter addTarget:(GPUImageView *)self.view];
        [stillCamera addTarget:filter];
    }
}
@end