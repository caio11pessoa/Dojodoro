//
//  DojodoroView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct DojodoroView: View {
    
    @State var viewModel: DojodoroViewModel
    @Binding var isShowingPomodoro: Bool
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        let bonsaiHeight: CGFloat = 0.33 * screenHeight
        
        ZStack(alignment: .top) {
            viewModel.backgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut, value: viewModel.recover)
            VStack{
                HStack {
                    Spacer()
                    Button {
                        isShowingPomodoro.toggle()
                    } label: {
                        Image(.pausePomodoro)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                    }
                }
                .padding(.trailing)
                ZStack{
                    
                    CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.recover)
                        .padding(.horizontal, 60)
                        .animation(.easeInOut, value: viewModel.progressCircle)
                    
                    Text(viewModel.clockText)
                        .agdasimaRegularFont(size: 64)
                        .foregroundStyle(viewModel.textColor)
                }
            }
            
            VStack{
                Spacer()
                
                PomodoroImage(bonsaiImage: viewModel.recover ? "Bambu" : "BlueBonsai", bonsaiHeight: bonsaiHeight)
                    .padding(.bottom, 32)
                
                ProgressPomodoro(progress: viewModel.pomodoro.Iteration, recover: viewModel.recover)
            }
            .padding(.bottom)
        }
        .onAppear {
            viewModel.startPomodoro()
        }
    }
}

#Preview {
    DojodoroView(viewModel: .init(), isShowingPomodoro: .constant(true))
}

#Preview {
    ContentView()
}


