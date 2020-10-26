import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let viewModel = RootViewModel()

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
                ToReadList(viewModel: viewModel.makeToReadListViewModel())
                    .navigationTitle("To Read 📖")
            }
            .tabItem { Text("To Read") }

            NavigationView {
                BookList(viewModel: viewModel.makeBookListViewModel())
                    .navigationTitle("Books 📚")
            }
            .tabItem { Text("All Books") }
        }

        window?.rootViewController = UIHostingController(rootView: view)
        window?.makeKeyAndVisible()
    }
}
