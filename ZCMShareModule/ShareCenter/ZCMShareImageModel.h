//
//  ZCMShareImageModel.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/21.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCMShareAttachment.h"
@interface ZCMShareImageModel : NSObject<ZCMShareAttachment>
/**
 *  根据路径生成image
 *
 *  @param path path
 *
 *  @return image
 */
+ (id<ZCMShareAttachment>)imageWithPath:(NSString *)path;
/**
 *  根据网络地址生成Image
 *
 *  @param url @param path path
 *
 *  @return @return image
 */
+ (id<ZCMShareAttachment>)imageWithUrl:(NSString *)url;
@end
