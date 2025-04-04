//
//  ShoppingItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/03/25.
//

import SwiftUI

struct ShoppingItemCard: View {
    
    let itemImage: ShoppingItems
    let tapAction: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            Image(.emptyCard)
                .resizable()
            displayItemImage()
                .frame(minWidth: 40, maxWidth: 75)
                .padding(.vertical, 64)
            
            VStack {
                itemNameLabel()
                    .padding(8)
                Spacer()
                itemPriceView()
                    .padding(.bottom, 20)
            }
        }
        .onTapGesture(perform: tapAction ?? {})
    }
    
    private func itemNameLabel() -> some View {
        Text(itemImage.rawValue)
            .font(.dojoUI(.subheadline))
    }
    
    private func itemPriceView() -> some View {
        HStack(spacing: 4) {
            Image(.buyIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 22)
            Text("200")
                .font(.system(size: 22, weight: .light))
        }
    }
    
    
    private func displayItemImage() -> some View {
        
        let image: Image
        
        switch itemImage {
            
        case .cherry: image = Image(.cherryShadow)
        case .lake: image = Image(.lakeWithShadow)
        case .sakura: image = Image(.darkSakuraShadow)
        case .smallRock: image = Image(.rockComponentWithMusgo)
        case .largeRock: image = Image(.twoRocksWithShadow)
            
        }
        
        return image.resizable().scaledToFit()
    }
}

#Preview {
    VStack {
        HStack {
            ShoppingItemCard(itemImage: .cherry)
            ShoppingItemCard(itemImage: .lake)
        }
        HStack {
            ShoppingItemCard(itemImage: .sakura)
            ShoppingItemCard(itemImage: .smallRock)
        }
        ShoppingItemCard(itemImage: .largeRock)
    }
    .padding()
}

#Preview {
    ShoppingItemCard(itemImage: .cherry)
        .frame(width: 130, height: 184)
}
