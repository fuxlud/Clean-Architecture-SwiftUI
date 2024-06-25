import SwiftUI
import DomainMock
import DesignSystem
import RecipesScreen

struct RecipesView_Preview: PreviewProvider {
    static var previews: some View {
        let repositoryMock = RandomRecipesRepositoryMock()
        let viewModel = RecipesViewModel(repository: repositoryMock)
        RecipesView(viewModel: viewModel)
    }
}
