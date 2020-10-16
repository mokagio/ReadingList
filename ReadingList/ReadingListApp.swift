import SwiftUI

@main
struct ReadingListApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ToReadList()
                        .navigationTitle("To Read 📖")
                }
                .tabItem { Text("To Read") }

                NavigationView {
                    BookList()
                        .navigationTitle("Books 📚")
                }
                .tabItem { Text("All Books") }
            }
        }
    }
}
