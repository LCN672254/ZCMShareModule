//
//  ZCMShareTypeDef.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#ifndef ZCMShareTypeDef_h
#define ZCMShareTypeDef_h


#endif /* ZCMShareTypeDef_h */


typedef enum {
    
    ZCMShareTypeNone = 0,
    ZCMShareTypeWeixiSession,  /*微信好友*/
    ZCMShareTypeWeixiFav,      /*微信收藏*/
    ZCMShareTypeTimeLine,      /*朋友圈*/
    ZCMShareTypeSinaWeibo,     /*新浪微博*/
    ZCMShareTypeQQSpace,       /*QQ空间*/
    ZCMShareTypeQQ,            /*分享到QQ*/
}
ZCMShareType;


typedef enum
{
    ZCMShareResponseStateBegan = 0, /**< 开始 */
    ZCMShareResponseStateSuccess = 1, /**< 成功 */
    ZCMShareResponseStateFail = 2, /**< 失败 */
    ZCMShareResponseStateCancel = 3 /**< 取消 */
}
ZCMShareResponseState;


typedef enum
{
    ZCMSharePublishContentMediaTypeText = 0, /**< 文本 */
    ZCMSharePublishContentMediaTypeImage = 1, /**< 图片 */
    ZCMSharePublishContentMediaTypeNews = 2, /**< 新闻 */
    ZCMSharePublishContentMediaTypeMusic = 3, /**< 音乐 */
    ZCMSharePublishContentMediaTypeVideo = 4, /**< 视频 */
    ZCMSharePublishContentMediaTypeApp = 5, /**< 应用,仅供微信使用 */
    ZCMSharePublishContentMediaTypeNonGif = 6, /**< 非Gif消息,仅供微信使用 */
    ZCMSharePublishContentMediaTypeGif = 7 /**< Gif消息,仅供微信使用 */
}
ZCMSharePublishContentMediaType;

typedef void(^ZCMSharePublishContentEventHandler) (ZCMShareType type, ZCMShareResponseState state,NSError *error, BOOL end);



