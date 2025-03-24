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
            MojoBotaoShape()
                .foregroundStyle(.backgroundButtonSelected)
    //            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
//                .frame(width: 295, height: 48)
                .overlay(
                    MojoBotaoShape()
                        .stroke(style: StrokeStyle(lineWidth: 5))
                        .foregroundStyle(.borderButtonSelected)
                )
//            ZStack {
//                Rectangle()
//                    .frame(height: 48)
//                    .foregroundStyle(.backgroundBox.opacity(0.4))
//                    .offset(y: configuration.isPressed ? 1 : 4)
//                    .padding(.horizontal, 5)
//                Rectangle()
//                    .frame(height: 40)
//                    .foregroundStyle(.backgroundBox.opacity(0.4))
//                    .offset(y: configuration.isPressed ? 1 : 4)
//                //                    .padding(.horizontal, 5)
//                Rectangle()
//                    .frame(width: .infinity, height: 48)
//                    .foregroundStyle(.borderButtonSelected)
//                    .padding(.horizontal, 5)
//                Rectangle()
//                    .frame(height: 40)
//                    .foregroundStyle(.yellow)
//                Text(text)
//                    .font(.system(size: 18, weight: .bold))
//                    .foregroundStyle(.white)
//                    .opacity(configuration.isPressed ? 0.8 : 1)
//            }
//            .compositingGroup()
                .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, maxHeight: 48)
            .padding(15)
        }
    }
}

