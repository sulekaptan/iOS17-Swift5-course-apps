//
//  Localservice.swift
//  NetworkInterchangable
//
//  Created by Şule Kaptan on 23.01.2024.
//

import Foundation

class Localservice : NetworkService {
    
    var type: String = "Localservice"
    
    func download(_ resourse: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resourse, ofType: "json") else {
            fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
    
}
