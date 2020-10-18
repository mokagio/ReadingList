import SwiftUI

class RootViewModel {

    let readingListController = ReadingListController()

    func makeBookListViewModel() -> BookListViewModel {
        return BookListViewModel(
            books: [Book].dummyAllBooks,
            viewForSelectedBook: { [unowned self] in
                BookDetail(viewModel: .init(book: $0, readingListController: readingListController))
            }
        )
    }

    func makeToReadListViewModel() -> ToReadListViewModel {
        return ToReadListViewModel(readingListController: readingListController)
    }
}

@main
struct ReadingListApp: App {

    let viewModel = RootViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ToReadList(viewModel: viewModel.makeToReadListViewModel())
                        .navigationTitle("To Read 📖")
                }
                .tabItem { Text("To Read") }

                NavigationView {
                    BookList(viewModel: viewModel.makeBookListViewModel())                       .navigationTitle("Books 📚")
                }
                .tabItem { Text("All Books") }
            }
        }
    }
}
