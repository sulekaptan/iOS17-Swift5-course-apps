//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Şule Kaptan on 17.12.2023.
//

import SwiftUI

struct MainView: View {
    
    //1.adım bu gözlemenen objeyi almak. ve nesne oluşturmak
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    //2.adım artık verileri çekmek.
    var body: some View {
        NavigationView{
            List(cryptoListViewModel.cryptoList, id:\.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button {
                    Task.init{
                        //cryptoListViewModel.cryptoList = []
                        await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("Refresh")
                }

            })
            
            .navigationTitle(Text("Crypto Crazy"))
        }.task {
            await cryptoListViewModel.downloadCryptosContinuation(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

//3.adım cryptolistviewmodel.downloadcurrencies'i çağırmak.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
