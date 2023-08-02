//
//  MyCustomModule.swift
//  Test_Project
//
//  Created by Aditya Gupta on 26/05/23.
//

// MyCustomModule.swift

import Foundation
import React

@objc(MyCustomModule)
class MyCustomModule: RCTEventEmitter {

  // Declare a method to be accessible from JavaScript
  @objc func myMethod(_ value: String,parameter1: String,parameter2: String) -> Void {
    // Perform the desired Swift functionality
//    let result = "Hello, " + input + " " + par1

    // Resolve the promise with the result
//
//    NSLog("%@", result);
//    NSLog("%d", num2);
    NSLog("%@", value);
    NSLog("%@", parameter1);
    NSLog("%@", parameter2);
    print(parameter2)
//    return "got It"
//    resolver("got It")
    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
  }
  
  override func supportedEvents() -> [String]! {
    return ["CallingFromiOS"];
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return false;
  }
  
}
