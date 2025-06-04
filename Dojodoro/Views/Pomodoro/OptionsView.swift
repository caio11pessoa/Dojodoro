//
//  OptionsView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//


import SwiftUI

struct OptionsView: View, SettingsAbstract {
    
    @State var viewModelSettings: SettingsViewModel
    @Binding var isShowingPomodoro: Bool
    @State var viewModel: DojodoroViewModel
    
    var body: some View {
        VStack {
            titleSettings(text: "Opções", underTitle: "オプション")
                .padding(.top, 140)
            Spacer()
            
            VStack(alignment: .leading) {
                Button {
                    viewModelSettings.goTo(.workTime)
                } label: {
                    labelSettings(icon: .clockSetting, text: "Tempo de trabalho")
                }
                Button {
                    viewModelSettings.goTo(.restTime)
                } label: {
                    labelSettings(icon: .countdown, text: "Tempo de descanso")
                }
                Button {
                    viewModelSettings.goTo(.ambientSound)
                } label: {
                    labelSettings(icon: .song, text: "Sons Ambiente")
                }
                Button {
                    isShowingPomodoro = false
                    viewModel.stop()
                } label: {
                    labelSettings(icon: .leftChevron, text: "Voltar ao Início") // Sair do Pomodoro
                }
                
            }
            Spacer()
        }
    }
}
