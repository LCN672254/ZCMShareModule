//
//  ZCMShareImageModel.m
//  ZCMBaseKit
//
//  Created by 梁城楠 on 16/3/21.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMShareImageModel.h"
#import <UIKit/UIKit.h>

@interface ZCMShareImageModel()

@property (nonatomic,strong) NSString *path;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSData *data;
@property (nonatomic,strong) NSString *fileName;
@property (nonatomic,strong) NSString *mimeType;
@end

@implementation ZCMShareImageModel


+(id<ZCMShareAttachment>) imageWithPath:(NSString *)path{

    ZCMShareImageModel *model = [[ZCMShareImageModel alloc] init];
    model.path = path;
    model.data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    model.fileName = [image accessibilityIdentifier];
    model.mimeType = [model typeForImageData:model.data];
    model.url = nil;
    return model;
    
}
+ (id<ZCMShareAttachment>) imageWithUrl:(NSString *)url{

    ZCMShareImageModel *model = [[ZCMShareImageModel alloc] init];
    model.url = url;
    return model;
}

- (NSString *)typeForImageData:(NSData *)data {
    
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    
    
    switch (c) {
            
        case 0xFF:
            
            return @"image/jpeg";
            
        case 0x89:
            
            return @"image/png";
            
        case 0x47:
            
            return @"image/gif";
            
        case 0x49:
            
        case 0x4D:
            
            return @"image/tiff";
            
    }
    
    return nil;
    
}

@end
