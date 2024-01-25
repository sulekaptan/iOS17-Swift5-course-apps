//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Şule Kaptan on 23.01.2024.
//

import Foundation

//bu protokolu uygulayan herkes bundan sonra bu fonksiyonu uygulamak zorunda.
protocol NetworkService {
    
    func download(_ resourse: String) async throws -> [User]
    var type : String {get}
}
