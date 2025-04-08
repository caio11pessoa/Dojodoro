//
//  ContentView.swift
//  Dojodoro
//
//  Created by Caio de Almeida Pessoa on 04/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var router = AppRouter()
    
    var body: some View {
        NavigationStack(path: $router.path){
            ShopView(router: router)
                .navigationDestination(for: AppScreen.self) { screen in
                    switch screen {
                    case .loja:
                        ShopView(router: router)
                    case .bonsai:
                        BonsaiView(router: router, viewModel: .init()){}
                    case .jardim:
                        GardenView(router: router)
                    }
                }
        }
        .environment(router)
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
