//
//  DojodoroViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI

@Observable
class DojodoroViewModel: PomodoroHelpers  {
    var isShowingPlantDetail: Bool = false
    var clickedPlant: PlantModel?
    
    var selectedPlant: PlantModel {
        plants.first(where: { $0.isSelected }) ?? .init(name: "erro")
    }
    
    func selectPlant() {
        guard let clickedPlant else { return }
        
        for i in 0..<plants.count {
            plants[i].isSelected = (plants[i].id == clickedPlant.id)
        }
    }
    
    var pomodoro: Pomodoro = .init(Iteration: 1)
    
    var clockText: String = "" // TODO: Colocar na entidade Pomodoro
    var play: Bool = false // TODO: Colocar na entidade Pomodoro
    var progressCircle: Double = 0
    var sheetIsPresented: Bool = false
    var workTime: Int = 30 // TODO: Colocar na entidade Pomodoro
    var restTime: Int = 15 // TODO: Colocar na entidade Pomodoro
    var recover: Bool = false // TODO: Colocar na entidade Pomodoro
    
    var textColor: Color {Color(recover ? "TextColorPrimaryRest" :  "TextPomodoro")}
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
            ],
            isSelected: true
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
        
        clockText = formatTime(seconds: pomodoro.workTime.rawValue)
        
        pomodoroSingleton.initialConfig(pomodoro) { clock, clockCentiSeconds, recover, isRunning in
            let pomodoroViewModel = self
            
            pomodoroViewModel.clockText = pomodoroViewModel.formatTime(seconds: clock)
            pomodoroViewModel.recover = recover
            pomodoroViewModel.play = isRunning
            
            pomodoroViewModel.progressCircle = pomodoroViewModel.calculateProgressPercentage(
                totalWorkTime: recover ? pomodoroViewModel.pomodoro.restTime.rawValue :  pomodoroViewModel.pomodoro.workTime.rawValue,
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
        clockText = formatTime(seconds: pomodoro.workTime.rawValue)
        progressCircle = 0
    }
    
    func updateSettings() {
//        pomodoro.workTime = workTime*60
//        pomodoro.restTime = restTime*60
        pomodoroSingleton.updateClock(pomodoro: pomodoro)
        clockText = formatTime(seconds: workTime*60)
    }
    
}
