//
//  ZCMShareAttachment.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#ifndef ZCMShareAttachment_h
#define ZCMShareAttachment_h


#endif /* ZCMShareAttachment_h */

#import <Foundation/Foundation.h>

@protocol ZCMShareAttachment <NSObject>

/**
 * 文件路径
 */
- (NSString *)path;
/**
 * 远程网址
 */
- (NSString *)url;
/**
 *  数据
 */
- (NSData *)data;
/**
 *  文件名
 */
- (NSString *)fileName;
/**
 *  文件类型
 */
- (NSString *)mimeType;

@end
