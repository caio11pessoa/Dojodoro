//
//  DojodoroViewModel.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 07/04/25.
//

import SwiftUI
import SwiftData

@Observable
class DojodoroViewModel: PomodoroHelpers  {
    
    var plantsDataBase: [PlantDataBase] = []
    var context: ModelContext?
    
    func loadPlants(context: ModelContext) {
        self.context = context
        
        let descriptor = FetchDescriptor<PlantDataBase>()
        do {
            plantsDataBase = try context.fetch(descriptor)
        } catch {
            print("Erro ao buscar plantas no banco: \(error)")
            return
        }
        
        if !plantsDataBase.isEmpty {
            plants = plantsDataBase.compactMap { plant in
                let imageGallery: [Stage: String]
                
                switch plant.name {
                case "Oak":
                    imageGallery = PomodoroImages.oak
                case "Cherry":
                    imageGallery = PomodoroImages.cherry
                case "Blue Bonsai":
                    imageGallery = PomodoroImages.blueBonsai
                default:
                    return nil
                }
                
                return PlantModel(
                    name: plant.name,
                    imageGallery: imageGallery,
                    isSelected: plant.isSelected,
                    experience: plant.experience,
                    pomodoroCount: plant.pomodoroCount
                )
            }
        } else {
            plants = [
                PlantModel(name: "Oak", imageGallery: PomodoroImages.oak, isSelected: true),
                PlantModel(name: "Cherry", imageGallery: PomodoroImages.cherry),
                PlantModel(name: "Blue Bonsai", imageGallery: PomodoroImages.blueBonsai)
            ]
            
            for plant in plants {
                let newPlant = PlantDataBase(
                    name: plant.name,
                    experience: plant.experience,
                    pomodoroCount: plant.pomodoroCount,
                    isSelected: plant.isSelected
                )
                context.insert(newPlant)
            }
            do {
                try context.save()
            } catch {
                print("Erro ao salvar novas plantas no banco: \(error)")
            }
        }
    }

    
    var plants: [PlantModel] = []
    
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
            if let plantInDatabase = try? self.context!.fetch(FetchDescriptor<PlantDataBase>()).first(where: { $0.name == plants[i].name }) {
                plantInDatabase.isSelected = plants[i].id == clickedPlant.id
                do {
                    try context!.save()
                } catch {
                    print("Erro ao salvar atualização da planta no banco: \(error)")
                }
            }
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
        if let plantInDatabase = try? self.context!.fetch(FetchDescriptor<PlantDataBase>()).first(where: { $0.name == selectedPlant.name }) {
            plantInDatabase.experience = selectedPlant.experience
            plantInDatabase.pomodoroCount = selectedPlant.pomodoroCount
            
            do {
                try context!.save()
            } catch {
                print("Erro ao salvar atualização da planta no banco: \(error)")
            }
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
