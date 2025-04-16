//
//  DojodoroView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct DojodoroView: View {
    
    @StateObject var viewModel = PomodoroViewModel()
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    CircularProgressView(percentagem: viewModel.progressCircle, isWorking: !viewModel.recover)
                    Text(viewModel.clockText)
                        .font(viewModel.agdasimaRegularFont(size: 64))
                    
                }
                Image(.blueBonsai)
                    .resizable()
                    .scaledToFit()
                    .padding(40)
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
        DojodoroView()
    }
}

#Preview {
    ContentView()
}
