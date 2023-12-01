//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Şule Kaptan on 1.12.2023.
//

import Foundation

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var description : String
}

let mavigri = FavoriteElements(name: "Mavi Gri", imageName: "mavigri", description: "No 1 Music Band")
let madrigal = FavoriteElements(name: "Madrigal", imageName: "madrigal", description: "No 2 Music Band")
let dedubluman = FavoriteElements(name: "Dedüblüman", imageName: "dedubluman", description: "No 3 Music Band")

let favoriteBands = FavoriteModel(title: "Favorite Bands", elements: [mavigri, madrigal, dedubluman])

let b99 = FavoriteElements(name: "Brooklyn Nine Nine", imageName: "b99", description: "No 1 Tv Series")
let suits = FavoriteElements(name: "Suits", imageName: "suits", description: "No 2 Tv Series")
let lucifer = FavoriteElements(name: "Lucifer", imageName: "lucifer", description: "No 3 Tv Series")

let favoriteSeries = FavoriteModel(title: "Favorite Tv Series", elements: [b99, suits, lucifer])

let myFavorites = [favoriteBands, favoriteSeries]
