//
//  MojoButtonStyle.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButtonStyle: ButtonStyle {
    let text: String
    let isSelected: Bool  // Agora aceita estado selecionado

    init(_ text: String, isSelected: Bool = false) {
        self.text = text
        self.isSelected = isSelected
    }

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            MojoBotaoShape()
                .foregroundStyle(Color.gray.opacity(0.7))
                .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, maxHeight: 48)
                .padding(15)
                .offset(x: -1, y: 4)
            
            MojoBotaoShape()
                .foregroundStyle(isSelected ? .backgroundButtonSelected : .backgroundBox) // Cor de fundo
                .overlay(
                    MojoBotaoShape()
                        .stroke(style: StrokeStyle(lineWidth: 2))
                        .foregroundStyle(isSelected ? .borderButtonSelected : .backgroundBox) // Cor da borda
                )
                .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, maxHeight: 48)
                .padding(15)
            

            if isSelected {
                Text("選択する")
                    .font(.system(size: 24, weight: .light))
                    .foregroundStyle(Color.borderButtonSelected.opacity(0.6))
            }

            Text(text)
                .font(.system(size: 18, weight: .light))
                .foregroundStyle(.white)
                .opacity(configuration.isPressed ? 0.8 : 1)
        }
    }
}
