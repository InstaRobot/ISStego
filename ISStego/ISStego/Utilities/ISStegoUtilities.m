//
//  ISStegoUtilities.m
//  ISStego
//
//  Created by Isaac Stevao Sena on 26/01/15.
//  Copyright (c) 2015 iSena. All rights reserved.
//

#import "ISStegoUtilities.h"
#import "ISStegoDefaults.h"

NSString *const ISStegoErrorDomain = @"ISStegoErrorDomain";

@implementation ISStegoUtilities

BOOL contains(NSString *string, NSString *substring) {
    if(string
       && substring
       && !([string rangeOfString:substring
                          options:NSCaseInsensitiveSearch].length == 0)) {
        return YES;
    }
    
    return NO;
}

NSString *substring(NSString *string, NSString *prefix, NSString *suffix) {
    NSString *substring = nil;
    
    if (string) {
        NSRange prefixRange = [string rangeOfString:prefix];
        
        if (prefixRange.location != NSNotFound) {
            NSRange suffixRange = [string rangeOfString:suffix];
            
            if (suffixRange.location != NSNotFound) {
                NSRange range = NSMakeRange(prefixRange.location + prefixRange.length, suffixRange.location - prefixRange.location - prefixRange.length);
                if (range.location != NSNotFound) {
                    substring = [string substringWithRange:range];
                }
            }
        }
    }
    
    return substring;
}

NSError *errorForDomainCode(ISStegoErrorDomainCode code) {
    NSString *description = @"not defined";
    
    switch (code) {
        case ISStegoErrorDomainCodeDataTooBig:
            description = [NSString stringWithFormat:@"The data is too big"];
            break;
            
        case ISStegoErrorDomainCodeImageTooSmall:
            description = [NSString stringWithFormat:@"Image is too small: must have at least %d pixels", minPixels()];
            break;
            
        case ISStegoErrorDomainCodeNoDataInImage:
            description = @"There is no data in image";
        
        default:
            break;
    }
    
    NSError *error = [NSError errorWithDomain:ISStegoErrorDomain
                                         code:code
                                     userInfo:@{NSLocalizedDescriptionKey : description}];
    
    return error;
}

@end