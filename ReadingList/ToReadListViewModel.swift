import Combine

class ToReadListViewModel: ObservableObject {

    @Published var books = [Book].dummyFavorites
}

