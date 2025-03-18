//
//  MojoButtonStyle.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButtonStyle: ButtonStyle {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    func makeBody(configuration: Configuration) -> some View {
//        let screeNWidth = UIScreen.main.bounds.width
//        let buttonWidth = screeNWidth - 30
        
        ViewThatFits {
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 48)
                    .foregroundStyle(.backgroundBox)
                    .padding(.horizontal, 5)
                Rectangle()
                    .frame(height: 40)
                    .foregroundStyle(.backgroundBox)
                Rectangle()
                    .frame(height: 48)
                    .foregroundStyle(.backgroundBox.opacity(0.4))
                    .offset(y: configuration.isPressed ? 1 : 4)
                    .padding(.horizontal, 5)
                Rectangle()
                    .frame(height: 40)
                    .foregroundStyle(.backgroundBox.opacity(0.4))
                    .offset(y: configuration.isPressed ? 1 : 4)
//                    .padding(.horizontal, 5)
                Text(text)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .opacity(configuration.isPressed ? 0.8 : 1)
            }
            .compositingGroup()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity)
            .padding(15)
        }
    }
}

