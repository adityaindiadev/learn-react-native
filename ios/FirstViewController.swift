//
//  FirstViewController.swift
//  Test_Project
//
//  Created by Aditya Gupta on 02/08/23.
//
import Foundation
import React
import UIKit


class FirstViewController: UIViewController {

    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapBtn(_ sender: Any) {
        
        print("Tap btn")
      
      if let url = URL(string: "testproject://openScreen?screen=details") {
                  if UIApplication.shared.canOpenURL(url) {
                      UIApplication.shared.open(url, options: [:], completionHandler: nil)
                  }
              }
      
//      let abc = simpleClosure()
//      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callRNFromiOS"), object: nil)
      
      // Call the backButtonClicked method from the native module
//      let myNativeModule = RCTBridge.module(MyCustomModule)  as! MyCustomModule
//      module(for: MyCustomModule.self) as! MyCustomModule
//      MyCustomModule().backButtonClicked("f", parameter1: "dd", parameter2: "ss")
    }
    

}

