//
//  CircularImageView.swift
//  HeroWidget
//
//  Created by Şule Kaptan on 17.12.2023.
//

import SwiftUI

struct CircularImageView: View {
    
    var image : Image
    
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray,lineWidth: 5))
            .shadow(radius: 5)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("batman"))
    }
}
