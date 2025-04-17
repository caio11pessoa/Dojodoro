//
//  DojodoroViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI

@Observable
class DojodoroViewModel: PomodoroHelpers  {
    var pomodoro: Pomodoro = .init(restTime: 5, workTime: 5, Iteration: 1)
    
    var clockText: String = ""
    var play: Bool = false
    var progressCircle: Double = 0
    var sheetIsPresented: Bool = false
    var workTime: Int = 30
    var restTime: Int = 15
    var recover: Bool = false
    
    var textColor: Color {Color(recover ? "TextColorPrimaryRest" :  "TextColorPrimary")}
    var backgroundColor: Color {Color(recover ? "BackgroundRest" :  "Background")}
    
    var pomodoroSingleton = PomodoroSingleton.shared
    
    var plants: [PlantModel] = [
        .init(
            name: "Oak",
            imageGallery: [
                .boonsaiSeed: "Sprout",
                .sprout: "SproutLevelTwo",
                .bud: "SprooutLevelThree",
                .bonsai: "Bonsai"
            ]
        ),
        .init(
            name: "Cherry",
            imageGallery:
                [
                    .boonsaiSeed: "CherrySprout",
                    .sprout: "CherrySproutLevelTwo",
                    .bud: "CherrySprooutLevelThree",
                    .bonsai: "Cherry"
                ]
        ),
        .init(
            name: "Blue Bonsai",
            imageGallery: [
                .boonsaiSeed: "BlueBonsaiSprout",
                .sprout: "BlueBonsaiSproutLevelTwo",
                .bud: "BlueBonsaiSprooutLevelThree",
                .bonsai: "BlueBonsai"
            ]
        )
    ]
    
    override init() {
        super.init()
        
        clockText = formatTime(seconds: pomodoro.workTime)
        
        pomodoroSingleton.initialConfig(pomodoro) { clock, clockCentiSeconds, recover, isRunning in
            let pomodoroViewModel = self
            
            pomodoroViewModel.clockText = pomodoroViewModel.formatTime(seconds: clock)
            pomodoroViewModel.recover = recover
            pomodoroViewModel.play = isRunning
            
            pomodoroViewModel.progressCircle = pomodoroViewModel.calculateProgressPercentage(
                totalWorkTime: recover ? pomodoroViewModel.pomodoro.restTime:  pomodoroViewModel.pomodoro.workTime,
                elapsedCentiSeconds: clockCentiSeconds
            )
        }
    }
    
    func startPomodoro() {
        self.play = true
        if recover {
            pomodoroSingleton.playRecover()
        }else {
            pomodoroSingleton.play()
        }
    }
    func pausePomodoro() {
        self.play = false
        pomodoroSingleton.pauseClock()
    }
    
    func stopPomodoro() {
        self.play = false
        pomodoroSingleton.pauseClock()
        pomodoroSingleton.resetClock()
        clockText = formatTime(seconds: pomodoro.workTime)
        progressCircle = 0
    }
    
    func updateSettings() {
        pomodoro.workTime = workTime*60
        pomodoro.restTime = restTime*60
        pomodoroSingleton.updateClock(pomodoro: pomodoro)
        clockText = formatTime(seconds: workTime*60)
    }
    
}
