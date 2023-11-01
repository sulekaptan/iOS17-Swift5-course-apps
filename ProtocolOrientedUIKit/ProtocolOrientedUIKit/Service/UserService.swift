//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Şule Kaptan on 31.10.2023.
//

import Foundation

protocol UserService {
    func fetchUser (completion: @escaping(Result<User,Error>) -> ())
}
