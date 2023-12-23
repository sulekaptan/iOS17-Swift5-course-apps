//
//  Webservice.swift
//  CryptoCrazySwiftUI
//
//  Created by Şule Kaptan on 18.12.2023.
//

import Foundation

class Webservice {
    
    //continuation: güncel task'i suspend etmek yani duraklatmak. herhangi bir fonksiyon async olmasa da async hale getirip istediğimiz zaman duraklatıp devam ettirebiliriz. manuel olarak duraklayacağı yeri biz seçicez.
    //duraklatma yeteneğini bu fonksiyon da kazandırmış oluruz yani.
    func downloadCurrenciesContinuation (url:URL) async throws -> [CryptoCurrency] {
        try await withCheckedThrowingContinuation { continuation in //resume ile burda ister veri ister hata, istersek de async olmayan bir fonksiyonu çağırabiliriz.
            downloadCurrencies(url: url) { result in
                switch result {
                case .success(let cryptos):
                    continuation.resume(returning: cryptos ?? [])
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    //escaping: iş bitince bana şunu ver demek.
    func downloadCurrencies (url:URL, completion: @escaping (Result<[CryptoCurrency]?,DownloaderError>) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { // hata var mı kontrol ettik
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data, error == nil else { //data var mı kontrol ettik
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
}

enum DownloaderError : Error {
    case badUrl
    case noData
    case dataParseError
}
