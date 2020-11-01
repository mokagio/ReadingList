import Combine

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

        // This method is defined in a private extension below to DRY the code without having to
        // define a static function that could be accessed here when self is not yet available.
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
