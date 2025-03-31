//
//  ShoppingPurchasedItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 28/03/25.
//

import SwiftUI

struct ShoppingPurchasedItemCard: View {
    let tapAction: (() -> Void)? = nil
    
    var body: some View {
        ZStack{
            Image(.emptyCard)
                .resizable()
            Group {
                Text("購入した") // TODO: Modificar para a fonte correta
                    .foregroundStyle(.gray.opacity(0.2))
                    .font(.system(size: 32, weight: .regular))
                    .padding(.horizontal, 16)
                Text("Comprado")
                    .font(.system(size: 22, weight: .light))
                    .padding(.horizontal, 28)
            }
            .minimumScaleFactor(0.5) //Ajusta as fontes de acordo com o espaço
            .lineLimit(1)
        }
        .onTapGesture(perform: tapAction ?? { })
    }
}

#Preview {
    ShoppingPurchasedItemCard()
        .frame(width: 200, height: 250)
}
