import SwiftUI

@main
struct ReadingListApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    BookList()
                        .navigationTitle("Book 📚")
                }
                .tabItem { Text("All Books") }
            }
        }
    }
}
