import Combine

extension BookList {

    class ViewModel: ObservableObject {

        @Published var books: [Book]

        let viewForSelectedBook: (Book) -> BookDetail

        init(books: [Book] = [Book].dummyAllBooks, viewForSelectedBook: @escaping (Book) -> BookDetail) {
            self.books = books
            self.viewForSelectedBook = viewForSelectedBook
        }
    }
}
