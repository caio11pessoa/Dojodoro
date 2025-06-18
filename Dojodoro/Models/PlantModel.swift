//
//  PlantModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI

@Observable
class PlantModel: Identifiable {
    
    var id: UUID = UUID()
    var pomodoroCount: Int = 0
    var experience: Int = 0
    var name: String
    
    var isSelected: Bool = false
    
    var stage: Stage {
        guard let time = totalTime.minute else {
            return .boonsaiSeed
        }
        if time < 1 {
            return .boonsaiSeed
        } else if time < 2 {
            return .sprout
        } else if time < 3 {
            return .bud
        } else {
            return .bonsai
        }
    }
    var totalTime: DateComponents {
        let hours = experience / 3600
        let minutes = (experience % 3600) / 60
        return DateComponents(hour: hours, minute: minutes)
    }
    var imageGallery: [Stage : String] = [.boonsaiSeed: "", .sprout: "", .bud: "", .bonsai: ""]
    var image: String {
        return imageGallery[stage] ?? ""
    }
    
    init(name: String, imageGallery: [Stage : String] = [:], isSelected: Bool = false, experience: Int = 0, pomodoroCount: Int = 0) {
        self.name = name
        self.imageGallery = imageGallery
        self.isSelected = isSelected
        self.experience = experience
        self.pomodoroCount = pomodoroCount
    }
}
