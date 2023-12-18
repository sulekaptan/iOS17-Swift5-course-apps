//
//  ContentView.swift
//  HeroWidget
//
//  Created by Şule Kaptan on 17.12.2023.
//

import SwiftUI
import WidgetKit

let superHeroArray = [batman, spiderman,ironman,captanAmerica]

struct ContentView: View {
    
    //apple developer hesabı isteyen özellik
    @AppStorage("hero", store: UserDefaults(suiteName: "com.sulekaptan.HeroWidget"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { hero in
                HeroView(hero: hero).onTapGesture {
                    saveToDefaults(hero: hero)
                }
            }
        }
    }
    
    func saveToDefaults(hero: Superhero) {
        //print(hero.name)
        if let heroData = try? JSONEncoder().encode(hero) {
            self.heroData = heroData
            print(hero.name)
            WidgetCenter.shared.reloadTimelines(ofKind: "WidgetHero")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
