//
//  ZCMShareModule.h
//  ZCMShareModule
//
//  Created by 梁城楠 on 16/4/11.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCMShareCenter.h"

@interface ZCMShareModule : NSObject

+ (BOOL) registShareCenter;

/**
 *  分享
 *
 *  @param controller 分享展示页面
 *  @param Content    分享内容
 *  @param shareType  分享平台
 *  @param comlpetion 结果回调
 */
+ (void) presentSnsIconSheetView:(UIViewController *)controller
                    shareContent:(id<ZCMShareContent>)Content
                       shareType:(ZCMShareType)shareType
                      completion:(ZCMSharePublishContentEventHandler) comlpetion;
+ (id<ZCMShareContent>) content:(NSString *)content
                 defaultContent:(NSString *)defaultContent
                          image:(id<ZCMShareAttachment>)image
                          title:(NSString *)title
                            url:(NSString *)url
                    description:(NSString *)description
                      mediaType:(ZCMSharePublishContentMediaType)mediaType;
@end
