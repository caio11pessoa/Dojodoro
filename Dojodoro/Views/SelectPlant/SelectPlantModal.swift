//
//  SelectPlantModal.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 01/04/25.
//

import SwiftUI

struct SelectPlantModal: View {
    @Binding var isPresented: Bool
    @State var plant: PlantModel
    
    var body: some View {
        
        Image(.selectModal)
            .resizable()
            .overlay {
                
                VStack(spacing: 8){
                    headerView
                    
                    Spacer()
                    
                    Image(plant.image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 140, maxWidth: 175)
                        .padding(.bottom, 8)
                    
                    infoRow(title: "Estágio:", value: "\(plant.stage)")
                    infoRow(title: "Pomodoros Feitos:", value: "\(plant.pomodoroCount)")
                    infoRow(title: "Tempo Total:", value: "\(plant.totalTime.hour!)hrs e \(plant.totalTime.minute!)Min")
                    
                    // Botão
                    MojoButton(isSelected: $plant.isSelected){
                        withAnimation {
                            plant.isSelected.toggle()
                        }
                    }
                }
                .padding()
            }
            .frame(minWidth: 320, minHeight: 490)
    }
    
    private var headerView: some View {
        HStack {
            Text(plant.name)
                .font(Font.custom("DotGothic16-Regular", size: 28))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .scaledToFit()
            
            Spacer()
            
            Button {
                isPresented = false
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
        SelectPlantModal(isPresented: .constant(true), plant: .init(
            name: "Oak",
            imageGallery: [
                .boonsaiSeed: "Sprout",
                .sprout: "SproutLevelTwo",
                .bud: "SprooutLevelThree",
                .bonsai: "Bonsai"
            ]
        ))
        .padding(.vertical, 120)
        .padding(.horizontal, 30)
    }
}
