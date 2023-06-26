//
//  NativeModule.m
//  Test_Project
//
//  Created by Aditya Gupta on 19/05/23.
//

#import <Foundation/Foundation.h>


// NativeModule.m

#import <React/RCTBridgeModule.h>

@interface NativeModule : NSObject <RCTBridgeModule>
@end

@implementation NativeModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(yourMethodName:(NSString *)param1 param2:(NSString *)param2) {
  // Your native code logic here
  NSLog(@"Param 1: %@", param1);
  NSLog(@"Param 2: %@", param2);
}

@end
