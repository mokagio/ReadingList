import SwiftUI

struct BookList: View {

    let books: [Book]

    var body: some View {
        List(books) { item in
            NavigationLink(destination: BookDetail(book: item)) {
                Text(item.title)
            }
        }
    }
}

struct ToReadList: View {

    @EnvironmentObject var readingListController: ReadingListController

    var body: some View {
        List(readingListController.readingList) { item in
            VStack(alignment: .leading) {
                Text(item.book.title).bold()
                Text("Added: \(item.added)")
            }
        }
    }
}

struct BookDetail: View {

    let book: Book
    @EnvironmentObject var readingListController: ReadingListController

    var body: some View {
        VStack {
            Text(book.title)
            Text(book.author)
            if readingListController.isBookInList(book) {
                Button(action: { self.readingListController.remove(book) }) {
                    Text("Remove from reading list")
                }
            } else {
                Button(action: { self.readingListController.add(book) }) {
                    Text("Add to reading list")
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("I'll get to this later...")
    }
}
#endif
