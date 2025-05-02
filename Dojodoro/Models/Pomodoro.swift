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
    case medium = 45
    /// 60min
    case long = 60
}

@Observable
class Pomodoro {
    var restTime: RestTime
    var workTime: WorkTime
    var currentTime: Double = 0
    var iteration: Int
    var trilha: [Double] = []
    var actualTimeTrilha: Double {
        trilha[iteration]
    }
    
    init(restTime: RestTime = .mediumOne, workTime: WorkTime = .medium, Iteration: Int) {
        self.restTime = restTime
        self.workTime = workTime
        self.iteration = Iteration
        self.trilha = [Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), 5*Double(restTime.rawValue)]
    }
    
    var isRunning: Bool = false
    var isRecover: Bool = false

    var pomodoroSingleton =  PomodoroSingleton.shared
    
    func updateSettings() {
        self.trilha = [Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), Double(restTime.rawValue), Double(workTime.rawValue), 5*Double(restTime.rawValue)]
        iteration = 0
        currentTime =  Double(workTime.rawValue)
    }
}
