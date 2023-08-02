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
//      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "callRNFromiOS"), object: nil)
    }
    

}

