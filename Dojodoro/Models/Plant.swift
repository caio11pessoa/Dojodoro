//
//  Plant.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 02/04/25.
//

import Foundation

enum PlantStage: String {
    case Seed
    case Sprout
    case Bud
    case Bonsai
}


class Plant: ObservableObject {
    var name: String
    @Published var stage: PlantStage
    @Published var pomodoroCount: Int
    @Published var totalTime: DateComponents
    @Published var isSelected: Bool
    var gardenItem: GardenItems
    init(name: String,gardenItem: GardenItems, stage: PlantStage = .Seed, pomodoroCount: Int = 0, totalTime: DateComponents = DateComponents(hour: 0, minute: 0), isSelected: Bool = false ) {
        self.name = name
        self.stage = stage
        self.pomodoroCount = pomodoroCount
        self.totalTime = totalTime
        self.isSelected = isSelected
        self.gardenItem = gardenItem
    }
}
