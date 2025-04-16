//
//  DojodoroView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 15/04/25.
//

import SwiftUI

struct DojodoroView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            
            VStack{
                CircularProgressView(percentagem: 0.5, isWorking: true)
//                    .padding(40)
                Image(.blueBonsai)
                    .resizable()
                    .scaledToFit()
                    .padding(40)
                Text("Progress Bar")
            }
            .padding(.horizontal, 60)
        }
    }
}

#Preview {
    DojodoroView()
}

#Preview {
    ContentView()
}
