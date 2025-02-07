//
//  TimeUnit.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 31/01/25.
//

import Foundation

enum TimeUnit: Int {
    case second = 1
    case decisecond = 10
    case custom = 20
    case centisecond = 100
    
    var value: Int {
        return self.rawValue
    }
}
