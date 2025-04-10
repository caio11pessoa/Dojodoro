//
//  GardenView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct GardenView: View {
    @State var router: AppRouter

    var adaptiveColumns: [GridItem] {
        [GridItem(.adaptive(minimum: 140), spacing: 16)]
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("BGJardim")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    VStack(alignment: .leading, spacing: 0) {
                        ScrollView {
                            LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                                ForEach(GardenItems.allCases, id: \.self) { img in
                                    GardenItemCard(itemImage: img, isSelected: .constant(false))
                                        .frame(height: 250)
                                }
                            }
                            .frame(maxWidth: 700)
                            .padding(.horizontal)
                            .padding(.bottom, 32)
                            .frame(maxWidth: .infinity)
                        }
                        .scrollIndicators(.hidden)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        ZStack {
                            Text("私の庭")
                                .font(.dojoUI(.titleLargeDotGothic))
                                .opacity(0.10)
                            Text("Meu Jardim")
                                .font(.dojoUI(.titleMedium))
                                .bold()
                        }
                        .padding()
                        .padding(.bottom, 20)
                    }
                }
            }
        }
    }
}




#Preview {
    GardenView(router: AppRouter())
}
