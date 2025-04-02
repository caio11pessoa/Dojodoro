//
//  MojoButton.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButton: View {
    @Binding var isSelected: Bool
    var action: (() -> Void)?
    init(isSelected: Binding<Bool>, action: (() -> Void)? = nil) {
        self._isSelected = isSelected
        self.action = action
    }
    
    var body: some View {
        VStack {
            Button(action: action ?? {}) {}
                .buttonStyle(MojoButtonStyle("Selecionar", isSelected: isSelected))
        }
        .frame(height: 200)
        .background(Color(.background))
    }
}

#Preview {
    @Previewable @State var isSelected = false
    MojoButton(isSelected: $isSelected){
        isSelected.toggle()
    }
}
