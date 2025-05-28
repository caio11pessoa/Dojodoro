//
//  WorkTimeView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//

import SwiftUI

struct WorkTimeView: View, SettingsAbstract {
    @State var viewModel: DojodoroViewModel
    var callback: (Int) -> Bool = {_ in true}
    
    private func labelSettings(value: Int) -> some View {
        HStack {
            Button {
                withAnimation {
                    if callback(value) {
                        viewModel.seletWorkTime = WorkTime(rawValue: value)!
                        viewModel.pomodoro.workTime = WorkTime(rawValue: value)!
                        viewModel.pomodoro.updateSettings()
                    }
                }
            } label: {
                Image(value == viewModel.seletWorkTime.rawValue ? .boxCheck : .boxUncheck)
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
            titleSettings(text: "Tempo de Trabalho", underTitle: "労働時間")
                .padding(.top, 140)
            Spacer()
            VStack(alignment: .leading) {
                ForEach(WorkTime.allCases, id: \.self) { value in
                    labelSettings(value: value.rawValue)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WorkTimeView(viewModel: .init())
}
