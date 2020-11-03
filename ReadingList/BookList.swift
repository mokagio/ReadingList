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
