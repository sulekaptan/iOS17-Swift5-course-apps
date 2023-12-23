//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Şule Kaptan on 21.12.2023.
//

import Foundation

//observable object: combine framework'ünden çıkan bir konsept. gözlemlenebilir obje.
//ben burda öyle bir yapı kurmak istiyorum ki cryptolist içinde herhangi bir değişiklik olduğunda main view direkt kendi kendine yenilensin.
//observable object struct'larda kullanılmaz çünkü kalıtım alınıyor.

//@MainActor -> bu sınıfın içindeki propertyler main thread'de işlem görecek demek. yani dispatch queue kullanmaya gerek kalmaz.
@MainActor
class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]() //bu gözlemlenebilir durumunu yapmak için de işte bu listeyi @Published şeklinde tanımlamalıyız.
    
    let webservice = Webservice()
    
    func downloadCryptosContinuation(url:URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesContinuation(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            /*
             DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
             */
        } catch {
            print(error)
        }
    }
    
    /*
    func downloadCryptos(url:URL){
        webservice.downloadCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos { //bunu almak lazım. zaten bunu aldıktan sonra view içinde kullanmaya sıra geliyor. o yüzden en başta bir liste oluşturmamız lazım aslında. cryptoviewmodel'i tutan.
                   // self.cryptoList = cryptos -> bunu direkt bu şekilde birbirine çeviremeyiz. o yüzden map fonk kullanırız.
                    // ve bu cryptlist artık kullanıcı arayüzünü etkileyeceği için bunu dispatch queue ile main threadde yapmak gerekir.
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }
    */
}


//modelde ne varsa buraya aktarıyoruz. id, currency, price
struct CryptoViewModel {
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
}

//artık bu gözlemenebilir objeyi view içinde gözlemlemek ve view içinde kullanmaya sıra geldi.
