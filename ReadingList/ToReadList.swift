import SwiftUI

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
