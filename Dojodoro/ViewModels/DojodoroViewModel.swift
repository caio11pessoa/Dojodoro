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
    
    var clockText: String{
        formatTime(seconds: pomodoro.currentTime)
    }
    
    var progressCircle: Double = 0 // TODO: Tem que ficar em algum lugar mais interessante
    var sheetIsPresented: Bool = false
    
    var textColor: Color {Color(pomodoro.recover ? "TextColorPrimaryRest" :  "TextPomodoro")}
    var backgroundColor: Color {Color(pomodoro.recover ? "BackgroundRest" :  "Background")}
    
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
        
        pomodoro.currentTime = pomodoro.workTime.rawValue
        pomodoroSingleton.initialConfig(pomodoro) { clock, clockCentiSeconds, isRecover, isRunning in
            let pomodoroViewModel = self
            
            let pomodoro = pomodoroViewModel.pomodoro
            pomodoro.currentTime = clock
            pomodoro.recover = isRecover
            pomodoro.play = isRunning
            
            pomodoroViewModel.progressCircle = pomodoroViewModel.calculateProgressPercentage(
                totalWorkTime: isRecover ? pomodoro.restTime.rawValue :  pomodoro.workTime.rawValue,
                elapsedCentiSeconds: clockCentiSeconds
            )
        }
    }
    
    func startPomodoro() {
        self.pomodoro.play = true
        if pomodoro.recover {
            pomodoroSingleton.playRecover()
        }else {
            pomodoroSingleton.play()
        }
    }

    func pausePomodoro() {
        self.pomodoro.play = false
        pomodoroSingleton.pauseClock()
    }
    
    func stopPomodoro() {
        self.pomodoro.play = false
        pomodoroSingleton.pauseClock()
        pomodoroSingleton.resetClock()
        progressCircle = 0
    }
    
    //    func updateSettings() {
    //        pomodoro.workTime = workTime*60
    //                pomodoro.restTime = restTime*60
    //        pomodoroSingleton.updateClock(pomodoro: pomodoro)
    //        clockText = formatTime(seconds: workTime*60)
    //    }
    
}
