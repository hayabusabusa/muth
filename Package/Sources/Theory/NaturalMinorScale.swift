//
//  NaturalMinorScale.swift
//  
//
//  Created by Shunya Yamada on 2023/08/16.
//

import Foundation

/// ナチュラルマイナースケール.
public struct NaturalMinorScale: Scale {
    public let root: Note
    public let notes: [ScaleDegree: Note]

    public var name: String {
        root.name + "Minor"
    }
}

public extension NaturalMinorScale {
    /// ルート音を指定してナチュラルマイナースケールを作成する.
    ///
    /// ナチュラルマイナースケールなので、ルートから順に `全半全全半全全` でずらしていって構成音を組み立てる.
    /// - Parameter root: マイナースケールのルート音.
    init(root: Note) {
        self.root = root
        notes = [
            .i: root,
            .ii: root.shift(2),
            .iii: root.shift(3),
            .iv: root.shift(5),
            .v: root.shift(7),
            .vi: root.shift(8),
            .vii: root.shift(10)
        ]
    }
}

extension NaturalMinorScale: CustomStringConvertible {
    public var description: String {
        name
    }
}
