//
//  Preview.swift
//  
//
//  Created by Shunya Yamada on 2023/08/17.
//

import SwiftUI
import UIKit

#if DEBUG
public struct Preview<T: UIViewController>: View {
    let content: Wrapped<T>

    public var body: some View {
        content
    }

    public init(content: Wrapped<T>) {
        self.content = content
    }
}

public struct Wrapped<T: UIViewController>: UIViewControllerRepresentable {
    public typealias UIViewControllerType = T
    public var viewController: (() -> T)?

    public init(viewController: (() -> T)? = nil) {
        self.viewController = viewController
    }

    public func makeUIViewController(context: Context) -> T {
        viewController?() ?? T()
    }

    public func updateUIViewController(_ uiViewController: T, context: Context) {}
}
#endif
