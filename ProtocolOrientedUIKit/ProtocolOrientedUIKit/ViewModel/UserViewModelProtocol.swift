//
//  UserViewModelProtocol.swift
//  ProtocolOrientedUIKit
//
//  Created by Şule Kaptan on 31.10.2023.
//

import Foundation

protocol UserViewModelProtocol : AnyObject{
    func updateView(name:String, email:String, userName:String)
}
