//
//  ViewController.swift
//  CryptoCrazyRxMVVM
//
//  Created by Şule Kaptan on 16.12.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    var cryptoList = [Crypto]()
    
    let cryptoVM = CryptoViewModel()
    
    let disposeBag = DisposeBag() //hafızadan temizler. birden fazla vm ile çalışıldığında kullanışlı olur.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupBindings()
        cryptoVM.requestData()
    }
    
    private func setupBindings(){
        cryptoVM
            .loading
            .bind(to: self.indicatorView.rx.isAnimating) //datayı direkt görünüme bağlamak
            .disposed(by: disposeBag)
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
            }
            .disposed(by:disposeBag)
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.cryptoList = cryptos
                self.tableView.reloadData()
            }
            .disposed(by:disposeBag)
        
        /*
         
         binding ile yapmak. bunu yapmak için tableview cell ister tabi ki.
         
        cryptoVM.cryptos
            .observe(on: MainScheduler.asyncInstance)
            .bind(to: tableView.rx.items(cellIdentifier: <#T##String#>, cellType: <#T##UITableViewCell.Type#>))
         */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }

}

