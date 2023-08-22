//
//  UtilityFunctions.swift
//  Test_Project
//
//  Created by Aditya Gupta on 22/08/23.
//



import Foundation
import UIKit
import React


@objc public class UtilityFunctions : NSObject {
  
  @objc func navigateFirstViewController(name: String) {
    
    print("navigateFirstViewController", name)
    let storyboard = UIStoryboard.init(name: "main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
    guard let window = UIApplication.shared.delegate?.window else{return}
    let navVC = window?.rootViewController as? UINavigationController
    navVC?.pushViewController(viewController, animated: true)
  }

}
