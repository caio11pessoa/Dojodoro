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
    var totalTime: DateComponents = DateComponents(hour: 0, minute: 0)
    var pomodoroCount: Int = 0
    var imageGallery: [Stage : String] = [.boonsaiSeed: "", .sprout: "", .bud: "", .bonsai: ""]
    var image: String {
        return imageGallery[stage] ?? ""
    }
    
    init(name: String, imageGallery: [Stage : String] = [:], isSelected: Bool = false) {
        self.name = name
        self.imageGallery = imageGallery
        self.isSelected = isSelected
    }
}
