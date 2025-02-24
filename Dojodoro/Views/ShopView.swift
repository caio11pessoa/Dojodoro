//
//  HomeView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct ShopView: View {
    @State var router: AppRouter
    
    var body: some View {
            VStack {
                Text("Shop View")
                Button("Ir para jardim") {
                    router.navigate(to: .jardim)
                }
                Button("Ir para bonsai") {
                    router.navigate(to: .bonsai)
                }
            }
        }
}
