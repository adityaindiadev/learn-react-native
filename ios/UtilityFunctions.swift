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
    
    print("paramsGlobal", ourParam, regParams)
    
    
    // Create a URL object with the API URL
//    let s = ourParam ?? ""
    let sUrl = "https://fakestoreapi.com/"+(ourParam ?? "")
    print(sUrl)
    if let url = URL(string: sUrl) {
        
      print(url)
      // Create a URLSession
        let session = URLSession.shared
        
        // Create a data task
        let task = session.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Check if data is available
            if let data = data {
                do {
                    // Parse the JSON data
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                    
                    // Print the parsed JSON data
                    if let json = json {
                        print(json)
                      
//                      print("navigateFirstViewController", name)
//                      let storyboard = UIStoryboard.init(name: "main", bundle: nil)
//                      let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
//                      guard let window = UIApplication.shared.delegate?.window else{return}
//                      let navVC = window?.rootViewController as? UINavigationController
                      
                      DispatchQueue.main.async {
                        navVC?.pushViewController(viewController, animated: true)
                        
                      }
                        
                    }
                } catch {
                    print("JSON Parsing Error: \(error)")
                }
            }
        }
        
        // Start the task
        task.resume()
    } else {
        print("Invalid URL")
    }
    
    
//    print("navigateFirstViewController", name)
//    let storyboard = UIStoryboard.init(name: "main", bundle: nil)
//    let viewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
//    guard let window = UIApplication.shared.delegate?.window else{return}
//    let navVC = window?.rootViewController as? UINavigationController
//    navVC?.pushViewController(viewController, animated: true)
  }

}
