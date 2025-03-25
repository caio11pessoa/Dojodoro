//
//  MojoButton.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButton: View {
    @State private var isSelected = false // Estado do botão

    var body: some View {
        VStack {
            Button(action: {
                isSelected.toggle() // Alterna entre selecionado e não selecionado
            }) {}
            .buttonStyle(MojoButtonStyle("Selecionar", isSelected: isSelected))
        }
        .frame(height: 200)
        .background(Color(.background))
    }
}

#Preview {
    MojoButton()
}
