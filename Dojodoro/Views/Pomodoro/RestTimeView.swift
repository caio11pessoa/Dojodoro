//
//  SelectSoundView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 23/04/25.
//

import SwiftUI

struct RestTimeView: View, SettingsAbstract {
    @State var viewModel: DojodoroViewModel
    var callback: (Int) -> Bool = {_ in true}
    
    private func labelSettings(value: Int) -> some View {
        HStack {
            Button {
                withAnimation {
                    if callback(value) {
                        viewModel.pomodoro.restTime = RestTime(rawValue: value)!
                        viewModel.seletRestTime = RestTime(rawValue: value)!
                        viewModel.pomodoro.updateSettings()
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
            Spacer()
            VStack(alignment: .leading) {
                ForEach(RestTime.allCases, id: \.self) { value in
                    labelSettings(value: value.rawValue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    RestTimeView(viewModel: .init())
        .ignoresSafeArea()
}
