//
//  Utils.m
//  onePass
//
//  Created by Le Cong on 10/14/14.
//  Copyright (c) 2014 Le Cong. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)randomStringWithLength: (int) length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length]) % [letters length]]];
    }
    
    return randomString;
}

@end
