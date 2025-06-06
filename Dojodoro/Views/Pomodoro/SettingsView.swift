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
                OptionsView(viewModelSettings: viewModelSettings, isShowingPomodoro: $isShowingPomodoro, viewModel: viewModel)
            case .ambientSound:
                AmbientSoundView()
            case .restTime:
                RestTimeView(viewModel: viewModel, settingsViewModel:viewModelSettings)
            case .workTime:
                WorkTimeView(viewModel: viewModel, settingsViewModel: viewModelSettings)
            }
        }
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation {
                        isShowing.toggle()
                        viewModel.resume()
                    }
                    
                } label: {
                    Image(.exitMark)
                        .renderingMode(.template)
                        .resizable()
                        .tint(Color(.background))
                        .scaledToFit()
                        .frame(width: 24)
                }
            }
        }
    }
}

#Preview {
    SettingsView(isShowing: .constant(true), viewModel: .init(), isShowingPomodoro: .constant(true))
        .ignoresSafeArea()
    
}


