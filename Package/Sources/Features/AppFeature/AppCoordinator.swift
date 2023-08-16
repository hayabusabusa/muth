//
//  AppCoordinator.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import UIKit

/// アプリ起動時の画面遷移をまとめる Coordinator.
public final class AppCoordinator {
    private let window: UIWindow
    private let rootViewController: UIViewController

    public init(window: UIWindow) {
        self.window = window
        self.rootViewController = .init()
    }

    public func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
