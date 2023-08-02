//
//  MyCustomModule.swift
//  Test_Project
//
//  Created by Aditya Gupta on 26/05/23.
//

// MyCustomModule.swift

import Foundation
import React
import UIKit

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
    NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification), name:Notification.Name(rawValue: "callRNFromiOS"), object: nil)
    NSLog("%@", value);
    NSLog("%@", parameter1);
    NSLog("%@", parameter2);
    print(parameter2)
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callRNFromiOS"), object: nil)
    //    return "got It"
    //    resolver("got It")
//    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
    
//    DispatchQueue.main.async { [self] in
//      guard let window = UIApplication.shared.delegate?.window else {
//        return
//      }
//      let navigationController = UINavigationController()
//
//      window?.rootViewController = navigationController
//      let storyboard = UIStoryboard(name: "main", bundle: nil)
//      let newRootViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
//      navigationController.pushViewController(newRootViewController, animated: true)
//    }
  }
  
  @objc func methodOfReceivedNotification(notification: NSNotification){
    print("hi da observer");
    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
  }
  
  
  func sendSignalToRN() {
    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
  }
  
  override func supportedEvents() -> [String]! {
    return ["CallingFromiOS"];
  }
  
  override class func requiresMainQueueSetup() -> Bool {
    return false;
  }
  
}
