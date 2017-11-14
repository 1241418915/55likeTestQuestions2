//
//  ShowCammera.m
//  RuanRongDai
//
//  Created by RUAN-JSB-WWB on 2017/8/16.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import "ShowCammera.h"
#import "UsualMethod.h"
//监测权限
#import <Photos/Photos.h>
@implementation ShowCammera

+(ShowCammera *)shareCamemra
{
    static ShowCammera * show = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        show = [[ShowCammera alloc] init];
    });
    return show;
}

-(void)show
{
    
    
    
    UIAlertController *alertC = [[UIAlertController alloc]init];
    // 拍照
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
        AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限
        NSLog(@"拍照 %ld",(long)AVstatus);
        if (AVstatus == 2) {
            UIAlertController *changeNicknameAlert = [UIAlertController alertControllerWithTitle:@"未获得授权使用摄像头" message:@"请在iOS“设置”-“隐私”-“相机”中打开" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            }];
            [changeNicknameAlert addAction:sureAction];
            
            
            
            [[UsualMethod getCurrentVC] presentViewController:changeNicknameAlert animated:YES completion:nil];
        }else{
            UIImagePickerController *photo=[[UIImagePickerController alloc]init];
            
            photo.delegate=self;
            
            [photo setSourceType:UIImagePickerControllerSourceTypeCamera];
            
            [photo setAllowsEditing:YES];
            
            [[UsualMethod getCurrentVC] presentViewController:photo animated:YES completion:nil];
        }
    }];
    //    相册
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
        NSLog(@"相册的访问权限%ld",(long)photoAuthorStatus);
        if (photoAuthorStatus == 2) {
            UIAlertController *changeNicknameAlert = [UIAlertController alertControllerWithTitle:@"未获得授权使用相册" message:@"请在iOS“设置”-“隐私”-“照片”中打开" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            }];
            [changeNicknameAlert addAction:sureAction];
            
            [[UsualMethod getCurrentVC] presentViewController:changeNicknameAlert animated:YES completion:nil];
        }else{
            //
            UIImagePickerController *photo=[[UIImagePickerController alloc]init];
            
            photo.delegate=self;
            
            [photo setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            
            [photo setAllowsEditing:YES];
            
            [[UsualMethod getCurrentVC] presentViewController:photo animated:YES completion:nil];
            
            NSLog(@"从相册选择");
        }
        
    }];
    
    [alertC addAction:cameraAction];
    
    [alertC addAction:photoAction];
    
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:cancelAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertC animated:YES completion:nil];
    
    
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [ShowCammera shareCamemra].selectImage = nil;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * image = info[UIImagePickerControllerEditedImage];
    
    NSLog(@"ds");
//    //  发请求上传服务器
//    NSData *data = nil;
//    if (UIImageJPEGRepresentation(image, 0.3) == nil)
//    {
//        data = UIImagePNGRepresentation(image);
//    }
//    else
//    {
//        data = UIImageJPEGRepresentation(image, 0.3);
//    }
    
    
    
        
        self.selectImage = image;
        if (self.selectImageblock)
        {
            self.selectImageblock(image);
        }
        
    
  
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
    
}

@end
