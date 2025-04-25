import SwiftUI

struct GardenView: View {
    @State var viewModel: DojodoroViewModel
    
    var adaptiveColumns: [GridItem] {
        [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]
    }
    
    var body: some View {
        ZStack {
            Image("BGJardim")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Text("私の庭")
                        .font(.dojoUI(.titleMediumDotGothic))
                        .opacity(0.10)
                    Text("Meu Jardim")
                        .font(.dojoUI(.titleMedium))
                        .bold()
                }
                .padding(.top, 40)
                
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                        ForEach($viewModel.plants, id: \.id) { $plant in
                            
                            GardenItemCard(
                                itemImage: plant.image,
                                name: plant.name,
                                isSelected: plant.isSelected
                            ){
                                withAnimation {
                                    viewModel.clickedPlant = plant
                                    viewModel.isShowingPlantDetail.toggle()
                                }
                            }
                        }
                        EmptyCard(text: "Em breve", textBackground: "間もなく")
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 32)
                .padding(.top)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationStack {
        GardenView(viewModel: .init())
            .ignoresSafeArea()
    }
}
#Preview {
    ContentView()
}
