//
//  ViewController.swift
//  WeatherApp
//
//  Created by Asit Aslan on 17.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var searchTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var weathersData: WeatherTake?
   
    
    let LocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        LocationManager.delegate = self
        LocationManager.requestWhenInUseAuthorization()
        getData()
        
    }
    
    
    private func getData(){
    
        let url = URL(string: "https://api.darksky.net/forecast/3b217b49c3d7bfb6ef40f5d2c81fd021/37.8267,-122.4233")!
    
        Webservice().downloadWeathers(url: url) { (weathers) in
            
            self.weathersData = weathers
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toCellVC", for: indexPath)
        switch indexPath {
        case 0:
            
        default:
            <#code#>
        }
        return cell
    }
    
    @IBAction func locationButton(_ sender: UIButton) {
        LocationManager.requestLocation()
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        let city = searchTxt.text ?? ""
        
        if city.isEmpty {
            makeAlert(textInput: "ERROR", messageInput: "Please enter a city Name")
        }else{
            DetailViewController.push(from : self)
        }
        
    }
    
    
    func makeAlert( textInput : String, messageInput : String){
        let alert = UIAlertController(title: textInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBuuton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBuuton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController : CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            LocationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            locationKontrol(lattitude: lat, longitude: lon)
        }
    }
    func locationKontrol(lattitude: Double, longitude: Double){
        
        print("Latitude : \(lattitude)")
        print("Longitude : \(longitude)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
