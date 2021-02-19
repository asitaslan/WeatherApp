//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Asit Aslan on 18.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//

import Foundation
class Webservice {
    
    func downloadWeathers(url: URL, completion: @escaping (WeatherTake) -> (), fail: @escaping(Error) -> () ) {
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                fail(error)
            } else if let data = data {
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(json ?? "")
                do {
                   let dataList = try JSONDecoder().decode(WeatherTake.self, from: data)
                    
                    completion(dataList)
                                  
                }catch let DecodingError.dataCorrupted(context) {
                 print(context)
               } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                 print("codingPath:", context.codingPath)
               } catch let DecodingError.valueNotFound(value, context) {
                 print("Value '\(value)' not found:", context.debugDescription)
                   print("codingPath:", context.codingPath)
               } catch let DecodingError.typeMismatch(type, context)  {
                  print("Type '\(type)' mismatch:", context.debugDescription)
                 print("codingPath:", context.codingPath)
               } catch{
                 
                 print("error: ", error)
             }
            }
            
        }.resume()
        
    }
    
}
