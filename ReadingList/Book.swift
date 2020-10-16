import Foundation

struct Book {

    // TODO: Read from some API
    let title: String
    let author: String
}

extension Array where Element == Book {

    var dummyData: [Book] {
        [
            Book(title: "Humans", author: "Brandon Stanton"),
            Book(title: "It This Anything?", author: "Jerry Seinfield"),
            Book(title: "The 99% Invisible City", author: "Roman Mars"),
            Book(title: "Rage", author: "Bob Woodward"),
        ]
    }
}
