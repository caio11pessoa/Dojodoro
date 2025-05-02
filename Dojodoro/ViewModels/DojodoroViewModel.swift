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
    // Pausa pode cancelar tudo mas manter o contador
    var tempoRestanteText: String { formatTime(seconds: pomodoro.currentTime) }
    
    func ProximoTempo() {
        pomodoro.iteration += 1
        if pomodoro.iteration < pomodoro.trilha.count {
            print("ProximoTempo \(pomodoro.actualTimeTrilha)")
            pomodoroSingleton.novaConfiguration(tempo: pomodoro.actualTimeTrilha)
            startPomodoro()
            withAnimation {
                pomodoro.isRecover.toggle()
            }
        }
    }
    func startPomodoro() {
        pomodoro.isRunning = true
        pomodoroSingleton.startarClick()
        pomodoroSingleton.novaConfiguration(tempo: pomodoro.trilha[0])
        pomodoroSingleton.comecarClock(pomodoro.actualTimeTrilha) { tempoRestante, acabou in
            print("TempoRestante: \(self.pomodoro.currentTime)")
            self.pomodoro.currentTime = tempoRestante
            let totalWorkTime: Double = self.pomodoro.isRecover ? Double(self.pomodoro.restTime.rawValue) : Double(self.pomodoro.workTime.rawValue)
            self.progressCircle = self.calculateProgressPercentage(totalWorkTime, elapsedCentiSeconds: tempoRestante)
            if acabou {
                self.ProximoTempo()
            }
        }
    }
    
    func pausePomodoro() {
        pomodoroSingleton.pararClock()
    }
    
    func stopPomodoro() {
        pomodoroSingleton.pararClock()
    }
}
