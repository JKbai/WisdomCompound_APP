//
//  NSString+isNull.m
//  fs-iOS
//
//  Created by 白印潇 on 2017/8/10.
//  Copyright © 2017年 cn.com.shopec.car. All rights reserved.
//

#import "NSString+isNull.h"

@implementation NSString (isNull)

+ (BOOL)isObject:(id)object
{
    if (object!=nil&&![object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    
    else if ([object isEqual:@"<null>"] || [object isEqual:@"null"])
    {
        return NO;
    } 
    
    
    return NO;
}

@end
