//
//  SettingsView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 23/04/25.
//
import SwiftUI

enum ImageName: String {
    case clockSetting
    case countdown
    case leftChevron
    case song
}

struct SettingsView: View {
    @Binding var isShowing: Bool
    @State var viewModel: DojodoroViewModel
    @State var viewModelSettings: SettingsViewModel = .init()
    @Binding var isShowingPomodoro: Bool
    
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75)
            
            switch viewModelSettings.currentPage {
            case .options:
                OptionsView(viewModelSettings: viewModelSettings, isShowingPomodoro: $isShowingPomodoro)
            case .ambientSound:
                AmbientSoundView()
            case .restTime:
                RestTimeView()
            case .workTime:
                WorkTimeView()
            }
        }
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    withAnimation {
                        if(viewModelSettings.route.count <= 1){
                            isShowing.toggle()
                        }else {
                            viewModelSettings.goBack()
                            
                        }
                    }
                } label: {
                    Image(.leftChevron)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 20)
                        .tint(Color.background)
                }
            }
        }
    }
}

#Preview {
    SettingsView(isShowing: .constant(true), viewModel: .init(), isShowingPomodoro: .constant(true))
        .ignoresSafeArea()
    
}


