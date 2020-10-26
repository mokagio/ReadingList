import Foundation

struct BookToRead {
    let book: Book
    let added: Date
}

extension BookToRead: Identifiable {

    var id: String { book.id }
}
struct Book {

    // TODO: Read from some API
    let title: String
    let author: String
}

extension Book: Identifiable {

    var id: String { title + author }
}

extension Array where Element == Book {

    static var humans: Book {
        Book(title: "Humans", author: "Brandon Stanton")
    }

    static var rage: Book {
        Book(title: "Rage", author: "Bob Woodward")
    }

    static var dummyAllBooks: [Book] {
        [
            humans,
            Book(title: "It This Anything?", author: "Jerry Seinfield"),
            Book(title: "The 99% Invisible City", author: "Roman Mars"),
            rage
        ]
    }

    static var dummyFavorites: [BookToRead] {
        [
            BookToRead(book: humans, added: Date()),
            BookToRead(book: rage, added: Date().addingTimeInterval(-7 * 24 * 60 * 60)),
        ]
    }
}

