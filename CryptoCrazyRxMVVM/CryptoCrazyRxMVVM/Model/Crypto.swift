//
//  Crypto.swift
//  CryptoCrazyRxMVVM
//
//  Created by Şule Kaptan on 16.12.2023.
//

import Foundation

struct Crypto : Codable {
    let currency:String
    let price:String
}

// ve bize liste içinde bir veri gelecek. yani;
// [Crypto] şeklinde
// tek eleman gelseydi Crypto şeklinde olurdu.
