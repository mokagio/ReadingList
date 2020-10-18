import SwiftUI

struct BookList: View {

    @ObservedObject var viewModel: BookListViewModel

    var body: some View {
        List(viewModel.books) { item in
            NavigationLink(destination: viewModel.viewForSelectedBook(item)) {
                Text(item.title)
            }
        }
    }
}

struct ToReadList: View {

    @ObservedObject var viewModel: ToReadListViewModel

    var body: some View {
        List(viewModel.books) { item in
            VStack(alignment: .leading) {
                Text(item.book.title).bold()
                Text("Added: \(item.added)")
            }
        }
    }
}

struct BookDetail: View {

    @ObservedObject var viewModel: BookDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
            Text(viewModel.authors)
            Button(action: viewModel.addOrRemoveBook) {
                Text(viewModel.addOrRemoveButtonText)
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
