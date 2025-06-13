//
//  AmbientSoundView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//

import SwiftUI
enum Sound: String, CaseIterable {
    case off = "Nenhum"
    case rain = "Chuva"
    case lofi = "Lo-fi"
    
}

struct AmbientSoundView: View, SettingsAbstract {
    @State var selectedSound: Bool = false // TODO: Solve this
    @State var settingsViewModel: SettingsViewModel
    var callback: (Sound) -> Bool = {_ in true}
    
    private func labelSettings(value: Sound) -> some View {
        HStack {
            Button {
                withAnimation {
                    if callback(value) {
                        selectedSound.toggle()
                    }
                }
            } label: {
                Image(selectedSound ? .boxCheck : .boxUncheck)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(Color.background)
            }
            
            
            Text(value.rawValue)
                .foregroundStyle(Color.background)
                .agdasimaRegularFont(size: 32)
        }
    }
    
    var body: some View {
        VStack {
            titleSettings(text: "Sons Ambiente", underTitle: "周囲の音")
                .padding(.top, 140)
                .padding(.bottom, 48)
            VStack(alignment: .leading) {
                backButton(viewModelSettings: settingsViewModel)
                    .offset(x: -18)
                    .padding(.bottom, 24)
                ForEach(Sound.allCases, id: \.self) { value in
                    labelSettings(value: value)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    AmbientSoundView(settingsViewModel: .init())
}
