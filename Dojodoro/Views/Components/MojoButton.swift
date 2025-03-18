//
//  MojoButton.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 18/03/25.
//

import SwiftUI

struct MojoButton: View {
    var body: some View {
        VStack{
            
            Button(action: {}) {
                
            }
            .buttonStyle(MojoButtonStyle("Selecionar"))
        }
        .frame(height: 200)
        .background(Color(.background))
//        .padding(.horizontal, 50)
//        .background(.red)
    }
}

#Preview {
    MojoButton()
}
