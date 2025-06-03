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
    case shortTwo = 600
    /// 15min
    case mediumOne = 900
    /// 20min
    case mediumTwo = 1200
    /// 25min
    case longOne = 1500
    /// 30min
    case longTwo = 1800
    
}

enum WorkTime: Int, CaseIterable {
    /// 25min
    case shortOne = 5
    /// 30min
    case shortTwo = 1800
    /// 45min
    case medium = 2700
    /// 60min
    case long = 3600
}

@Observable
class Pomodoro {
    var restTime: RestTime
    var bigRest: Int
    var workTime: WorkTime
    var currentTime: Double = 0
    var iteration: Int
    var trilha: [Double] = []
    var actualTimeTrilha: Double {
        trilha[iteration]
    }
    
    init(restTime: RestTime = .mediumOne, workTime: WorkTime = .medium, Iteration: Int) {
        self.restTime = restTime
        self.bigRest = 5 * restTime.rawValue
        self.workTime = workTime
        self.iteration = Iteration
        self.trilha = [
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), Double(bigRest)]
    }
    
    var isRunning: Bool = false
    var isRecover: Bool = false

    var pomodoroSingleton =  PomodoroSingleton.shared
    
    func updateSettings() {
        self.trilha = [
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), Double(restTime.rawValue),
            Double(workTime.rawValue), 5*Double(restTime.rawValue)
        ]
        iteration = 0
        isRecover = false
        currentTime =  Double(workTime.rawValue)
    }
}
