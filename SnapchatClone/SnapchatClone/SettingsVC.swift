//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Şule Kaptan on 2.12.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var signOutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
    }
    
}
