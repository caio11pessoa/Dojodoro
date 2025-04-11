//
//  ShoppingItems.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 28/03/25.
//

import Foundation

enum GardenItems: String, CaseIterable {
    case Sprout
    case SproutLevelTwo
    case SproutLevelThree
    case Bonsai
    case Cherry
    case CherrySprount
    case CherrySprountLevelTwo
    case CherrySprountLevelThree
    case BlueBonsai
    case BlueBonsaiSprout
    case BlueBonsaiSproutLevelTwo
    case BlueBonsaiSproutLevelThree
    
    var displayName: String {
            switch self {
            case .Sprout, .SproutLevelTwo, .SproutLevelThree, .Bonsai:
                return "Sprout"
            case .Cherry, .CherrySprount, .CherrySprountLevelTwo, .CherrySprountLevelThree:
                return "Cherry"
            case .BlueBonsai, .BlueBonsaiSprout, .BlueBonsaiSproutLevelTwo, .BlueBonsaiSproutLevelThree:
                return "Blue Bonsai"
            }
    }
}
