//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Şule Kaptan on 25.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     let userInterfaceStyle = traitCollection.userInterface ile kullancının bulıunduğu birçok özelliği alabiliriz.
     
     if userInterfaceStyle == .dark ise vs vs şeklinde işlemler yapılabilir.
     */

    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //kullanıcının hangi modda kullandığı bizi ilgilendirmez bu uygulama ne olursa olsun light mode olsun istersek mesela bunu kullanırız.
        //overrideUserInterfaceStyle = .light
        
        //sadece bu sayfa değil bütün app light mode olsun istersek de info.plist'ten bu işlemi yapabiliriz.
      
    }
    
    //uygulamada modlar arası geçişte bu işlemin doğru çalışması gerekir.
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
              
              if userInterfaceStyle == .dark {
                  changeButton.tintColor = UIColor.white
              } else {
                  changeButton.tintColor = UIColor.blue
              }
              
    }
    
    //bu geçişlerde senkronişzasyonu sağlamak için bu fonk kullanılır.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
                    
                    if userInterfaceStyle == .dark {
                        changeButton.tintColor = UIColor.white
                    } else {
                        changeButton.tintColor = UIColor.blue
                    }
    }
    
    


}

