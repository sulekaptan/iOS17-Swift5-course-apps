//
//  BackgroundProvidingClass.swift
//  SwiftDependencyInjc
//
//  Created by Şule Kaptan on 23.01.2024.
//

import Foundation
import UIKit

//bu sınıftan her obje oluşturduğumda bu değişken her seferinde bu renklerden birini random olarak döndürecek. 
class BackgroundProvidingClass : BackgroundProviderProtocol {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemGray, .systemRed, .systemMint, .systemCyan, .yellow, .green, .systemPink]
        return backgroundColors.randomElement()!
    }
    
    
}
