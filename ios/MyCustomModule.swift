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

let simpleClosure: () -> String = {
  print("hi da observer");
//  MyCustomModule().sendEvent(withName: "CallingFromiOS", body: "Hi")
  return "Hello, World!"
}

var ourParam : String?
var regParams : String?



@objc(MyCustomModule)
class MyCustomModule: NSObject {
  
  var window: UIWindow?  // Declare a method to be accessible from JavaScript
  @objc func myMethod(_ value: String,parameter1: String,parameter2: String) -> Void {
    // Perform the desired Swift functionality
    //    let result = "Hello, " + input + " " + par1
    
    // Resolve the promise with the result
    //
    //    NSLog("%@", result);
    //    NSLog("%d", num2);
//    NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification), name:Notification.Name(rawValue: "callRNFromiOS"), object: nil)
    NSLog("%@", value);
    NSLog("%@", parameter1);
    NSLog("%@", parameter2);
    print(parameter2)
    
    ourParam = parameter1
    regParams = parameter2
    
//    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callRNFromiOS"), object: nil)
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
    
    DispatchQueue.main.async {
//      let storyboard = UIStoryboard(name: "main", bundle: nil)
//      let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
//
//      guard let window = UIApplication.shared.delegate?.window else {
//              return
//            }
//            let navigationController = UINavigationController()
//      window?.rootViewController = navigationController
//
//      navigationController.pushViewController(viewController, animated: true)
      
      let storyboard = UIStoryboard.init(name: "main", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
      
      let navVC = self.window?.rootViewController as? UINavigationController
      navVC?.pushViewController(viewController, animated: true)
      
//      UIApplication.shared.keyWindow?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
  }
  
  
  @objc func backButtonClicked(_ value: String,parameter1: String,parameter2: String) {
//          DispatchQueue.main.async {
//              if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
//                  if let presentingViewController = rootViewController.presentingViewController {
//                      print("calling")
//                    presentingViewController.dismiss(animated: true, completion: nil)
////                      self.sendEvent(withName: "BackPressed", body: nil)
//                  }
//              }
//          }
    
    sendSignalToRN()
      }
  
  @objc func methodOfReceivedNotification(notification: NSNotification){
    print("hi da observer");
//    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
  }
  
  
  
  func sendSignalToRN() {
//    self.sendEvent(withName: "CallingFromiOS", body: "Hi")
  }
  
//  override func supportedEvents() -> [String]! {
//    return ["CallingFromiOS"];
//  }
  
//  override class func requiresMainQueueSetup() -> Bool {
//    return false;
//  }
  
}


extension AppDelegate{
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//    let storyboard = UIStoryboard.init(name: "main", bundle: nil)
//    let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
//
//    let navVC = AppDelegate().window.rootViewController as? UINavigationController
//    navVC?.pushViewController(viewController, animated: true)
    
    print("Printing: ", url)
    
    return true
  }
  
}
