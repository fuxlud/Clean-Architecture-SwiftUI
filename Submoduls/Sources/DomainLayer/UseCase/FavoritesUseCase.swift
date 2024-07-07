import Foundation
import Combine

public protocol FetchFavoritesUseCaseProtocol {
    func fetchFavorites() async -> [BreedDetailsEntity]
    var itemsPublisher: AnyPublisher<[BreedDetailsEntity], Never> { get }
}

public struct FetchFavoritesUseCase: FetchFavoritesUseCaseProtocol {
    private let repository: any BreedDetailsRepositoryProtocol

    public init(repository: any BreedDetailsRepositoryProtocol) {
        self.repository = repository
    }

    public func fetchFavorites() async -> [BreedDetailsEntity] {
        await Array(repository.fetchFavorites())
    }
    
    public var itemsPublisher: AnyPublisher<[BreedDetailsEntity], Never> {
        repository.itemsPublisher
            .map { items in
                items.filter { $0.isFavorite }
            }
            .eraseToAnyPublisher()
    }
}
