import Combine

class BookListViewModel: ObservableObject {

    @Published var books = [Book].dummyAllBooks
}
