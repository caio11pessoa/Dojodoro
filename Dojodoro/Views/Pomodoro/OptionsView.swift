//
//  OptionsView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//


import SwiftUI

struct OptionsView: View, SettingsAbstract {
    
    @State var viewModelSettings: SettingsViewModel
    
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
                
                labelSettings(icon: .leftChevron, text: "Voltar ao Início") // Sair do Pomodoro
            }
            Spacer()
        }
    }
}
