//
//  ContentView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 04/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var router = AppRouter()
    @State var pickedIndex: Int = 1
    
    var body: some View {
        NavigationStack(path: $router.path){
            ZStack {
                Color.background
                VStack(spacing: 0) {
                    Spacer()
                    
                    Group {
                        switch pickedIndex {
                        case TabBarItem.loja.rawValue:
                            ShopView(router: router)
                        case TabBarItem.jardim.rawValue:
                            GardenView(router: router)
                        case TabBarItem.bonsai.rawValue:
                            BonsaiView(router: router)
                        default:
                            GardenView(router: router)
                        }
                    }
                    Spacer()
                    DojodoroTabBar(target: $pickedIndex)
                        .frame(height: 90)
                }
                .padding(.horizontal, 48)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
