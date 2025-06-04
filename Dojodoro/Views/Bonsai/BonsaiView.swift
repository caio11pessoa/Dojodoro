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
            Text("Toque no vaso para começar")
                .font(Font.dojoUI(.titleMedium))
                .minimumScaleFactor(0.7)
                .lineLimit(1)
                .foregroundStyle(.textColorPrimary)
            
            VStack {
                Spacer(minLength: 320)
                PomodoroImage(bonsaiImage: viewModel.selectedPlant.image, bonsaiHeight: bonsaiHeight
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
