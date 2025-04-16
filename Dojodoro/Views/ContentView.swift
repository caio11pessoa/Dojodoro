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
    @State var viewModel: DojodoroViewModel = .init()
    
    var body: some View {
        NavigationStack(path: $router.path){
            ZStack(alignment: .bottom) {
                Color.background
                
                Group {
                    switch pickedIndex {
                    case TabBarItem.loja.rawValue:
                        ShopView(router: router)
                        
                    case TabBarItem.bonsai.rawValue:
                        BonsaiView(router: router, viewModel: viewModel){
                            router.navigate(to: .dojodoro)
                        }
                        
                    case TabBarItem.jardim.rawValue:
                        GardenView(router: router, viewModel: viewModel)
                        
                    default:
                        GardenView(router: router, viewModel: viewModel)
                    }
                }
                .padding(.bottom, 90)
                DojodoroTabBar(target: $pickedIndex)
                    .padding(.bottom)
                    .frame(height: 90)
                    .padding(.horizontal, 48)
            }
            .ignoresSafeArea()
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .dojodoro:
                    DojodoroView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ContentView()
    
}
