//
//  ZCMShareCenter.m
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMShareCenter.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "ZCMShareModel.h"
@interface ZCMShareCenter()<UMSocialDataDelegate,UMSocialUIDelegate>

@property (nonatomic,copy) ZCMSharePublishContentEventHandler comlpetion;

@end

@implementation ZCMShareCenter

+ (ZCMShareCenter *) shareCenter{
    
    static ZCMShareCenter *center = nil;
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        
        center = [[ZCMShareCenter alloc] init];
        
    });
    
    return center;
}

- (BOOL) handleOpenURL:(NSURL *)url wxApiDelegate:(id)delegate{
    
    return [UMSocialSnsService handleOpenURL:url wxApiDelegate:delegate];
}

- (id<ZCMShareContent>) content:(NSString *)content
                 defaultContent:(NSString *)defaultContent
                          image:(id<ZCMShareAttachment>)image
                          title:(NSString *)title
                            url:(NSString *)url
                    description:(NSString *)description
                      mediaType:(ZCMSharePublishContentMediaType)mediaType{
    
    return [ZCMShareModel content:content defaultContent:defaultContent image:image title:title url:url description:description mediaType:mediaType];
    
}

- (void) registShareCenter{
    
    [UMSocialData setAppKey:@"5701401c67e58e3fb6000f7b"];
    [UMSocialWechatHandler setWXAppId:@"wx6931765bfd9e43b1" appSecret:@"2ca4785eed64c3d00f4a133694fb7b1b" url:@"http://www.yunsen.com/"];
    [UMSocialQQHandler setQQWithAppId:@"1105196869" appKey:@"MSnDupoZXCL7QLl0" url:@"http://yunsen.082818.com/"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3990637379" secret:@"1a199f0f42e6f4c27698a043080c14eb" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite,UMShareToQQ,UMShareToQzone,UMShareToSina]];
    
}

- (void) shareContent:(id<ZCMShareContent>)Content
            shareType:(ZCMShareType)shareType
           completion:(ZCMSharePublishContentEventHandler) comlpetion{
    
    [self presentSnsIconSheetView:nil shareContent:Content shareType:shareType completion:comlpetion];
    
}

- (void) presentSnsIconSheetView:(UIViewController *)controller
                    shareContent:(id<ZCMShareContent>)content
                       shareType:(ZCMShareType)shareType
                      completion:(ZCMSharePublishContentEventHandler)comlpetion{
    
    switch ([content mediaType]) {
        case ZCMSharePublishContentMediaTypeImage:
            
            [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:[[content image] url]];
            
            break;
        case ZCMSharePublishContentMediaTypeVideo:
            
            [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeVideo url:[[content image] url]];
            
            break;
        case ZCMSharePublishContentMediaTypeMusic:
            
            [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeMusic url:[[content image] url]];
            
            break;
            
        default:
            break;
    }
    
    self.comlpetion = comlpetion;
    NSString *shareText = [content content]?:[content defaultContent];
    if (controller) {
        
        [UMSocialSnsService presentSnsIconSheetView:controller appKey:@"5701401c67e58e3fb6000f7b" shareText:shareText shareImage:[[content image] data] shareToSnsNames:[self shareToSnsNamesWithShareType:shareType shareContent:content] delegate:self];
        
    }
    else{
        
        NSString *type = nil;
        
        switch (shareType) {
            case ZCMShareTypeWeixiSession:
                
                type = UMShareToWechatSession;
                
                break;
            case ZCMShareTypeWeixiFav:
                type = UMShareToWechatFavorite;
                break;
            case ZCMShareTypeQQ:
                type = UMShareToQQ;
                break;
            case ZCMShareTypeQQSpace:
                type = UMShareToQzone;
                break;
            case ZCMShareTypeSinaWeibo:
                
                type = UMShareToSina;
                
                break;
                
            default:
                break;
        }
        
        UMSocialUrlResource *urlResource = [[UMSocialUrlResource alloc] init];
        urlResource.url = [[content image] url];
        urlResource.resourceType = UMSocialUrlResourceTypeImage;
        
        [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[type] content:shareText image:[[content image] data]  location:nil urlResource:urlResource presentedController:self completion:^(UMSocialResponseEntity *response){
            [self handleUMSocialDataResponse:response];
        }];
        
    }
    
}

- (NSArray *) shareToSnsNamesWithShareType:(ZCMShareType) shareType shareContent:(id<ZCMShareContent>)content{
    
    NSMutableArray *array = [NSMutableArray array];
    
    if (shareType & ZCMShareTypeQQ) {
        
        [array addObject:UMShareToQQ];
        [UMSocialData defaultData].extConfig.qqData.url = [content url];
    }
    
    if (shareType & ZCMShareTypeTimeLine) {
        
        [array addObject:UMShareToWechatTimeline];
        [UMSocialData defaultData].extConfig.wechatTimelineData.url = [content url];
    }
    if (shareType & ZCMShareTypeQQSpace) {
        
        [array addObject:UMShareToQzone];
        [UMSocialData defaultData].extConfig.qzoneData.url = [content url];
    }
    
    if (shareType & ZCMShareTypeSinaWeibo) {
        
        [array addObject:UMShareToSina];
    }
    
    if (shareType & ZCMShareTypeWeixiFav) {
        
        [array addObject:UMShareToWechatFavorite];
        [UMSocialData defaultData].extConfig.wechatFavoriteData.url = [content url];
    }
    
    if (shareType & ZCMShareTypeWeixiSession) {
        
        [array addObject:UMShareToWechatSession];
        
        [UMSocialData defaultData].extConfig.wechatSessionData.url = [content url];
    }
    
    return array;
}

- (void) handleUMSocialDataResponse:(UMSocialResponseEntity *)response{
    
    switch (response.responseCode) {
        case UMSResponseCodeSuccess:
            
            self.comlpetion(ZCMShareTypeNone,ZCMShareResponseStateSuccess,response.error,YES);
            
            break;
        case UMSResponseCodeFaild:
            
            self.comlpetion(ZCMShareTypeNone,ZCMShareResponseStateFail,response.error,YES);
            
            break;
            
        case UMSResponseCodeCancel:
            
            self.comlpetion(ZCMShareTypeNone,ZCMShareResponseStateCancel,response.error,YES);
            
            break;
            
        default:
            break;
    }
}

#pragma mark -

/**
 *  分享结果回调
 */
- (void) didFinishGetUMSocialDataResponse:(UMSocialResponseEntity *)response{
    
    [self handleUMSocialDataResponse:response];
    
}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{
    
    [self handleUMSocialDataResponse:response];
    
}

@end
