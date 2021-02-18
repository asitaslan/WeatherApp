//
//  ViewController.swift
//  WeatherApp
//
//  Created by Asit Aslan on 17.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 5
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toCellVC", for: indexPath)
    
        return cell
        
        
    }
       
    
    @IBAction func locationButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
        
    }
    @IBAction func searchButton(_ sender: Any) {
    }
    
}


