//
//  GardenView.swift
//  Dojodoro
//
//  Created by Daniel Araujo Nobre on 24/02/25.
//

import SwiftUI

struct GardenView: View {
    @State var router: AppRouter
    
    var body: some View {
        ZStack {
            Color(red: 27/255, green: 23/255, blue: 17/255, opacity: 0.8)
                .ignoresSafeArea()
            SelectPlantModal(isPresented: .constant(true), plant: .init(name: "Caio", gardenItem: .BlueBonsaiSprout, stage: .Bud, totalTime: DateComponents(hour: 0, minute: 0)))
                .padding(.vertical, 120)
                .padding(.horizontal, 30)
        }
    }
}
