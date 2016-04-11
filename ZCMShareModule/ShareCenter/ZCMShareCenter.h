//
//  ZCMShareCenter.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

/*
 * 分享中心
 */

#import <Foundation/Foundation.h>
#import "ZCMShareContent.h"
#import "ZCMShareTypeDef.h"
#import <UIKit/UIKit.h>
@interface ZCMShareCenter : NSObject


+ (ZCMShareCenter *) shareCenter;

- (BOOL) handleOpenURL:(NSURL *)url wxApiDelegate:(id)delegate;

/**
 *  注册分享信息
 */
- (void) registShareCenter;

/**
 *  分享
 *
 *  @param Content   分享的内容（名称，内容等等）
 *  @param shareType 分享平台
 *  @param comlpetion 结果回调
 */
- (void) shareContent:(id<ZCMShareContent>)Content
            shareType:(ZCMShareType)shareType
           completion:(ZCMSharePublishContentEventHandler) comlpetion;

/**
 *  分享
 *
 *  @param controller 分享展示页面
 *  @param Content    分享内容
 *  @param shareType  分享平台
 *  @param comlpetion 结果回调
 */
- (void) presentSnsIconSheetView:(UIViewController *)controller
                    shareContent:(id<ZCMShareContent>)Content
                       shareType:(ZCMShareType)shareType
                      completion:(ZCMSharePublishContentEventHandler) comlpetion;

@end
