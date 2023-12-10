//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Şule Kaptan on 3.12.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init(){}
}

//bu sınıftan sadece bir obje oluşturulabilir. daha doğrusu bu sınıftan bir obje oluşturulamaz.
