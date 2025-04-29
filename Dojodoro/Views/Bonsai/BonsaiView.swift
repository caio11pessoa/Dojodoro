//
//  ShopView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct BonsaiView: View {
    @State var viewModel: DojodoroViewModel
    var onTap: () -> Void
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        let bonsaiHeight: CGFloat = 0.33 * screenHeight
        
        ZStack {
            Text("Toque na tela para começar")
                .font(Font.dojoUI(.titleMedium))
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            
            VStack {
                Spacer(minLength: 320)
                PomodoroImage(bonsaiImage: viewModel.selectedPlant.imageGallery[.boonsaiSeed]!, bonsaiHeight: bonsaiHeight
                )
                .onTapGesture {
                    onTap()
                }
            }
        }
    }
}

#Preview {
    BonsaiView(viewModel: .init()){
        print("Task Validation")
    }
    .ignoresSafeArea()
}
