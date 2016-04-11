//
//  ZCMShareModel.m
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/21.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMShareModel.h"

@interface ZCMShareModel()
@property (nonatomic,strong) NSString *shareTitle;
@property (nonatomic,strong) NSString *shareContent;
@property (nonatomic,strong) NSString *shareDefaultContent;
@property (nonatomic,strong) NSString *shareUrl;
@property (nonatomic,assign) ZCMSharePublishContentMediaType shareMediaType;
@property (nonatomic,strong) id<ZCMShareAttachment>shareImage;
@end

@implementation ZCMShareModel


+ (id<ZCMShareContent>) content:(NSString *)content
                 defaultContent:(NSString *)defaultContent
                          image:(id<ZCMShareAttachment>)image
                          title:(NSString *)title
                            url:(NSString *)url
                    description:(NSString *)description
                      mediaType:(ZCMSharePublishContentMediaType)mediaType{
    
    ZCMShareModel *model = [[ZCMShareModel alloc] init];
    [model setContent:content];
    [model setDefaultContent:defaultContent];
    [model setImage:image];
    [model setTitle:title];
    [model setUrl:url];
    [model setMediaType:mediaType];
    
    return model;
}

- (NSString *)title{

    return _shareTitle;
}

- (void) setTitle:(NSString *)title{

    [self setShareTitle:title];
}

- (NSString *)content{

    return _shareContent;
}

- (void) setContent:(NSString *)content{

    [self setShareContent:content];

}

- (NSString *) defaultContent{

    return _shareContent;
}

- (void) setDefaultContent:(NSString *)defaultContent{

    [self setShareDefaultContent:defaultContent];
    
}

- (id<ZCMShareAttachment>) image{

    return _shareImage;
}

- (void) setImage:(id<ZCMShareAttachment>)image{

    [self setShareImage:image];

}

- (NSString *)url{

    return _shareUrl;
}

- (void) setUrl:(NSString *)url{

    [self setShareUrl:url];
}

- (ZCMSharePublishContentMediaType) mediaType{

    return _shareMediaType;
}

- (void) setMediaType:(ZCMSharePublishContentMediaType)mediaType{

    [self setShareMediaType:mediaType];
    
}



@end
