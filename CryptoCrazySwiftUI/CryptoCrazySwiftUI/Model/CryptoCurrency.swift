//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Şule Kaptan on 18.12.2023.
//

import Foundation

struct CryptoCurrency : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        // case currency = "cUrRe123ncY"
        case currency = "currency"
        case price = "price"
    }
}
