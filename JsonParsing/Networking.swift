//
//  Networking.swift
//  JsonParsing
//
//  Created by Rakeshkumar Desai on 11/07/19.
//  Copyright © 2019 Rakeshkumar Desai. All rights reserved.
//

import Foundation


class Networking {
    
    func ApiCalling(url: String, completion: @escaping ([JSONData]) -> ()) {
        var Array = [JSONData]()
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error)
            }
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonData = try decoder.decode(JSONData.self, from: data)
                
//                print(jsonData)
//                for i in jsonData {
//                    print(i)
                    Array.append(jsonData)
//                }
//                print("data after",Array)
                completion(Array)
            } catch {
                print(error)
            }
        }.resume()
        print("data after",Array)
    
    }
    
    var ArrayData = [JSONData]()
    func API(){
        guard let url = URL(string: "https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([JSONData].self, from: data)
                print(jsonData)
                for i in jsonData {
                    self.ArrayData.append(i)
                }
                
            } catch {
                print(error)
            }
            }.resume()
    }
    
}
