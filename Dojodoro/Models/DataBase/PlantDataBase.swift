//
//  PlantDataBase.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 18/06/25.
//

import Foundation
import SwiftData

@Model
class PlantDataBase {
    var id: UUID
    var name: String
    var experience: Int = 0
    var pomodoroCount: Int = 0
    var isSelected: Bool = false
    init(id: UUID = UUID(), name: String, experience: Int = 0, pomodoroCount: Int = 0, isSelected: Bool = false) {
        self.experience = experience
        self.id = id
        self.name = name
        self.pomodoroCount = pomodoroCount
        self.isSelected = isSelected
    }
}
