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
    var currentTime: Int = 0
    var Iteration: Int
    
    init(restTime: RestTime = .mediumOne, workTime: WorkTime = .medium, Iteration: Int) {
        self.restTime = restTime
        self.workTime = workTime
        self.Iteration = Iteration
    }
    
    var isRunning: Bool = false
    var isRecover: Bool = false
    
    func sync(_ isRunning: Bool, _ isRecover: Bool, _ currentTime: Int) {
        self.isRunning = isRunning
        self.isRecover = isRecover
        self.currentTime = currentTime
    }
    var pomodoroSingleton =  PomodoroSingleton.shared
    
    func updateSettings() {
        workTime = .shortOne
        restTime = .shortOne
//        print("seletRestTime \(seletRestTime)")
        currentTime =  workTime.rawValue
        pomodoroSingleton.updateClock(workTime: workTime.rawValue, restTime: restTime.rawValue)
    }
}
