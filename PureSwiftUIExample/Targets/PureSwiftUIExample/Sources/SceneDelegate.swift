import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let readingListController = ReadingListController()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let view = TabView {
            NavigationView {
                ToReadList()
                    .navigationTitle("To Read 📖")
            }
            .tabItem { Text("To Read") }

            NavigationView {
                BookList(books: [Book].dummyAllBooks)
                    .navigationTitle("Books 📚")
            }
            .tabItem { Text("All Books") }
        }
        .environmentObject(readingListController)

        window?.rootViewController = UIHostingController(rootView: view)
        window?.makeKeyAndVisible()
    }
}
