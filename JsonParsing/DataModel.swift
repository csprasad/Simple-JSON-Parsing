//
//  DataModel.swift
//  JsonParsing
//
//  Created by Rakeshkumar Desai on 11/07/19.
//  Copyright © 2019 Rakeshkumar Desai. All rights reserved.
//

import Foundation

struct  JSONData: Codable {
    let resultCount: Int
    let results: [results]
}

struct results: Codable {
    let artistName: String
    let artworkUrl100: String
    let collectionPrice: Double
    let country: String
    let trackName: String
    
}

