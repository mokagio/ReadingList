import Combine
import Foundation

class ReadingListController: ObservableObject {

    @Published private(set) var readingList: [BookToRead] = []

    func isBookInList(_ book: Book) -> Bool {
        return readingList.contains { $0.book.title == book.title }
    }

    func add(_ book: Book) {
        readingList.append(BookToRead(book: book, added: Date()))
    }

    func remove(_ book: Book) {
        readingList = readingList.filter { $0.book.title != book.title }
    }
}

