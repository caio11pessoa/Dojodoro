//
//  UserConfiguration.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 27/06/25.
//

import Foundation
import SwiftData

@Model
class UserConfiguration {
    var soundSelect: String
    var workTime: Int
    var restTime: Int

    init(
        soundSelect: String = "Off",
        workTime: Int = 25,
        restTime: Int = 5
    ) {
        self.soundSelect = soundSelect
        self.workTime = workTime
        self.restTime = restTime
    }
}
