//
//  DojodoroView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct DojodoroView: View {
    
    @State var viewModel: DojodoroViewModel
    @State var router: AppRouter
    
    var body: some View {
        ZStack{
            viewModel.backgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut, value: viewModel.recover)
            
            VStack{
                ZStack{
                    CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.recover)
                        .animation(.easeInOut, value: viewModel.progressCircle)
                    Text(viewModel.clockText)
                        .agdasimaRegularFont(size: 64)
                        .foregroundStyle(viewModel.textColor)
                }
                Image(.blueBonsai)
                    .resizable()
                    .scaledToFit()
                    .padding(32)
                Text("Progress Bar")
            }
            .padding(.horizontal, 60)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    // Stop Page
                    
                }
                label: {
                    Image(.pausePomodoro)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .onAppear {
            viewModel.startPomodoro()
        }
    }
}

#Preview {
    NavigationStack {
        DojodoroView(viewModel: .init(), router: .init())
    }
}

#Preview {
    ContentView()
}
