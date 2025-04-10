//
//  GardenItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 31/03/25.
//

import SwiftUI

struct GardenItemCard: View {
    let itemImage: GardenItems
    @Binding var isSelected: Bool
    let onTap: (() -> Void)?
    
    init(itemImage: GardenItems, isSelected: Binding<Bool>, onTap: (() -> Void)? = nil) {
        self.itemImage = itemImage
        self._isSelected = isSelected
        self.onTap = onTap
    }
    
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
        .onTapGesture(perform: onTap ?? {})
    }
    
    private func itemImageView() -> some View {
        Image(itemImage.rawValue)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 62, maxWidth: 120)
            .padding(.horizontal, 28)
            .padding(.top, 40)
            .padding(.bottom, 20)
    }
    
    private func itemNameLabel() -> some View {
        Text(itemImage.displayName)
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
            Group {
                GardenItemCard(itemImage: .BlueBonsai, isSelected: $isSelected){
                    isSelected.toggle()
                }
                GardenItemCard(itemImage: .BlueBonsaiSprout, isSelected: .constant(false))
                GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
            }
        }
        Group{
            GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
            GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
            GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
            GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
        }
    }
    .padding()
}
#Preview {
    GardenItemCard(itemImage: .BlueBonsai, isSelected: .constant(false))
        .frame(width: 140, height: 190)
        .frame(width: 200, height: 343)
}
