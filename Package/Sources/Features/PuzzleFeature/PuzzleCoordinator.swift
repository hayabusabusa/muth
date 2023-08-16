//
//  PuzzleCoordinator.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import Shared
import UIKit

public final class PuzzleCoordinator: PuzzleCoordinatorProtocol {
    public let fromViewController: UIViewController

    public init(fromViewController: UIViewController) {
        self.fromViewController = fromViewController
    }

    public func start() {
        let puzzleViewController = PuzzleViewController()
        (fromViewController as? UINavigationController)?.pushViewController(puzzleViewController, animated: false)
    }
}
