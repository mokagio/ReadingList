import Combine

class BookListViewModel: ObservableObject {

    @Published var books: [Book]

    let viewForSelectedBook: (Book) -> BookDetail

    init(books: [Book] = [Book].dummyAllBooks, viewForSelectedBook: @escaping (Book) -> BookDetail) {
        self.books = books
        self.viewForSelectedBook = viewForSelectedBook
    }
}

class BookDetailViewModel: ObservableObject {

    let title: String
    let authors: String
    @Published var addOrRemoveButtonText: String

    private let book: Book
    private let readingListController: ReadingListController

    init(book: Book, readingListController: ReadingListController) {
        title = book.title
        authors = book.author // TODO: Join authors
        self.book = book
        self.readingListController = readingListController
        addOrRemoveButtonText = readingListController.textForAddOrRemoveButton(for: book)
    }

    func addOrRemoveBook() {
        if readingListController.isBookInList(book) {
            readingListController.remove(book)
        } else {
            readingListController.add(book)
        }

        addOrRemoveButtonText = readingListController.textForAddOrRemoveButton(for: book)
    }
}

private extension ReadingListController {

    func textForAddOrRemoveButton(for book: Book) -> String {
        isBookInList(book) ? "Remove from reading list" : "Add to reading list"
    }
}

class ToReadListViewModel: ObservableObject {

    @Published var books: [BookToRead]

    var readingListController: ReadingListController

    private var cancellables = Set<AnyCancellable>()

    init(readingListController: ReadingListController) {
        self.readingListController = readingListController

        books = readingListController.readingList

        readingListController.$readingList.sink { [weak self] in
            self?.books = $0
        }
        .store(in: &cancellables)
    }
}

