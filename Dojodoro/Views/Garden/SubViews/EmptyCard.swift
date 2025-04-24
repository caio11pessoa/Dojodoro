//
//  ShoppingPurchasedItemCard.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 28/03/25.
//

import SwiftUI

struct EmptyCard: View {
    var tapAction: (() -> Void) = {}
    
    var text: String = "Comprado"
    var textBackground: String = "購入した"
    
    var body: some View {
        ZStack{
            Image(.emptyCard)
                .resizable()
            Group {
                Text(textBackground) // TODO: Modificar para a fonte correta
                    .foregroundStyle(.gray.opacity(0.2))
                    .font(.system(size: 32, weight: .regular))
                    .padding(.horizontal, 16)
                Text(text)
                    .font(.system(size: 22, weight: .light))
                    .padding(.horizontal, 28)
            }
            .minimumScaleFactor(0.5) //Ajusta as fontes de acordo com o espaço
            .lineLimit(1)
        }
        .onTapGesture(perform: tapAction)
    }
}

#Preview {
    EmptyCard()
        .frame(width: 200, height: 250)
}
