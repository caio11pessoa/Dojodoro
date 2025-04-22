//
//  PomodoroImage 2.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 17/04/25.
//


import SwiftUI

struct PomodoroImage: View {
    var bonsaiImage: String
    var bonsaiHeight: CGFloat = 0
    
    var body: some View {
        Image(bonsaiImage)
            .resizable()
            .scaledToFit()
            .frame(height: bonsaiHeight)
    }
}

#Preview {
    PomodoroImage(bonsaiImage: "BlueBonsai", bonsaiHeight: 202)
}
