//
//  ShowCammera.h
//  RuanRongDai
//
//  Created by RUAN-JSB-WWB on 2017/8/16.
//  Copyright © 2017年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ShowCammeraBlock)(UIImage * image);
@interface ShowCammera : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong)UIImage * selectImage;
@property (nonatomic,copy) ShowCammeraBlock  selectImageblock;
@property (nonatomic,strong) NSMutableArray * showImageUrlArray;

+(ShowCammera *)shareCamemra;
-(void)show;
@end
