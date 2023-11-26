//
//  ViewController.swift
//  DovizUygulamasi
//
//  Created by Şule Kaptan on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
                print("Hata: \(error!.localizedDescription)")
            } else{
                if data != nil{
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                        if let rates = jsonResponse["rates"] as? [String: Any]{
                            DispatchQueue.main.async {
                                if let jpy = rates["JPY"] as? Double{
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let cad = rates["CAD"] as? Double{
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let turkish = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                            }
                        }
                    } catch {
                        let okey = UIAlertAction(title: "Okey", style: .default)
                        let alert = UIAlertController(title: "Warning", message: error.localizedDescription, preferredStyle: .alert)
                        alert.addAction(okey)
                        self.present(alert, animated: true)
                    }
                }
            }
        }.resume()
    }
}
