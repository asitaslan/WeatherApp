//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Asit Aslan on 18.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  static  func push(from: UIViewController){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            from.navigationController?.pushViewController(vc, animated: true)
        }
    }

   

}
