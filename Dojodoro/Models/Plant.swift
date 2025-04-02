//
//  Plant.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 02/04/25.
//

import Foundation

class Plant: ObservableObject {
    var name: String
    @Published var stage: Int
    @Published var pomodoroCount: Int
    @Published var totalTime: Int
    @Published var isSelected: Bool
    
    init(name: String, stage: Int = 0, pomodoroCount: Int = 0, totalTime: Int = 0, isSelected: Bool = false) {
        self.name = name
        self.stage = stage
        self.pomodoroCount = pomodoroCount
        self.totalTime = totalTime
        self.isSelected = isSelected
    }
}
