//
//  MyCustomModule.m
//  Test_Project
//
//  Created by Aditya Gupta on 29/05/23.
//

#import <Foundation/Foundation.h>
#import <ReactNativeNavigation/ReactNativeNavigation.h>
#import "React/RCTEventEmitter.h"
#import "React/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(MyCustomModule,RCTEventEmitter);

//  RCT_EXTERN_METHOD(myMethod:(int)value ) //Here exported your swift function for React Native

  RCT_EXTERN_METHOD(myMethod:(NSString *)value parameter1:(NSString *)parameter1 parameter2:(NSString)parameter2); //Here exported your swift function for React Native

RCT_EXTERN_METHOD(backButtonClicked:(NSString *)value parameter1:(NSString *)parameter1 parameter2:(NSString)parameter2);

//  RCT_EXTERN_METHOD(myMethod:(NSString *)regularParam specificParam:(NSString *)specificParam moduleName:(NSString *)moduleName)


@end
