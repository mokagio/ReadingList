import Foundation

struct BookToRead {
    let book: Book
    let added: Date
}

extension BookToRead: Identifiable {

    var id: String { book.id }
}
