//
//  DojodoroViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI

@Observable
class DojodoroViewModel: PomodoroHelpers  {
    
    var plants: [PlantModel] = [
        .init(
            name: "Oak",
            imageGallery: [
                .boonsaiSeed: "Sprout",
                .sprout: "SproutLevelTwo",
                .bud: "SproutLevelThree",
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
                    .bud: "CherrySproutLevelThree",
                    .bonsai: "Cherry"
                ]
        ),
        .init(
            name: "Blue Bonsai",
            imageGallery: [
                .boonsaiSeed: "BlueBonsaiSprout",
                .sprout: "BlueBonsaiSproutLevelTwo",
                .bud: "BlueBonsaiSproutLevelThree",
                .bonsai: "BlueBonsai"
            ]
        )
    ]
    
    var isShowingPlantDetail: Bool = false
    
    var clickedPlant: PlantModel? // VM Específica
    
    var seletWorkTime: WorkTime = .medium // VM Específica
    var seletRestTime: RestTime = .mediumOne // VM Específica
    
    var selectedPlant: PlantModel {
        plants.first(where: { $0.isSelected }) ?? .init(name: "erro")
    }
    
    func selectPlant() {
        guard let clickedPlant else { return }
        
        for i in 0..<plants.count {
            plants[i].isSelected = (plants[i].id == clickedPlant.id)
        }
    }
    
    var pomodoro: Pomodoro = .init(Iteration: 0)
    
    var progressCircle: Double = 0 // TODO: Tem que ficar em algum lugar mais interessante
    var sheetIsPresented: Bool = false
    
    var textColor: Color {Color(pomodoro.isRecover ? "TextColorPrimaryRest" :  "TextPomodoro")}
    var backgroundColor: Color {Color(pomodoro.isRecover ? "BackgroundRest" :  "Background")}
    
    var pomodoroSingleton = PomodoroSingleton.shared
    
    override init() {
        
        super.init()
        seletWorkTime = pomodoro.workTime
        seletRestTime = pomodoro.restTime
        pomodoro.currentTime = Double(pomodoro.workTime.rawValue)
    }
    
    var tempoRestanteText: String { formatTime(seconds: pomodoro.currentTime) }
    
    func NextIteration() {
        selectedPlant.experience += Int(pomodoro.actualTimeTrilha)
        if pomodoro.isRecover {
            selectedPlant.pomodoroCount += 1
        }

        pomodoro.iteration += 1
        
        if pomodoro.iteration < pomodoro.trilha.count {
            
            pomodoroSingleton.configure(with: pomodoro.actualTimeTrilha)
            
            withAnimation {
                pomodoro.isRecover.toggle()
            }
            
        } else {
            stop()
        }
    }
    
    func startPomodoro() {
        
        pomodoroSingleton.configure(with: pomodoro.actualTimeTrilha)
        pomodoroSingleton.startClock { timeRamaining, isRunning in
            
            self.pomodoro.currentTime = timeRamaining
            
            var totalWorkTime: Double = self.pomodoro.isRecover ? Double(self.pomodoro.restTime.rawValue) : Double(self.pomodoro.workTime.rawValue)
            totalWorkTime = self.pomodoro.iteration == 7 ? totalWorkTime * 5 : totalWorkTime
            self.progressCircle = self.calculateProgressPercentage(totalWorkTime, elapsedCentiSeconds: timeRamaining)
            
            if !isRunning {
                self.NextIteration()
            }
        }
    }
    
    var pause: () -> Void {pomodoroSingleton.pause}
    var resume: () -> Void {pomodoroSingleton.resume}
    func stop() -> Void {
        progressCircle = 0
        pomodoro.iteration = 0
        pomodoro.isRecover = false
        pomodoroSingleton.stop()
    }
    
    func resetPomodoro() {
        pomodoroSingleton.resetConfig(with: pomodoro.currentTime)
    }
}
