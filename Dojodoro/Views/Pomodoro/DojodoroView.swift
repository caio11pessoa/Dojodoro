//
//  DojodoroView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct DojodoroView: View {
    
    @State var viewModel: DojodoroViewModel
    @State var isShowingSettings: Bool = false
    @Binding var isShowingPomodoro: Bool
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        let bonsaiHeight: CGFloat = 0.33 * screenHeight
        NavigationStack{
            ZStack(alignment: .top) {
                viewModel.backgroundColor
                    .ignoresSafeArea()
                    .animation(.easeInOut, value: viewModel.recover)
                
                VStack{
                    HStack {
                        Spacer()
                        Button {
                            viewModel.pausePomodoro()
                            withAnimation {
                                
                                isShowingSettings = true
                            }
                            
                        } label: {
                            Image(.pausePomodoro)
                                .renderingMode(.template)
                                .resizable()
                                .tint(viewModel.recover ? Color(.background) : Color.black)
                                .scaledToFit()
                                .frame(width: 24)
                        }
                    }
                    .padding()
                    .padding(.top)
                    ZStack{
                        CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.recover)
                            .padding(.horizontal, 60)
                            .animation(.easeInOut, value: viewModel.progressCircle)
                        
                        Text(viewModel.clockText)
                            .agdasimaRegularFont(size: 64)
                            .foregroundStyle(viewModel.textColor)
                    }
                }
                //            .blur(radius: isShowingSettings ? 20 : 0)
                
                VStack{
                    Spacer()
                    
                    PomodoroImage(bonsaiImage: viewModel.recover ? "Bambu" : "BlueBonsai", bonsaiHeight: bonsaiHeight)
                        .padding(.bottom, 32)
                    
                    ProgressPomodoro(progress: viewModel.pomodoro.Iteration, recover: viewModel.recover)
                }
                .padding(.bottom)
                
            }
            .blur(radius: isShowingSettings ? 20 : 0)
            .padding(isShowingSettings ? -25 : 0)
            .overlay {
                if isShowingSettings {
                    SettingsView(isShowing: $isShowingSettings, viewModel: viewModel, isShowingPomodoro: $isShowingPomodoro)
                        .transition( .opacity)
                }
            }
            .ignoresSafeArea()
            
            .onAppear {
                //            viewModel.startPomodoro()
            }
        }
    }
}

#Preview {
    DojodoroView(viewModel: .init(), isShowingPomodoro: .constant(true))
}

#Preview {
    ContentView()
}


