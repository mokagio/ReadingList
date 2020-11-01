import SwiftUI

@main
struct ReadingListApp: App {

    let viewModelFactory = ViewModelFactory()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ToReadList(viewModel: viewModelFactory.makeToReadListViewModel())
                        .navigationTitle("To Read 📖")
                }
                .tabItem { Text("To Read") }

                NavigationView {
                    BookList(viewModel: viewModelFactory.makeBookListViewModel())
                        .navigationTitle("Books 📚")
                }
                .tabItem { Text("All Books") }
            }
        }
    }
}
