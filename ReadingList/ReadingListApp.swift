import SwiftUI

class RootViewModel {

    let readingListController = ReadingListController()

    func makeBookListViewModel() -> BookListViewModel {
        return BookListViewModel(
            books: [Book].dummyAllBooks,
            viewForSelectedBook: { [unowned self] in
                BookDetail(viewModel: self.makeBookDetailViewModel(for: $0))
            }
        )
    }

    func makeBookDetailViewModel(for book: Book) -> BookDetailViewModel {
        return BookDetailViewModel(book: book, readingListController: readingListController)
    }

    func makeToReadListViewModel() -> ToReadListViewModel {
        return ToReadListViewModel(readingListController: readingListController)
    }
}

@main
struct ReadingListApp: App {

    let viewModel = RootViewModel()
    
    // Let's introduce a reason to redraw, to have the `body` var called again by SwiftUI engine
    @State var state: Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.state.toggle()
                    } label: {
                        Text("Simulate state change to cause redraw")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .background(state ? Color.blue : Color.yellow)
                
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
}
