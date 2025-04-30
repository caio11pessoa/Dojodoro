//
//  SwiftUIView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 22/04/25.
//

import SwiftUI

struct TabBarView: View {
    @State var pickedIndex: Int = 1
    @State var viewModel: DojodoroViewModel
    @Binding var isShowingPomodoro: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background
            Group {
                switch pickedIndex {
                case TabBarItem.loja.rawValue:
                    ShopView()
                    
                case TabBarItem.bonsai.rawValue:
                    BonsaiView(viewModel: viewModel){
                        isShowingPomodoro.toggle()
                    }
                    
                case TabBarItem.jardim.rawValue:
                    GardenView(viewModel: viewModel)
                    
                default:
                    GardenView(viewModel: viewModel)
                }
            }
            .padding(.bottom, 100)
            TabBarComponent(target: $pickedIndex)
                .padding(.bottom)
                .frame(height: 90)
                .padding(.horizontal, 48)
        }
        .ignoresSafeArea()
        .blur(radius: viewModel.isShowingPlantDetail ? 10 : 0)
        // Modals
        .overlay {
            if viewModel.isShowingPlantDetail {
                ZStack {
                    Color.black.opacity(0.75)
                    SelectPlantModal(viewModel: viewModel)
                        .padding(32)
                        .padding(.vertical, 140)
                }
                .transition(.opacity)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    TabBarView(viewModel: .init(), isShowingPomodoro: .constant(false))
}
