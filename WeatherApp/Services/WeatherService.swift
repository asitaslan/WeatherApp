//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Asit Aslan on 18.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import Foundation
class Webservice {
    
    func downloadWeathers(url: URL, completion: @escaping (WeatherTake?) -> ()) {
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                do {
                   let dataList = try JSONDecoder().decode(WeatherTake.self, from: data)
                    print(json ?? "")
                    completion(dataList)
                                  
                } catch let error  {
                    print(error.localizedDescription )
                }
            }
            
        }.resume()
        
    }
    
}
