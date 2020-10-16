import Foundation

struct Book {

    // TODO: Read from some API
    let title: String
    let author: String
}

extension Book: Identifiable {

    var id: String { title + author }
}

extension Array where Element == Book {

    static var dummyAllBooks: [Book] {
        [
            Book(title: "Humans", author: "Brandon Stanton"),
            Book(title: "It This Anything?", author: "Jerry Seinfield"),
            Book(title: "The 99% Invisible City", author: "Roman Mars"),
            Book(title: "Rage", author: "Bob Woodward"),
        ]
    }

    static var dummyFavorites: [Book] {
        [
            Book(title: "Humans", author: "Brandon Stanton"),
            Book(title: "Rage", author: "Bob Woodward"),
        ]
    }
}
