//
//  SceneDelegate.swift
//  cinema-shift-2024
//
//  Created by Sergo on 02.02.2024.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let posterNavigationController = UINavigationController(rootViewController: PosterViewController())
        let ticketNavigationController = UINavigationController(rootViewController: TicketViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        posterNavigationController.tabBarItem = UITabBarItem(title: "Афиша", image: UIImage(systemName: "film.fill"), tag: 0)
        ticketNavigationController.tabBarItem = UITabBarItem(title: "Билеты", image: UIImage(systemName: "ticket.fill"), tag: 1)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), tag: 2)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [posterNavigationController, ticketNavigationController, profileNavigationController]
        tabBarController.tabBar.backgroundColor = UIColor(named: "tabBarBackGround-color")
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.tintColor = UIColor(named: "tabBarButton-color")

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
