//
//  ZCMShareModule.m
//  ZCMShareModule
//
//  Created by 梁城楠 on 16/4/11.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMShareModule.h"

@implementation ZCMShareModule

+ (BOOL) registShareCenter{

   [[ZCMShareCenter shareCenter] registShareCenter];
    return YES;
}

+ (void) presentSnsIconSheetView:(UIViewController *)controller shareContent:(id<ZCMShareContent>)Content shareType:(ZCMShareType)shareType completion:(ZCMSharePublishContentEventHandler)comlpetion{

    [[ZCMShareCenter shareCenter] presentSnsIconSheetView:controller shareContent:Content shareType:shareType completion:comlpetion];

}

+ (id<ZCMShareContent>) content:(NSString *)content defaultContent:(NSString *)defaultContent image:(id<ZCMShareAttachment>)image title:(NSString *)title url:(NSString *)url description:(NSString *)description mediaType:(ZCMSharePublishContentMediaType)mediaType{

    return [ZCMShareModule content:content defaultContent:defaultContent image:image title:title url:url description:description mediaType:mediaType];
}

@end
