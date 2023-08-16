//
//  AppCoordinator.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import PuzzleFeature
import Shared
import UIKit

/// アプリ起動時の画面遷移をまとめる Coordinator.
public final class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let rootViewController: UIViewController

    private var puzzleCoordinator: PuzzleCoordinatorProtocol?

    public init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.puzzleCoordinator = PuzzleCoordinator(fromViewController: rootViewController)
    }

    public func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        puzzleCoordinator?.start()
    }
}
