//
//  GardenView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct GardenView: View {
    @State var router: AppRouter
    
    var body: some View {
        VStack {
            Text("Tela do jardim")
            Button("Voltar") {
                router.goBack()
            }
        }
    }
}
