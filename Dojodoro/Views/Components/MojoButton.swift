//
//  MojoButton.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButton: View {
    var isSelected: Bool
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? {}) {}
            .buttonStyle(MojoButtonStyle("Selecionar", isSelected: isSelected))
    }
}

#Preview {
    @Previewable @State var isSelected = false
    MojoButton(isSelected: false){
        isSelected.toggle()
    }
}
