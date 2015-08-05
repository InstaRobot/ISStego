//
//  ISSteganographer.h
//  ISStego
//
//  Created by Isaac Stevao Sena on 7/26/15.
//  Copyright (c) 2015 iSena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISSteganographer : NSObject

typedef void(^ISStegoEncoderCompletionBlock)(UIImage *image, NSError *error);

typedef void(^ISStegoDecoderCompletionBlock)(NSData *data, NSError *error);

+ (void)hideData:(id)data
       withImage:(UIImage *)image
 completionBlock:(ISStegoEncoderCompletionBlock)completionBlock;

+ (void)dataFromImage:(UIImage *)image
      completionBlock:(ISStegoDecoderCompletionBlock)completionBlock;

@end