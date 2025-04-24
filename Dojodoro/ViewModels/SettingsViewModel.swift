//
//  SettingsViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 24/04/25.
//

import SwiftUI

@Observable
class SettingsViewModel {
    enum SettingsPages {
        case options
        case ambientSound
        case restTime
        case workTime
    }
    var route: [SettingsPages] = [.options]
    
    var currentPage: SettingsPages {
        return route.last ?? .options
    }
    
    func goBack() {
        if(route.count > 0) {
            route.removeLast()
        }
    }
    
    func goTo(_ page: SettingsPages) {
        route.append(page)
    }
}
