//
//  Currency.swift
//  CryptoChecker
//
//  Created by quantagonista on 2/7/18.
//  Copyright © 2018 quantadev. All rights reserved.
//

import Foundation
import UIKit

class Currency {
    
    static let jName = "name"
    static let jRank = "rank"
    static let jPrice = "price_usd"
    static let jCode = "symbol"
    
    var name: String
    var rank: Int
    var price: Double
    var code: String
    
    init?(data: Any){
        guard
            let json = data as? [String:Any],
            let name = json[Currency.jName] as? String,
            let rank = json[Currency.jRank] as? String,
            let code = json[Currency.jCode] as? String,
            let price = json[Currency.jPrice] as? String
            else { return nil }
        
        self.name = name
        self.rank = Int(rank) ?? 0
        self.code = code
        self.price = Double(price) ?? 0
        print("name: \(self.name) rank: \(self.rank) price: \(self.price) code: \(self.code)")
    }
    
    init(name: String, rank: Int, price: Double, code: String) {
        self.name = name
        self.rank = rank
        self.price = price
        self.code = code
}
    
    static func getCurrenciesFromJSON(data: Any)->[Currency] {
        var cList = [Currency]()
        if let list = data as? [[String:Any]]{
            for item in list {
                if let currency = Currency(data: item){
                    cList.append(currency)
                    print("listCount: \(cList.count)")
                }
            }
        }
        print("Success\(cList.count)")
        return cList
    }
}
