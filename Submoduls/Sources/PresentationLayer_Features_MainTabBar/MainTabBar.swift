import SwiftUI
import DomainLayer
import PresentationLayer_Features_AllBreeds
import Networking
import DataLayer

public struct MainTabBar: View {
    
    public init() {}
    
    public var body: some View {
        TabView {
            allBreedsView
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            allBreedsView
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
    
    var allBreedsView: some View {
        let repository = BreedsRepository(service: WebService())
        let useCase = BreedsUseCase(repository: repository)
        let viewModel = BreedsViewModel(breedsUseCase: useCase)
        return BreedsView(viewModel: viewModel)
    }
    
    var favoriteImages: some View {
        EmptyView()
    }
}
