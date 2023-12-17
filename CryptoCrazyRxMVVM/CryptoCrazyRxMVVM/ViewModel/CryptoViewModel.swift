//
//  CryptoViewModel.swift
//  CryptoCrazyRxMVVM
//
//  Created by Şule Kaptan on 16.12.2023.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {
    
    //burda bir publish, yayın yapıcaz ki view buna ulaşsın. yani view içinden de buraya bir subscribe alıcaz. böylece burda bir değişiklik olursa direkt gözlemleyebiliriz.
    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    
    
    func requestData(){
        
        self.loading.onNext(true)
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result {
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("Parsing Error!")
                case .serverError:
                    self.error.onNext("Server Error!")
                }
            }
        }

    }
}
