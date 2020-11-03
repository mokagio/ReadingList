import SwiftUI

struct BookList: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List(viewModel.books) { item in
            NavigationLink(destination: viewModel.viewForSelectedBook(item)) {
                Text(item.title)
            }
        }
    }
}
