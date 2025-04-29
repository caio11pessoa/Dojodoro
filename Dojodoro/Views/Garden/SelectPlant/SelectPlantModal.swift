//
//  SelectPlantModal.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 01/04/25.
//

import SwiftUI

struct SelectPlantModal: View {
    @State var viewModel: DojodoroViewModel
    init(viewModel: DojodoroViewModel) {
        self.viewModel = viewModel
        guard viewModel.clickedPlant != nil else {
            viewModel.clickedPlant = .init(name: "Name")
            return
        }
    }
    
    var body: some View {
        Image(.selectModal)
            .resizable()
            .overlay {
                
                VStack(spacing: 8){
                    headerView
                    
                    Spacer()
                    
                    Image(viewModel.clickedPlant!.image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 140, maxWidth: 175)
                        .padding(.bottom, 8)
                    
                    infoRow(title: "Estágio:", value: "\(viewModel.clickedPlant!.stage)")
                    infoRow(title: "Pomodoros Feitos:", value: "\(viewModel.clickedPlant!.pomodoroCount)")
                    infoRow(title: "Tempo Total:", value: "\(viewModel.clickedPlant!.totalTime.hour!)hrs e \(viewModel.clickedPlant!.totalTime.minute!)Min")
                    
                    MojoButton(isSelected: viewModel.clickedPlant!.isSelected){
                        withAnimation {
                            viewModel.selectPlant()
                        }
                    }
                }
                .padding()
            }
            .frame(minWidth: 320, minHeight: 490)
    }
    
    private var headerView: some View {
        HStack {
            Text(viewModel.clickedPlant!.name)
                .font(Font.custom("DotGothic16-Regular", size: 28))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .scaledToFit()
            
            Spacer()
            
            Button {
                withAnimation {
                    viewModel.isShowingPlantDetail = false
                }
            } label: {
                Image(.exitMark)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 10, maxWidth: 20)
            }
        }
    }
    
    private func infoRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(Font.custom("Agdasima-Regular", size: 24))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Spacer()
            
            Text(value)
                .font(Font.custom("DotGothic16-Regular", size: 18))
        }
    }
}

#Preview {
    ZStack {
        Color(red: 27/255, green: 23/255, blue: 17/255, opacity: 0.8)
            .ignoresSafeArea()
        SelectPlantModal(viewModel: .init())
            .padding(.vertical, 120)
            .padding(.horizontal, 30)
    }
}
