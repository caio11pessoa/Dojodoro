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
        let screenHeight = UIScreen.main.bounds.height
        let bonsaiHeight: CGFloat = 0.33 * screenHeight
        
        ZStack(alignment: .top) {
            viewModel.backgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut, value: viewModel.recover)
            
            ZStack{
                CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.recover)
                    .padding(.horizontal, 60)
                    .animation(.easeInOut, value: viewModel.progressCircle)
                
                Text(viewModel.clockText)
                    .agdasimaRegularFont(size: 64)
                    .foregroundStyle(viewModel.textColor)
            }
            
            VStack{
                Spacer()
                
                PomodoroImage(bonsaiImage: viewModel.recover ? "Bambu" : "BlueBonsai", bonsaiHeight: bonsaiHeight)
                    .padding(.bottom, 32)
                
                ProgressPomodoro(progress: viewModel.pomodoro.Iteration, recover: viewModel.recover)
            }
            .padding(.bottom)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    // Stop Page
                    router.goBack()
                    
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
