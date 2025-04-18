//
//  ShopView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct BonsaiView: View {
    @State var router: AppRouter
    @State var viewModel: DojodoroViewModel
    var onTap: () -> Void
    
    var body: some View {
        
        ZStack {
            ZStack {
                Text("Toque na tela para começar")
                    .font(Font.dojoUI(.titleMedium))
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                
                VStack {
                    Spacer()
                    Image(.vase)
                        .onTapGesture {
                            onTap()
                        }
                }
            }
        }
    }
}

#Preview {
    BonsaiView(router: .init(), viewModel: .init()){
        print("Task Validation")
    }
    .ignoresSafeArea()
}
