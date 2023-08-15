//
//  MajorScale.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// メジャースケール.
public struct MajorScale: Scale {
    public let root: Note
    public let notes: [ScaleDegree: Note]

    public var name: String {
        root.name + "Major"
    }
}

public extension MajorScale {
    /// ルート音を指定してメジャースケールを作成する.
    ///
    /// メジャースケールなので、ルートから順に `全全半全全全半` でずらしていって構成音を組み立てる.
    /// - Parameter root: メジャースケールのルート音.
    init(root: Note) {
        self.root = root
        notes = [
            .i: root,
            .ii: root.shift(2),
            .iii: root.shift(4),
            .iv: root.shift(5),
            .v: root.shift(7),
            .vi: root.shift(9),
            .vii: root.shift(11),
        ]
    }
}

extension MajorScale: CustomStringConvertible {
    public var description: String {
        name
    }
}
