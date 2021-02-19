//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Asit Aslan on 19.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }
    
  func makeAlert(textInput:String,messageInput:String){
        let alert = UIAlertController(title: textInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        present(alert, animated: true, completion: nil)
    }
}
