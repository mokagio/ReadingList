import SwiftUI

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
