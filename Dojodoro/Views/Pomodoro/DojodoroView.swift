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
                    .animation(.easeInOut, value: viewModel.pomodoro.isRecover)
                
                VStack{
                    ZStack{
                        CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.pomodoro.isRecover)
                            .padding(.horizontal, 60)
                            .animation(.easeInOut, value: viewModel.progressCircle)
                        
                        Text(viewModel.tempoRestanteText)
                            .agdasimaRegularFont(size: 64)
                            .foregroundStyle(viewModel.textColor)
                    }
                    .padding(.top, 120)
                }
                VStack{
                    Spacer()
                    
                    PomodoroImage(bonsaiImage: viewModel.pomodoro.isRecover ? "Bambu" : viewModel.selectedPlant.image, bonsaiHeight: bonsaiHeight)
                        .padding(.bottom, 32)
                        .frame(maxWidth: 220)
                    
                    ProgressPomodoro(progress: viewModel.pomodoro.iteration, recover: viewModel.pomodoro.isRecover)
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
                viewModel.startPomodoro()
            }
            .onDisappear{
                viewModel.stop()
            }
            .toolbar {
                if(!isShowingSettings){
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            withAnimation {
                                isShowingSettings = true
                                viewModel.pause()
                            }
                            
                        } label: {
                            Image(.pausePomodoro)
                                .renderingMode(.template)
                                .resizable()
                                .tint(viewModel.pomodoro.isRecover ? Color(.background) : Color.black)
                                .scaledToFit()
                                .frame(width: 24)
                        }
                    }
                }
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


