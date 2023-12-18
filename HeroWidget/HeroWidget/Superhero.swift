//
//  Superhero.swift
//  HeroWidget
//
//  Created by Şule Kaptan on 17.12.2023.
//

import Foundation

struct Superhero : Identifiable, Codable {
    let image : String
    let name : String
    let realName : String
    
    var id : String {image}
}

let ironman = Superhero(image: "ironman", name: "Iron Man", realName: "Tony Stark")
let batman = Superhero(image: "batman", name: "Batman", realName: "Bruce Wayne")
let spiderman = Superhero(image: "spiderman", name: "Spider Man", realName: "Peter Parker")
let captanAmerica = Superhero(image: "captanamerica", name: "Captan America", realName: "Steve Rogers")
