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
            Color.background
            
            VStack(spacing: 200) {
                Spacer()
                Text("Toque na tela para começar")
                    .font(Font.dojoUI(.titleMedium))
                    
                Image("Vase")
                    .onTapGesture {
                        onTap()
                    }
            }
        }
    }
}

#Preview {
    BonsaiView(router: .init(), viewModel: .init()){
        print("Task Validation")
    }
}
