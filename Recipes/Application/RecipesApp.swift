import SwiftUI
import Domain
import RecipesList
import Networking
import Data
@main

struct RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = RandomRecipesRepository(service: WebService())
            let viewModel = RecipesViewModel(repository: repository)
            RecipesView(viewModel: viewModel)
        }
    }
}
