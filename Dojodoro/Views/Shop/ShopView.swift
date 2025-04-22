//
//  HomeView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct ShopView: View {
    
    var body: some View {
        ZStack {
            Image("BGJardim")
                .resizable()
                .ignoresSafeArea()
            ZStack {
                Text("間もなく...")
                    .font(.dojoUI(.titleLargeDotGothic))
                    .opacity(0.10)
                Text("Em breve...")
                    .font(.dojoUI(.titleMedium))
                    .bold()
            }
        }
    }
}

#Preview {
    NavigationStack{
        ShopView()
    }
}

#Preview {
    ContentView()
}
