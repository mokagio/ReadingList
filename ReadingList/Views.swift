import SwiftUI

struct BookList: View {

    @ObservedObject var viewModel = BookListViewModel()

    var body: some View {
        List(viewModel.books) { item in
            Text(item.title)
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
