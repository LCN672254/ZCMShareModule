//
//  ZCMShareContent.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#ifndef ZCMShareContent_h
#define ZCMShareContent_h


#endif /* ZCMShareContent_h */

#import "ZCMShareTypeDef.h"
#import "ZCMShareAttachment.h"

@protocol ZCMShareContent <NSObject>
/**
 *  分享标题
 */
- (NSString *)title;
- (void) setTitle:(NSString *)title;
/**
 *  分享内容
 */
- (NSString *)content;
- (void) setContent:(NSString *)content;
/**
 * 默认分享内容，在分享内容为空时使用
 */
- (NSString *)defaultContent;
- (void)setDefaultContent:(NSString *)defaultContent;

/**
 *  地址
 */
- (NSString *)url;
- (void)setUrl:(NSString *)url;
/**
 *  分享内容类型（微信，QQ分享时使用）
 */
- (ZCMSharePublishContentMediaType) mediaType;
- (void) setMediaType:(ZCMSharePublishContentMediaType) mediaType;
/**
 * 设置图片
 */
- (id<ZCMShareAttachment>) image;
- (void) setImage:(id<ZCMShareAttachment>) image;

@end
