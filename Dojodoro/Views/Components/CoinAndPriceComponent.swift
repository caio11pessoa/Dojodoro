//
//  CoinAndPriceComponent.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 02/04/25.
//

import SwiftUI

struct CoinAndPriceComponent: View {
    var priceText: Int
    
    var body: some View {
        HStack(spacing: 2) {
            Image("buyIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 21)
                .offset(y: 1)
            Text(String(priceText))
                .font(Font.custom("DotGothic16-Regular", size: 20))
        }
    }
}

#Preview {
    CoinAndPriceComponent(priceText: 1200)
}
