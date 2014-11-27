//
//  RMSharedPreferencesUserDefaults.m
//  SharedPreferences
//
//  Created by Paulo Andrade on 27/11/14.
//  Copyright (c) 2014 Realmac Software. All rights reserved.
//

#import "RMSharedPreferencesUserDefaults.h"

@implementation RMSharedPreferencesUserDefaults

+ (instancetype)standardUserDefaults
{
    static RMSharedPreferencesUserDefaults *_sharedUserDefaults = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedUserDefaults = [[self alloc] initWithApplicationGroupIdentifier:@"XYZABC1234.com.realmacsoftware.dts.sharedpreferences"];
    });
    
    return _sharedUserDefaults;
}

+ (void)resetStandardUserDefaults
{
    RMSharedUserDefaults *userDefaults = [self standardUserDefaults];
    [userDefaults synchronize];
    [[userDefaults dictionaryRepresentation] enumerateKeysAndObjectsUsingBlock:^ (NSString *defaultName, id value, BOOL *stop) {
        [userDefaults removeObjectForKey:defaultName];
    }];
}


@end
