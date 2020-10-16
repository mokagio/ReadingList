import SwiftUI

struct BookList: View {

    @ObservedObject var viewModel = BookListViewModel()

    var body: some View {
        List(viewModel.books) { item in
            Text(item.title)
        }
    }
}

struct ToReadList: View {

    @ObservedObject var viewModel = ToReadListViewModel()

    var body: some View {
        List(viewModel.books) { item in
            VStack(alignment: .leading) {
                Text(item.book.title).bold()
                Text("Added: \(item.added)")
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
