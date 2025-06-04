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
    
    var isSelected: Bool = false
    var name: String
    
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
    var pomodoroCount: Int = 0
    var imageGallery: [Stage : String] = [.boonsaiSeed: "", .sprout: "", .bud: "", .bonsai: ""]
    var image: String {
        return imageGallery[stage] ?? ""
    }
    
    var experience: Int = 0
    
    init(name: String, imageGallery: [Stage : String] = [:], isSelected: Bool = false) {
        self.name = name
        self.imageGallery = imageGallery
        self.isSelected = isSelected
    }
}
