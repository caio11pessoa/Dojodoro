//
//  WorkTimeView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//

import SwiftUI

struct WorkTimeView: View, SettingsAbstract {
    @State var selectedSound: Bool = false // TODO: Solve this
    var callback: (Int) -> Bool = {_ in true}
    
    var values: [Int] = [25, 30, 45, 60]
    
    private func labelSettings(value: Int) -> some View {
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
            
            
            Text("\(value) min")
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
                ForEach(values, id: \.self) { value in
                    labelSettings(value: value)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WorkTimeView()
}
