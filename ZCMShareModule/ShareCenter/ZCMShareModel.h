//
//  ZCMShareModel.h
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/21.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCMShareContent.h"
@interface ZCMShareModel : NSObject<ZCMShareContent>

+ (id<ZCMShareContent>) content:(NSString *)content
                 defaultContent:(NSString *)defaultContent
                          image:(id<ZCMShareAttachment>)image
                          title:(NSString *)title
                            url:(NSString *)url
                    description:(NSString *)description
                      mediaType:(ZCMSharePublishContentMediaType)mediaType;

@end
