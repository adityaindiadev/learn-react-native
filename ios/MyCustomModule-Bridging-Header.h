//
//  MyCustomModule-Bridging-Header.h
//  Test_Project
//
//  Created by Aditya Gupta on 29/05/23.
//

#ifndef MyCustomModule_Bridging_Header_h
#define MyCustomModule_Bridging_Header_h

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#endif /* MyCustomModule_Bridging_Header_h */