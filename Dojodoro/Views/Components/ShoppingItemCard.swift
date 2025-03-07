//
//  ShoppingItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/03/25.
//

import SwiftUI


struct ShoppingItemCard: View {
    enum ShoppingItemImage {
        case cherry, lakeWithShadow, darkSakuraShadow, rockComponentWithMusgo, twoRocksWithShadow
    }
    
    let image: ShoppingItemImage
    @State var isSelected: Bool = false
    

    var body: some View {
        VStack {
            ZStack {
                cardBackground()
                plantImage()
            }
            .onTapGesture {
                withAnimation {
                    isSelected.toggle()
                }
            }
        }
    }
    
    private func plantImage() -> some View {
        switch image {
        case .cherry:
            return Image(.cherryShadow)
        case .lakeWithShadow:
            return Image(.lakeWithShadow)
        case .darkSakuraShadow:
            return Image(.darkSakuraShadow)
        case .rockComponentWithMusgo:
            return Image(.rockComponentWithMusgo)
        case .twoRocksWithShadow:
            return Image(.twoRocksWithShadow)
        }
    }
    
    private func cardBackground() -> some View {
        isSelected ? Image(.emptyCardSelected)  : Image(.emptyCard)
    }
}

#Preview {
    VStack{
        HStack{
            ShoppingItemCard(image: .cherry, isSelected: false)
            ShoppingItemCard(image: .lakeWithShadow, isSelected: false)
        }
        HStack {
            ShoppingItemCard(image: .darkSakuraShadow, isSelected: false)
            ShoppingItemCard(image: .rockComponentWithMusgo, isSelected: false)
        }
        ShoppingItemCard(image: .twoRocksWithShadow, isSelected: false)
    }
}
