//
//  PhotoViewCOntroller.h
//  Memory album
//
//  Created by sugc on 16/2/22.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
@interface MAPhotoViewController : UIViewController
{
    GPUImageStillCamera *stillCamera;
    GPUImageOutput<GPUImageInput> *filter, *secondFilter, *terminalFilter;
    UISlider *filterSettingsSlider;
    UIButton *photoCaptureButton;
    GPUImagePicture *memoryPressurePicture1, *memoryPressurePicture2;
    
}




@end