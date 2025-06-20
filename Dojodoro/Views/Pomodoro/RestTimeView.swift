//
//  SelectSoundView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 23/04/25.
//

import SwiftUI

struct RestTimeView: View, SettingsAbstract {
    @State var viewModel: DojodoroViewModel
    @State var settingsViewModel: SettingsViewModel
    var callback: (Int) -> Bool = {_ in true}
    
    private func labelSettings(value: Int) -> some View {
        HStack {
            Button {
                withAnimation {
                    if callback(value) {
                        viewModel.pomodoro.restTime = RestTime(rawValue: value)!
                        viewModel.seletRestTime = RestTime(rawValue: value)!
                        viewModel.pomodoro.updateSettings()
                        viewModel.resetPomodoro()
                    }
                }
            } label: {
                Image(value == viewModel.seletRestTime.rawValue ? .boxCheck : .boxUncheck)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 24)
                    .foregroundStyle(Color.background)
            }
            
            
            Text("\(value/60) min")
                .foregroundStyle(Color.background)
                .agdasimaRegularFont(size: 32)
        }
    }
    
    var body: some View {
        VStack {
            titleSettings(text: "Tempo de descanso", underTitle: "休憩時間")
                .padding(.top, 140)
                .padding(.bottom, 48)
            VStack(alignment: .leading) {
                backButton(viewModelSettings: settingsViewModel)
                    .offset(x: -18)
                    .padding(.bottom, 24)
                
                ForEach(RestTime.allCases, id: \.self) { value in
                    labelSettings(value: value.rawValue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ZStack{
        Color.black
            .ignoresSafeArea()
        RestTimeView(viewModel: .init(), settingsViewModel: .init())
            .ignoresSafeArea()
    }
}
