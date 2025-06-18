//
//  ContentView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State var viewModel: DojodoroViewModel = .init()
    @State var isShowingPomodoro: Bool = false
    @Namespace private var animationNamespace
    
    var body: some View {
        ZStack{
            if(isShowingPomodoro){
                DojodoroView(viewModel: viewModel, isShowingPomodoro: $isShowingPomodoro)
            } else {
                TabBarView(viewModel: viewModel, isShowingPomodoro: $isShowingPomodoro)
            }
        }
        .animation(.easeInOut, value: isShowingPomodoro)
        .onAppear()
        {
            viewModel.loadPlants(context: modelContext)
        }
        
    }
}

#Preview {
    ContentView()
    
}
