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
    
    var seletWorkTime: WorkTime = .medium
    var seletRestTime: RestTime = .mediumOne
    
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
    
    var clockText: String { formatTime(seconds: pomodoro.currentTime) }
    
    var progressCircle: Double = 0 // TODO: Tem que ficar em algum lugar mais interessante
    var sheetIsPresented: Bool = false
    
    var textColor: Color {Color(pomodoro.isRecover ? "TextColorPrimaryRest" :  "TextPomodoro")}
    var backgroundColor: Color {Color(pomodoro.isRecover ? "BackgroundRest" :  "Background")}
    
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
        seletWorkTime = pomodoro.workTime
        seletRestTime = pomodoro.restTime
        pomodoro.currentTime = pomodoro.workTime.rawValue
        pomodoroSingleton.initialConfig(pomodoro) { clock, clockCentiSeconds, isRecover, isRunning in
            let pomodoroViewModel = self
            let pomodoro = pomodoroViewModel.pomodoro
            print("iteRestTime \(pomodoro.restTime.rawValue)")
            print("iteWorkTime \(pomodoro.workTime.rawValue)")
            pomodoro.sync(isRunning, isRecover, clock)
            
            let totalWorkTime: Int = isRecover ? pomodoro.restTime.rawValue : pomodoro.workTime.rawValue
            
            pomodoroViewModel.progressCircle = pomodoroViewModel.calculateProgressPercentage(totalWorkTime, elapsedCentiSeconds: clockCentiSeconds)
        }
        
    }
    var tempos: [Int] = [10, 5, 10, 5, 10, 50]
    var atualTempo: Int = 0
    func ProximoTempo() {
        atualTempo += 1
        if atualTempo >= tempos.count {
            atualTempo = 0
        }
        print("ProximoTempo \(tempos[atualTempo])")
        pomodoroSingleton.novaConfiguration(tempo: tempos[atualTempo])
        startPomodoro()
    }
    func startPomodoro() {
        pomodoroSingleton.novaConfiguration(tempo: tempos[0])
        pomodoroSingleton.comecarClock(tempos[atualTempo]) { tempoRestante, acabou in
            if acabou {
                self.ProximoTempo()
            }
        }
    }
    func pausarPomodoro() {
//        pomodoroSingleton
    }
    
    func pausePomodoro() {
        self.pomodoro.isRunning = false
        pomodoroSingleton.pauseClock()
        
    }
    
    func stopPomodoro() {
        self.pomodoro.isRunning = false
        pomodoroSingleton.pauseClock()
        pomodoroSingleton.resetClock()
        pomodoro.currentTime = pomodoro.workTime.rawValue
        progressCircle = 0
    }
    
//    func updateSettings() {
//        pomodoro.workTime = .shortOne
//        pomodoro.restTime = .shortOne
////        print("seletRestTime \(seletRestTime)")
//        pomodoro.currentTime =  pomodoro.workTime.rawValue
//        pomodoroSingleton.updateClock(workTime: pomodoro.workTime.rawValue, restTime: pomodoro.restTime.rawValue
//        )
//    }
}
