//
//  GardenItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 31/03/25.
//

import SwiftUI

struct GardenItemCard: View {
    let itemImage: String
    let name: String
    var isSelected: Bool
    var onTap: () -> Void = {}
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                Image(isSelected ? .emptyCardSelected : .emptyCard)
                    .resizable()
                
                Image(.checkMark)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaleEffect(isSelected ? 1 : 0.1)
                    .opacity(isSelected ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: isSelected)
            }
            
            itemImageView()
            
            VStack{
                
                itemNameLabel()
                
                Spacer()
                
            }
        }
        .onTapGesture(perform: onTap)
    }
    
    private func itemImageView() -> some View {
        Image(itemImage)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 62, maxWidth: 120)
            .padding(.horizontal, 28)
            .padding(.top, 40)
            .padding(.bottom, 20)
    }
    
    private func itemNameLabel() -> some View {
        Text(name)
            .font(.dojoUI(.body))
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .padding(.top, 12)
            .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var isSelected: Bool = false
    VStack(spacing: 8){
        HStack (spacing: 8){
            GardenItemCard(itemImage: DojodoroViewModel().plants[0].image,name:DojodoroViewModel().plants[0].name, isSelected: isSelected){
                isSelected.toggle()
            }
            GardenItemCard(itemImage: DojodoroViewModel().plants[1].image,name:DojodoroViewModel().plants[1].name, isSelected: isSelected){
                isSelected.toggle()
            }
            GardenItemCard(itemImage: DojodoroViewModel().plants[2].image,name:DojodoroViewModel().plants[2].name, isSelected: isSelected){
                isSelected.toggle()
            }
        }
        .padding()
        HStack (spacing: 8){
            GardenItemCard(itemImage: DojodoroViewModel().plants[0].image,name:DojodoroViewModel().plants[0].name, isSelected: isSelected){
                isSelected.toggle()
            }
            GardenItemCard(itemImage: DojodoroViewModel().plants[1].image,name:DojodoroViewModel().plants[1].name, isSelected: isSelected){
                isSelected.toggle()
            }
            GardenItemCard(itemImage: DojodoroViewModel().plants[2].image,name:DojodoroViewModel().plants[2].name, isSelected: isSelected){
                isSelected.toggle()
            }
        }
        .padding()
        GardenItemCard(itemImage: DojodoroViewModel().plants[1].image,name:DojodoroViewModel().plants[1].name, isSelected: isSelected){
            isSelected.toggle()
        }
        .padding()
        
    }
    .padding()
}
#Preview {
    GardenItemCard(itemImage: DojodoroViewModel().plants[0].image,name:DojodoroViewModel().plants[0].name, isSelected: false)
        .frame(width: 140, height: 190)
        .frame(width: 200, height: 343)
}
