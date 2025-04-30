//
//  Pomodoro.swift
//  pomodoroPOC
//
//  Created by Caio de Almeida Pessoa on 16/01/25.
//

import Foundation

enum RestTime: Int, CaseIterable {
    
    /// 5min
    case shortOne = 5
    /// 10min
    case shortTwo = 10
    /// 15min
    case mediumOne = 15
    /// 20min
    case mediumTwo = 20
    /// 25min
    case longOne = 25
    /// 30min
    case longTwo = 30
}

enum WorkTime: Int, CaseIterable {
    /// 25min
    case shortOne = 25
    /// 30min
    case shortTwo = 30
    /// 45min
    case Medium = 45
    /// 60min
    case Long = 60
}

struct Pomodoro {
    var restTime: RestTime = .mediumOne
    var workTime: WorkTime = .Medium
    var Iteration: Int
}
